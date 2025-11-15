# A gt table contains the expected caption component

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{rrrrrrrrrrr}\n\\caption{test caption} \\\\ \n\\toprule\nmpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\\\ \n\\midrule\\addlinespace[2.5pt]\n21.0 & 6 & 160 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4 \\\\ \n21.0 & 6 & 160 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4 \\\\ \n22.8 & 4 & 108 & 93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1 \\\\ \n21.4 & 6 & 258 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1 \\\\ \n18.7 & 8 & 360 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

# A gt table contains the expected heading components

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{rrrrrrrrrrr}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  test title}\n} \\\\ \n\\toprule\nmpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\\\ \n\\midrule\\addlinespace[2.5pt]\n21.0 & 6 & 160 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4 \\\\ \n21.0 & 6 & 160 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4 \\\\ \n22.8 & 4 & 108 & 93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1 \\\\ \n21.4 & 6 & 258 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1 \\\\ \n18.7 & 8 & 360 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{rrrrrrrrrrr}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  test title} \\\\ \n{\\fontsize{14}{17}\\selectfont  test subtitle}\n} \\\\ \n\\toprule\nmpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\\\ \n\\midrule\\addlinespace[2.5pt]\n21.0 & 6 & 160 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4 \\\\ \n21.0 & 6 & 160 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4 \\\\ \n22.8 & 4 & 108 & 93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1 \\\\ \n21.4 & 6 & 258 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1 \\\\ \n18.7 & 8 & 360 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{rrrrrrrrrrr}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  test title}\n} \\\\ \n\\toprule\nmpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\\\ \n\\midrule\\addlinespace[2.5pt]\n21.0 & 6 & 160 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4 \\\\ \n21.0 & 6 & 160 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4 \\\\ \n22.8 & 4 & 108 & 93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1 \\\\ \n21.4 & 6 & 258 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1 \\\\ \n18.7 & 8 & 360 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{rrrrrrrrrrr}\n\\caption*{\n{\\fontsize{20}{25}\\selectfont  test title}\n} \\\\ \n\\toprule\nmpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\\\ \n\\midrule\\addlinespace[2.5pt]\n21.0 & 6 & 160 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4 \\\\ \n21.0 & 6 & 160 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4 \\\\ \n22.8 & 4 & 108 & 93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1 \\\\ \n21.4 & 6 & 258 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1 \\\\ \n18.7 & 8 & 360 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

