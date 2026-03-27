# as_typst() renders spanners, row groups, and summaries

    Code
      as_typst(gt_tbl)
    Output
      [1] "#table(\n  columns: 7,\n  align: (left, right, left, center, right, right, right),\n  table.header([#set par(justify: false)\n], table.cell(colspan: 3, align: center)[#set par(justify: false)\nheading], table.cell(colspan: 3)[#set par(justify: false)\n]),\n  table.header([#set par(justify: false)\nrow], [#set par(justify: false)\nnum], [#set par(justify: false)\nchar], [#set par(justify: false)\nfctr], [#set par(justify: false)\ntime], [#set par(justify: false)\ndatetime], [#set par(justify: false)\ncurrency]),\n  table.cell(colspan: 7, align: left)[#strong[grp\\_a]],\n  [row\\_1], [0.1111], [apricot], [one], [13:35], [2018-01-01 02:22], [49.95],\n  [row\\_2], [2.2220], [banana], [two], [14:40], [2018-02-02 14:33], [17.95],\n  [row\\_3], [33.3300], [coconut], [three], [15:45], [2018-03-03 03:44], [1.39],\n  [row\\_4], [444.4000], [durian], [four], [16:50], [2018-04-04 15:55], [65100.00],\n  [Total], [480.06], [—], [—], [—], [—], [65,169.29],\n  table.cell(colspan: 7, align: left)[#strong[grp\\_b]],\n  [row\\_5], [5550.0000], [], [five], [17:55], [2018-05-05 04:00], [1325.81],\n  [Grand total], [6,030.06], [—], [—], [—], [—], [66,495.10]\n)"

