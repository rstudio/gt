# Using summary rows in LaTeX tables is correct

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrll}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 & row & group \\\\ \n\\midrule\\addlinespace[2.5pt]\n & 767.6 & 928.1 & 382.0 & 674.5 & one & first\\_five \\\\ \n & 403.3 & 461.5 & 15.1 & 242.8 & two & first\\_five \\\\ \n & 686.4 & 54.1 & 282.7 & 56.3 & three & first\\_five \\\\ \n & 662.6 & 148.8 & 984.6 & 928.1 & four & first\\_five \\\\ \n & 198.5 & 65.1 & 127.4 & 219.3 & five & first\\_five \\\\ \n & 132.1 & 118.1 & 91.2 & 874.3 & six & 2nd\\_five \\\\ \n & 349.7 & 307.1 & 566.7 & 542.9 & seven & 2nd\\_five \\\\ \n & 63.7 & 504.3 & 152.0 & 724.5 & eight & 2nd\\_five \\\\ \n & 105.4 & 729.8 & 962.4 & 336.4 & nine & 2nd\\_five \\\\ \n & 924.2 & 424.6 & 740.8 & 104.2 & ten & 2nd\\_five \\\\ \n\\midrule \n\\midrule \naverage & 429.35 & — & — & — & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrl}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 & group \\\\ \n\\midrule\\addlinespace[2.5pt]\none & 767.6 & 928.1 & 382.0 & 674.5 & first\\_five \\\\ \ntwo & 403.3 & 461.5 & 15.1 & 242.8 & first\\_five \\\\ \nthree & 686.4 & 54.1 & 282.7 & 56.3 & first\\_five \\\\ \nfour & 662.6 & 148.8 & 984.6 & 928.1 & first\\_five \\\\ \nfive & 198.5 & 65.1 & 127.4 & 219.3 & first\\_five \\\\ \nsix & 132.1 & 118.1 & 91.2 & 874.3 & 2nd\\_five \\\\ \nseven & 349.7 & 307.1 & 566.7 & 542.9 & 2nd\\_five \\\\ \neight & 63.7 & 504.3 & 152.0 & 724.5 & 2nd\\_five \\\\ \nnine & 105.4 & 729.8 & 962.4 & 336.4 & 2nd\\_five \\\\ \nten & 924.2 & 424.6 & 740.8 & 104.2 & 2nd\\_five \\\\ \n\\midrule \n\\midrule \naverage & 429.35 & — & — & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrl}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 767.6 & 928.1 & 382.0 & 674.5 & one \\\\ \n & 403.3 & 461.5 & 15.1 & 242.8 & two \\\\ \n & 686.4 & 54.1 & 282.7 & 56.3 & three \\\\ \n & 662.6 & 148.8 & 984.6 & 928.1 & four \\\\ \n & 198.5 & 65.1 & 127.4 & 219.3 & five \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 132.1 & 118.1 & 91.2 & 874.3 & six \\\\ \n & 349.7 & 307.1 & 566.7 & 542.9 & seven \\\\ \n & 63.7 & 504.3 & 152.0 & 724.5 & eight \\\\ \n & 105.4 & 729.8 & 962.4 & 336.4 & nine \\\\ \n & 924.2 & 424.6 & 740.8 & 104.2 & ten \\\\ \n\\midrule \n\\midrule \naverage & 429.35 & — & — & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrr}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\none & 767.6 & 928.1 & 382.0 & 674.5 \\\\ \ntwo & 403.3 & 461.5 & 15.1 & 242.8 \\\\ \nthree & 686.4 & 54.1 & 282.7 & 56.3 \\\\ \nfour & 662.6 & 148.8 & 984.6 & 928.1 \\\\ \nfive & 198.5 & 65.1 & 127.4 & 219.3 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nsix & 132.1 & 118.1 & 91.2 & 874.3 \\\\ \nseven & 349.7 & 307.1 & 566.7 & 542.9 \\\\ \neight & 63.7 & 504.3 & 152.0 & 724.5 \\\\ \nnine & 105.4 & 729.8 & 962.4 & 336.4 \\\\ \nten & 924.2 & 424.6 & 740.8 & 104.2 \\\\ \n\\midrule \n\\midrule \naverage & 429.35 & — & — & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrl}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 767.6 & 928.1 & 382.0 & 674.5 & one \\\\ \n & 403.3 & 461.5 & 15.1 & 242.8 & two \\\\ \n & 686.4 & 54.1 & 282.7 & 56.3 & three \\\\ \n & 662.6 & 148.8 & 984.6 & 928.1 & four \\\\ \n & 198.5 & 65.1 & 127.4 & 219.3 & five \\\\ \n\\midrule \naverage & 543.68 & — & — & — & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 132.1 & 118.1 & 91.2 & 874.3 & six \\\\ \n & 349.7 & 307.1 & 566.7 & 542.9 & seven \\\\ \n & 63.7 & 504.3 & 152.0 & 724.5 & eight \\\\ \n & 105.4 & 729.8 & 962.4 & 336.4 & nine \\\\ \n & 924.2 & 424.6 & 740.8 & 104.2 & ten \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrr}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\none & 767.6 & 928.1 & 382.0 & 674.5 \\\\ \ntwo & 403.3 & 461.5 & 15.1 & 242.8 \\\\ \nthree & 686.4 & 54.1 & 282.7 & 56.3 \\\\ \nfour & 662.6 & 148.8 & 984.6 & 928.1 \\\\ \nfive & 198.5 & 65.1 & 127.4 & 219.3 \\\\ \n\\midrule \naverage & 543.68 & — & — & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nsix & 132.1 & 118.1 & 91.2 & 874.3 \\\\ \nseven & 349.7 & 307.1 & 566.7 & 542.9 \\\\ \neight & 63.7 & 504.3 & 152.0 & 724.5 \\\\ \nnine & 105.4 & 729.8 & 962.4 & 336.4 \\\\ \nten & 924.2 & 424.6 & 740.8 & 104.2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrl}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 767.6 & 928.1 & 382.0 & 674.5 & one \\\\ \n & 403.3 & 461.5 & 15.1 & 242.8 & two \\\\ \n & 686.4 & 54.1 & 282.7 & 56.3 & three \\\\ \n & 662.6 & 148.8 & 984.6 & 928.1 & four \\\\ \n & 198.5 & 65.1 & 127.4 & 219.3 & five \\\\ \n\\midrule \naverage & 543.68 & — & 358.36 & — & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 132.1 & 118.1 & 91.2 & 874.3 & six \\\\ \n & 349.7 & 307.1 & 566.7 & 542.9 & seven \\\\ \n & 63.7 & 504.3 & 152.0 & 724.5 & eight \\\\ \n & 105.4 & 729.8 & 962.4 & 336.4 & nine \\\\ \n & 924.2 & 424.6 & 740.8 & 104.2 & ten \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrl}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 767.6 & 928.1 & 382.0 & 674.5 & one \\\\ \n & 403.3 & 461.5 & 15.1 & 242.8 & two \\\\ \n & 686.4 & 54.1 & 282.7 & 56.3 & three \\\\ \n & 662.6 & 148.8 & 984.6 & 928.1 & four \\\\ \n & 198.5 & 65.1 & 127.4 & 219.3 & five \\\\ \n\\midrule \naverage & 543.68 & — & 358.36 & 424.20 & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 132.1 & 118.1 & 91.2 & 874.3 & six \\\\ \n & 349.7 & 307.1 & 566.7 & 542.9 & seven \\\\ \n & 63.7 & 504.3 & 152.0 & 724.5 & eight \\\\ \n & 105.4 & 729.8 & 962.4 & 336.4 & nine \\\\ \n & 924.2 & 424.6 & 740.8 & 104.2 & ten \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrl}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 767.6 & 928.1 & 382.0 & 674.5 & one \\\\ \n & 403.3 & 461.5 & 15.1 & 242.8 & two \\\\ \n & 686.4 & 54.1 & 282.7 & 56.3 & three \\\\ \n & 662.6 & 148.8 & 984.6 & 928.1 & four \\\\ \n & 198.5 & 65.1 & 127.4 & 219.3 & five \\\\ \n\\midrule \naverage & 543.68 & 331.52 & 358.36 & 424.20 & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 132.1 & 118.1 & 91.2 & 874.3 & six \\\\ \n & 349.7 & 307.1 & 566.7 & 542.9 & seven \\\\ \n & 63.7 & 504.3 & 152.0 & 724.5 & eight \\\\ \n & 105.4 & 729.8 & 962.4 & 336.4 & nine \\\\ \n & 924.2 & 424.6 & 740.8 & 104.2 & ten \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrr}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\none & 767.6 & 928.1 & 382.0 & 674.5 \\\\ \ntwo & 403.3 & 461.5 & 15.1 & 242.8 \\\\ \nthree & 686.4 & 54.1 & 282.7 & 56.3 \\\\ \nfour & 662.6 & 148.8 & 984.6 & 928.1 \\\\ \nfive & 198.5 & 65.1 & 127.4 & 219.3 \\\\ \n\\midrule \naverage & 543.68 & — & 358.36 & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nsix & 132.1 & 118.1 & 91.2 & 874.3 \\\\ \nseven & 349.7 & 307.1 & 566.7 & 542.9 \\\\ \neight & 63.7 & 504.3 & 152.0 & 724.5 \\\\ \nnine & 105.4 & 729.8 & 962.4 & 336.4 \\\\ \nten & 924.2 & 424.6 & 740.8 & 104.2 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrrl}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 & row \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 767.6 & 928.1 & 382.0 & 674.5 & one \\\\ \n & 403.3 & 461.5 & 15.1 & 242.8 & two \\\\ \n & 686.4 & 54.1 & 282.7 & 56.3 & three \\\\ \n & 662.6 & 148.8 & 984.6 & 928.1 & four \\\\ \n & 198.5 & 65.1 & 127.4 & 219.3 & five \\\\ \n\\midrule \naverage & 543.68 & — & — & 424.20 & — \\\\ \nmin & — & 54.10 & — & — & — \\\\ \ncount & — & — & 5 & — & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{6}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\n & 132.1 & 118.1 & 91.2 & 874.3 & six \\\\ \n & 349.7 & 307.1 & 566.7 & 542.9 & seven \\\\ \n & 63.7 & 504.3 & 152.0 & 724.5 & eight \\\\ \n & 105.4 & 729.8 & 962.4 & 336.4 & nine \\\\ \n & 924.2 & 424.6 & 740.8 & 104.2 & ten \\\\ \n\\midrule \nmax & — & — & — & 874.30 & — \\\\ \ncount & — & — & 5 & — & — \\\\ \n\\midrule \n\\midrule \nMEAN & 429.35 & 374.15 & 430.49 & 470.33 & — \\\\ \nMIN & 63.70 & 54.10 & 15.10 & 56.30 & — \\\\ \nMAX & 924.20 & 928.10 & 984.60 & 928.10 & — \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