# A gt table contains the expected column spanner labels

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{rrrr}\n\\toprule\n & \\multicolumn{2}{c}{perimeter} &  \\\\ \n\\cmidrule(lr){2-3}\narea & peri & shape & perm \\\\ \n\\midrule\\addlinespace[2.5pt]\n4990 & 2791.900 & 0.0903296 & 6.3 \\\\ \n7002 & 3892.600 & 0.1486220 & 6.3 \\\\ \n7558 & 3930.660 & 0.1833120 & 6.3 \\\\ \n7352 & 3869.320 & 0.1170630 & 6.3 \\\\ \n7943 & 3948.540 & 0.1224170 & 17.1 \\\\ \n7979 & 4010.150 & 0.1670450 & 17.1 \\\\ \n9333 & 4345.750 & 0.1896510 & 17.1 \\\\ \n8209 & 4344.750 & 0.1641270 & 17.1 \\\\ \n8393 & 3682.040 & 0.2036540 & 119.0 \\\\ \n6425 & 3098.650 & 0.1623940 & 119.0 \\\\ \n9364 & 4480.050 & 0.1509440 & 119.0 \\\\ \n8624 & 3986.240 & 0.1481410 & 119.0 \\\\ \n10651 & 4036.540 & 0.2285950 & 82.4 \\\\ \n8868 & 3518.040 & 0.2316230 & 82.4 \\\\ \n9417 & 3999.370 & 0.1725670 & 82.4 \\\\ \n8874 & 3629.070 & 0.1534810 & 82.4 \\\\ \n10962 & 4608.660 & 0.2043140 & 58.6 \\\\ \n10743 & 4787.620 & 0.2627270 & 58.6 \\\\ \n11878 & 4864.220 & 0.2000710 & 58.6 \\\\ \n9867 & 4479.410 & 0.1448100 & 58.6 \\\\ \n7838 & 3428.740 & 0.1138520 & 142.0 \\\\ \n11876 & 4353.140 & 0.2910290 & 142.0 \\\\ \n12212 & 4697.650 & 0.2400770 & 142.0 \\\\ \n8233 & 3518.440 & 0.1618650 & 142.0 \\\\ \n6360 & 1977.390 & 0.2808870 & 740.0 \\\\ \n4193 & 1379.350 & 0.1794550 & 740.0 \\\\ \n7416 & 1916.240 & 0.1918020 & 740.0 \\\\ \n5246 & 1585.420 & 0.1330830 & 740.0 \\\\ \n6509 & 1851.210 & 0.2252140 & 890.0 \\\\ \n4895 & 1239.660 & 0.3412730 & 890.0 \\\\ \n6775 & 1728.140 & 0.3116460 & 890.0 \\\\ \n7894 & 1461.060 & 0.2760160 & 890.0 \\\\ \n5980 & 1426.760 & 0.1976530 & 950.0 \\\\ \n5318 & 990.388 & 0.3266350 & 950.0 \\\\ \n7392 & 1350.760 & 0.1541920 & 950.0 \\\\ \n7894 & 1461.060 & 0.2760160 & 950.0 \\\\ \n3469 & 1376.700 & 0.1769690 & 100.0 \\\\ \n1468 & 476.322 & 0.4387120 & 100.0 \\\\ \n3524 & 1189.460 & 0.1635860 & 100.0 \\\\ \n5267 & 1644.960 & 0.2538320 & 100.0 \\\\ \n5048 & 941.543 & 0.3286410 & 1300.0 \\\\ \n1016 & 308.642 & 0.2300810 & 1300.0 \\\\ \n5605 & 1145.690 & 0.4641250 & 1300.0 \\\\ \n8793 & 2280.490 & 0.4204770 & 1300.0 \\\\ \n3475 & 1174.110 & 0.2007440 & 580.0 \\\\ \n1651 & 597.808 & 0.2626510 & 580.0 \\\\ \n5514 & 1455.880 & 0.1824530 & 580.0 \\\\ \n9718 & 1485.580 & 0.2004470 & 580.0 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{rrrr}\n\\toprule\n & \\multicolumn{2}{c}{perimeter} &  \\\\ \n\\cmidrule(lr){2-3}\narea & peri & shape & perm \\\\ \n\\midrule\\addlinespace[2.5pt]\n4990 & 2791.900 & 0.0903296 & 6.3 \\\\ \n7002 & 3892.600 & 0.1486220 & 6.3 \\\\ \n7558 & 3930.660 & 0.1833120 & 6.3 \\\\ \n7352 & 3869.320 & 0.1170630 & 6.3 \\\\ \n7943 & 3948.540 & 0.1224170 & 17.1 \\\\ \n7979 & 4010.150 & 0.1670450 & 17.1 \\\\ \n9333 & 4345.750 & 0.1896510 & 17.1 \\\\ \n8209 & 4344.750 & 0.1641270 & 17.1 \\\\ \n8393 & 3682.040 & 0.2036540 & 119.0 \\\\ \n6425 & 3098.650 & 0.1623940 & 119.0 \\\\ \n9364 & 4480.050 & 0.1509440 & 119.0 \\\\ \n8624 & 3986.240 & 0.1481410 & 119.0 \\\\ \n10651 & 4036.540 & 0.2285950 & 82.4 \\\\ \n8868 & 3518.040 & 0.2316230 & 82.4 \\\\ \n9417 & 3999.370 & 0.1725670 & 82.4 \\\\ \n8874 & 3629.070 & 0.1534810 & 82.4 \\\\ \n10962 & 4608.660 & 0.2043140 & 58.6 \\\\ \n10743 & 4787.620 & 0.2627270 & 58.6 \\\\ \n11878 & 4864.220 & 0.2000710 & 58.6 \\\\ \n9867 & 4479.410 & 0.1448100 & 58.6 \\\\ \n7838 & 3428.740 & 0.1138520 & 142.0 \\\\ \n11876 & 4353.140 & 0.2910290 & 142.0 \\\\ \n12212 & 4697.650 & 0.2400770 & 142.0 \\\\ \n8233 & 3518.440 & 0.1618650 & 142.0 \\\\ \n6360 & 1977.390 & 0.2808870 & 740.0 \\\\ \n4193 & 1379.350 & 0.1794550 & 740.0 \\\\ \n7416 & 1916.240 & 0.1918020 & 740.0 \\\\ \n5246 & 1585.420 & 0.1330830 & 740.0 \\\\ \n6509 & 1851.210 & 0.2252140 & 890.0 \\\\ \n4895 & 1239.660 & 0.3412730 & 890.0 \\\\ \n6775 & 1728.140 & 0.3116460 & 890.0 \\\\ \n7894 & 1461.060 & 0.2760160 & 890.0 \\\\ \n5980 & 1426.760 & 0.1976530 & 950.0 \\\\ \n5318 & 990.388 & 0.3266350 & 950.0 \\\\ \n7392 & 1350.760 & 0.1541920 & 950.0 \\\\ \n7894 & 1461.060 & 0.2760160 & 950.0 \\\\ \n3469 & 1376.700 & 0.1769690 & 100.0 \\\\ \n1468 & 476.322 & 0.4387120 & 100.0 \\\\ \n3524 & 1189.460 & 0.1635860 & 100.0 \\\\ \n5267 & 1644.960 & 0.2538320 & 100.0 \\\\ \n5048 & 941.543 & 0.3286410 & 1300.0 \\\\ \n1016 & 308.642 & 0.2300810 & 1300.0 \\\\ \n5605 & 1145.690 & 0.4641250 & 1300.0 \\\\ \n8793 & 2280.490 & 0.4204770 & 1300.0 \\\\ \n3475 & 1174.110 & 0.2007440 & 580.0 \\\\ \n1651 & 597.808 & 0.2626510 & 580.0 \\\\ \n5514 & 1455.880 & 0.1824530 & 580.0 \\\\ \n9718 & 1485.580 & 0.2004470 & 580.0 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{rrrrr}\n\\toprule\n & \\multicolumn{2}{c}{v\\_1\\_2} & \\multicolumn{2}{c}{v\\_4\\_5} \\\\ \n\\cmidrule(lr){2-3} \\cmidrule(lr){4-5}\nv\\_3 & v\\_1 & v\\_2 & v\\_4 & v\\_5 \\\\ \n\\midrule\\addlinespace[2.5pt]\n34.2 & 20.4 & 36.1 & 21.6 & 23.1 \\\\ \n13.7 & 25.8 & 14.3 & 12.9 & 75.9 \\\\ \n15.1 & 16.3 & 34.3 & 93.2 & 12.1 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rrrr}\n\\toprule\nA\\textsuperscript{\\textit{1}} & A & A\\textsuperscript{\\textit{1}} & A \\\\ \n\\cmidrule(lr){1-1} \\cmidrule(lr){2-2} \\cmidrule(lr){3-3} \\cmidrule(lr){4-4}\nA\\_X & B\\_X & A\\_Y & B\\_Y \\\\ \n\\midrule\\addlinespace[2.5pt]\n1 & 2 & 3 & 4 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\textsuperscript{\\textit{1}}note\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rrrr}\n\\toprule\n\\multicolumn{2}{c}{A\\textsuperscript{\\textit{1}}} & \\multicolumn{2}{c}{A} \\\\ \n\\cmidrule(lr){1-2} \\cmidrule(lr){3-4}\nA\\_X & A\\_Y & B\\_X & B\\_Y \\\\ \n\\midrule\\addlinespace[2.5pt]\n1 & 3 & 2 & 4 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\textsuperscript{\\textit{1}}note\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{rrrrc}\n\\toprule\n\\multicolumn{2}{c}{Sepal} &  &  &  \\\\ \n\\cmidrule(lr){1-2}\nLength & Width & Petal.Length & Petal.Width & Species \\\\ \n\\midrule\\addlinespace[2.5pt]\n5.1 & 3.5 & 1.4 & 0.2 & setosa \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

# A gt table contains the expected source note

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rrrrrrrrrrr}\n\\toprule\nmpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\\\ \n\\midrule\\addlinespace[2.5pt]\n21.0 & 6 & 160 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4 \\\\ \n21.0 & 6 & 160 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4 \\\\ \n22.8 & 4 & 108 & 93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1 \\\\ \n21.4 & 6 & 258 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1 \\\\ \n18.7 & 8 & 360 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\emph{Henderson and Velleman} (1981).\\\\\n\\end{minipage}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\setlength{\\LTpost}{0mm}\n\\begin{longtable}{rrrrrrrrrrr}\n\\toprule\nmpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\\\ \n\\midrule\\addlinespace[2.5pt]\n21.0 & 6 & 160 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4 \\\\ \n21.0 & 6 & 160 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4 \\\\ \n22.8 & 4 & 108 & 93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1 \\\\ \n21.4 & 6 & 258 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1 \\\\ \n18.7 & 8 & 360 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\begin{minipage}{\\linewidth}\n\\emph{Henderson and Velleman} (1981).\\\\\nThis was in Motor Trend magazine, hence the `mt`.\\\\\n\\end{minipage}\n\\endgroup\n"

# A gt table contains the correct placement of row groups

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrrrrrrrr}\n\\toprule\n & mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{12}{l}{Mazda} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nMazda RX4 & 21.0 & 6 & 160.0 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4 \\\\ \nMazda RX4 Wag & 21.0 & 6 & 160.0 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{12}{l}{\\rule{0pt}{0pt}} \\\\[-3.2ex] \n\\midrule\\addlinespace[2.5pt]\nDatsun 710 & 22.8 & 4 & 108.0 & 93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1 \\\\ \nHornet 4 Drive & 21.4 & 6 & 258.0 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1 \\\\ \nHornet Sportabout & 18.7 & 8 & 360.0 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2 \\\\ \nValiant & 18.1 & 6 & 225.0 & 105 & 2.76 & 3.460 & 20.22 & 1 & 0 & 3 & 1 \\\\ \nDuster 360 & 14.3 & 8 & 360.0 & 245 & 3.21 & 3.570 & 15.84 & 0 & 0 & 3 & 4 \\\\ \nMerc 240D & 24.4 & 4 & 146.7 & 62 & 3.69 & 3.190 & 20.00 & 1 & 0 & 4 & 2 \\\\ \nMerc 230 & 22.8 & 4 & 140.8 & 95 & 3.92 & 3.150 & 22.90 & 1 & 0 & 4 & 2 \\\\ \nMerc 280 & 19.2 & 6 & 167.6 & 123 & 3.92 & 3.440 & 18.30 & 1 & 0 & 4 & 4 \\\\ \nMerc 280C & 17.8 & 6 & 167.6 & 123 & 3.92 & 3.440 & 18.90 & 1 & 0 & 4 & 4 \\\\ \nMerc 450SE & 16.4 & 8 & 275.8 & 180 & 3.07 & 4.070 & 17.40 & 0 & 0 & 3 & 3 \\\\ \nMerc 450SL & 17.3 & 8 & 275.8 & 180 & 3.07 & 3.730 & 17.60 & 0 & 0 & 3 & 3 \\\\ \nMerc 450SLC & 15.2 & 8 & 275.8 & 180 & 3.07 & 3.780 & 18.00 & 0 & 0 & 3 & 3 \\\\ \nCadillac Fleetwood & 10.4 & 8 & 472.0 & 205 & 2.93 & 5.250 & 17.98 & 0 & 0 & 3 & 4 \\\\ \nLincoln Continental & 10.4 & 8 & 460.0 & 215 & 3.00 & 5.424 & 17.82 & 0 & 0 & 3 & 4 \\\\ \nChrysler Imperial & 14.7 & 8 & 440.0 & 230 & 3.23 & 5.345 & 17.42 & 0 & 0 & 3 & 4 \\\\ \nFiat 128 & 32.4 & 4 & 78.7 & 66 & 4.08 & 2.200 & 19.47 & 1 & 1 & 4 & 1 \\\\ \nHonda Civic & 30.4 & 4 & 75.7 & 52 & 4.93 & 1.615 & 18.52 & 1 & 1 & 4 & 2 \\\\ \nToyota Corolla & 33.9 & 4 & 71.1 & 65 & 4.22 & 1.835 & 19.90 & 1 & 1 & 4 & 1 \\\\ \nToyota Corona & 21.5 & 4 & 120.1 & 97 & 3.70 & 2.465 & 20.01 & 1 & 0 & 3 & 1 \\\\ \nDodge Challenger & 15.5 & 8 & 318.0 & 150 & 2.76 & 3.520 & 16.87 & 0 & 0 & 3 & 2 \\\\ \nAMC Javelin & 15.2 & 8 & 304.0 & 150 & 3.15 & 3.435 & 17.30 & 0 & 0 & 3 & 2 \\\\ \nCamaro Z28 & 13.3 & 8 & 350.0 & 245 & 3.73 & 3.840 & 15.41 & 0 & 0 & 3 & 4 \\\\ \nPontiac Firebird & 19.2 & 8 & 400.0 & 175 & 3.08 & 3.845 & 17.05 & 0 & 0 & 3 & 2 \\\\ \nFiat X1-9 & 27.3 & 4 & 79.0 & 66 & 4.08 & 1.935 & 18.90 & 1 & 1 & 4 & 1 \\\\ \nPorsche 914-2 & 26.0 & 4 & 120.3 & 91 & 4.43 & 2.140 & 16.70 & 0 & 1 & 5 & 2 \\\\ \nLotus Europa & 30.4 & 4 & 95.1 & 113 & 3.77 & 1.513 & 16.90 & 1 & 1 & 5 & 2 \\\\ \nFord Pantera L & 15.8 & 8 & 351.0 & 264 & 4.22 & 3.170 & 14.50 & 0 & 1 & 5 & 4 \\\\ \nFerrari Dino & 19.7 & 6 & 145.0 & 175 & 3.62 & 2.770 & 15.50 & 0 & 1 & 5 & 6 \\\\ \nMaserati Bora & 15.0 & 8 & 301.0 & 335 & 3.54 & 3.570 & 14.60 & 0 & 1 & 5 & 8 \\\\ \nVolvo 142E & 21.4 & 4 & 121.0 & 109 & 4.11 & 2.780 & 18.60 & 1 & 1 & 4 & 2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrrrrrrrr}\n\\toprule\n & mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{12}{l}{\\rule{0pt}{0pt}} \\\\[-3.2ex] \n\\midrule\\addlinespace[2.5pt]\nDatsun 710 & 22.8 & 4 & 108.0 & 93 & 3.85 & 2.320 & 18.61 & 1 & 1 & 4 & 1 \\\\ \nHornet 4 Drive & 21.4 & 6 & 258.0 & 110 & 3.08 & 3.215 & 19.44 & 1 & 0 & 3 & 1 \\\\ \nHornet Sportabout & 18.7 & 8 & 360.0 & 175 & 3.15 & 3.440 & 17.02 & 0 & 0 & 3 & 2 \\\\ \nValiant & 18.1 & 6 & 225.0 & 105 & 2.76 & 3.460 & 20.22 & 1 & 0 & 3 & 1 \\\\ \nDuster 360 & 14.3 & 8 & 360.0 & 245 & 3.21 & 3.570 & 15.84 & 0 & 0 & 3 & 4 \\\\ \nCadillac Fleetwood & 10.4 & 8 & 472.0 & 205 & 2.93 & 5.250 & 17.98 & 0 & 0 & 3 & 4 \\\\ \nLincoln Continental & 10.4 & 8 & 460.0 & 215 & 3.00 & 5.424 & 17.82 & 0 & 0 & 3 & 4 \\\\ \nChrysler Imperial & 14.7 & 8 & 440.0 & 230 & 3.23 & 5.345 & 17.42 & 0 & 0 & 3 & 4 \\\\ \nFiat 128 & 32.4 & 4 & 78.7 & 66 & 4.08 & 2.200 & 19.47 & 1 & 1 & 4 & 1 \\\\ \nHonda Civic & 30.4 & 4 & 75.7 & 52 & 4.93 & 1.615 & 18.52 & 1 & 1 & 4 & 2 \\\\ \nToyota Corolla & 33.9 & 4 & 71.1 & 65 & 4.22 & 1.835 & 19.90 & 1 & 1 & 4 & 1 \\\\ \nToyota Corona & 21.5 & 4 & 120.1 & 97 & 3.70 & 2.465 & 20.01 & 1 & 0 & 3 & 1 \\\\ \nDodge Challenger & 15.5 & 8 & 318.0 & 150 & 2.76 & 3.520 & 16.87 & 0 & 0 & 3 & 2 \\\\ \nAMC Javelin & 15.2 & 8 & 304.0 & 150 & 3.15 & 3.435 & 17.30 & 0 & 0 & 3 & 2 \\\\ \nCamaro Z28 & 13.3 & 8 & 350.0 & 245 & 3.73 & 3.840 & 15.41 & 0 & 0 & 3 & 4 \\\\ \nPontiac Firebird & 19.2 & 8 & 400.0 & 175 & 3.08 & 3.845 & 17.05 & 0 & 0 & 3 & 2 \\\\ \nFiat X1-9 & 27.3 & 4 & 79.0 & 66 & 4.08 & 1.935 & 18.90 & 1 & 1 & 4 & 1 \\\\ \nPorsche 914-2 & 26.0 & 4 & 120.3 & 91 & 4.43 & 2.140 & 16.70 & 0 & 1 & 5 & 2 \\\\ \nLotus Europa & 30.4 & 4 & 95.1 & 113 & 3.77 & 1.513 & 16.90 & 1 & 1 & 5 & 2 \\\\ \nFord Pantera L & 15.8 & 8 & 351.0 & 264 & 4.22 & 3.170 & 14.50 & 0 & 1 & 5 & 4 \\\\ \nFerrari Dino & 19.7 & 6 & 145.0 & 175 & 3.62 & 2.770 & 15.50 & 0 & 1 & 5 & 6 \\\\ \nMaserati Bora & 15.0 & 8 & 301.0 & 335 & 3.54 & 3.570 & 14.60 & 0 & 1 & 5 & 8 \\\\ \nVolvo 142E & 21.4 & 4 & 121.0 & 109 & 4.11 & 2.780 & 18.60 & 1 & 1 & 4 & 2 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{12}{l}{Mazda} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nMazda RX4 & 21.0 & 6 & 160.0 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4 \\\\ \nMazda RX4 Wag & 21.0 & 6 & 160.0 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{12}{l}{Mercs} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nMerc 240D & 24.4 & 4 & 146.7 & 62 & 3.69 & 3.190 & 20.00 & 1 & 0 & 4 & 2 \\\\ \nMerc 230 & 22.8 & 4 & 140.8 & 95 & 3.92 & 3.150 & 22.90 & 1 & 0 & 4 & 2 \\\\ \nMerc 280 & 19.2 & 6 & 167.6 & 123 & 3.92 & 3.440 & 18.30 & 1 & 0 & 4 & 4 \\\\ \nMerc 280C & 17.8 & 6 & 167.6 & 123 & 3.92 & 3.440 & 18.90 & 1 & 0 & 4 & 4 \\\\ \nMerc 450SE & 16.4 & 8 & 275.8 & 180 & 3.07 & 4.070 & 17.40 & 0 & 0 & 3 & 3 \\\\ \nMerc 450SL & 17.3 & 8 & 275.8 & 180 & 3.07 & 3.730 & 17.60 & 0 & 0 & 3 & 3 \\\\ \nMerc 450SLC & 15.2 & 8 & 275.8 & 180 & 3.07 & 3.780 & 18.00 & 0 & 0 & 3 & 3 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