---

    Code
      as.character(as_latex(gt_tbl))
    Output
      [1] "\\begingroup\n\\begin{longtable}{l|rrrr}\n\\toprule\n & col\\_1 & col\\_2 & col\\_3 & col\\_4 \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{first\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\none & 767.6 & 928.1 & 382.0 & 674.5 \\\\ \ntwo & 403.3 & 461.5 & 15.1 & 242.8 \\\\ \nthree & 686.4 & 54.1 & 282.7 & 56.3 \\\\ \nfour & 662.6 & 148.8 & 984.6 & 928.1 \\\\ \nfive & 198.5 & 65.1 & 127.4 & 219.3 \\\\ \n\\midrule \naverage & 543.68 & — & — & 424.20 \\\\ \nmin & — & 54.10 & — & — \\\\ \ncount & — & — & 5 & — \\\\ \n\\midrule\\addlinespace[2.5pt]\n\\multicolumn{5}{l}{2nd\\_five} \\\\[2.5pt] \n\\midrule\\addlinespace[2.5pt]\nsix & 132.1 & 118.1 & 91.2 & 874.3 \\\\ \nseven & 349.7 & 307.1 & 566.7 & 542.9 \\\\ \neight & 63.7 & 504.3 & 152.0 & 724.5 \\\\ \nnine & 105.4 & 729.8 & 962.4 & 336.4 \\\\ \nten & 924.2 & 424.6 & 740.8 & 104.2 \\\\ \n\\midrule \nmax & — & — & — & 874.30 \\\\ \ncount & — & — & 5 & — \\\\ \n\\midrule \n\\midrule \nMEAN & 429.35 & 374.15 & 430.49 & 470.33 \\\\ \nMIN & 63.70 & 54.10 & 15.10 & 56.30 \\\\ \nMAX & 924.20 & 928.10 & 984.60 & 928.10 \\\\ \n\\bottomrule\n\\end{longtable}\n\\endgroup\n"

