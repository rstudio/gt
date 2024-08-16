---
title: "dplyr <-> data.table"
subtitle: "Notes I took while learning to use data.table"
author:
  - name: "Marc-Aurèle Rivière"
    url: https://ma-riviere.com
    orcid: 0000-0002-5108-3382
date: "2022-05-19"
editor: source

keep-md: true

format:
  html:
    theme:
      light: [default, css/light.scss]
      dark: [darkly, css/dark.scss]
    css: css/style.css
    toc: true
    toc-title: "On this page"
    # self-contained: true
    anchor-sections: true
    number-sections: true
    # code-link: true
    fig-align: center
    fig-dpi: 300
    fig-format: svg
    code-tools:
      source: true
      toggle: false
    highlight-style: arrow
    code-block-bg: true
    code-block-border-left: "#31BAE9"
    link-external-newwindow: true

execute:
  warning: false
  message: false
  output: asis
  freeze: true
---

:::{.callout-tip collapse="true"}

# Expand for Version History

- **V1:** 2022-05-19  
- **V2:** 2022-05-26   
  - Improved the section on **keys** (for ordering & filtering)  
  - Adding a [section](#tidyr-others) for translations of `Tidyr` (and other similar packages)      
  - Capping tables to display 15 rows max when unfolded  
  - Improving table display (stripping, hiding the contents of nested columns, ...)

:::


```
## here() starts at /Users/cscheid/repos/github/rstudio/gt
```


```r
library(data.table) # Make sure you have data.table version >= 1.14.3
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:data.table':
## 
##     between, first, last
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(tidyr)
library(stringr)
library(purrr)
```

```
## 
## Attaching package: 'purrr'
```

```
## The following object is masked from 'package:data.table':
## 
##     transpose
```

```r
library(lubridate)
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following objects are masked from 'package:data.table':
## 
##     hour, isoweek, mday, minute, month, quarter, second, wday, week,
##     yday, year
```

```
## The following objects are masked from 'package:base':
## 
##     date, intersect, setdiff, union
```

```r
data.table::setDTthreads(parallel::detectCores(logical = TRUE))
```

:::{.callout-tip collapse="true"}

# Expand for Session Info


```
## ─ Session info ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
##  setting  value
##  version  R version 4.2.0 (2022-04-22)
##  os       macOS Big Sur/Monterey 10.16
##  system   x86_64, darwin17.0
##  ui       X11
##  language (EN)
##  collate  en_US.UTF-8
##  ctype    en_US.UTF-8
##  tz       America/Phoenix
##  date     2022-06-17
##  pandoc   2.14.0.1 @ /usr/local/bin/pandoc
## 
## ─ Packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
##  package    * version date (UTC) lib source
##  data.table * 1.14.2  2021-09-27 [1] CRAN (R 4.2.0)
##  dplyr      * 1.0.9   2022-04-28 [1] CRAN (R 4.2.0)
##  here       * 1.0.1   2020-12-13 [1] CRAN (R 4.2.0)
##  knitr      * 1.39    2022-04-26 [1] CRAN (R 4.2.0)
##  lubridate  * 1.8.0   2021-10-07 [1] CRAN (R 4.2.0)
##  purrr      * 0.3.4   2020-04-17 [1] CRAN (R 4.2.0)
##  stringr    * 1.4.0   2019-02-10 [1] CRAN (R 4.2.0)
##  tidyr      * 1.2.0   2022-02-01 [1] CRAN (R 4.2.0)
## 
##  [1] /Library/Frameworks/R.framework/Versions/4.2/Resources/library
## 
## ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```

:::




<!-------------------------------------------------------->
<!-------------------------------------------------------->
# Basic operations:
***

:::{.callout-tip}

## `data.table` general syntax:

DT[`row selector` (filter/sort), `col selector` (select/mutate/summarize/rename), `modifiers` (group)]
:::

**Data**


```r
MT <- as.data.table(mtcars)
IRIS <- as.data.table(iris)[, Species := as.character(Species)]
```


<!-------------------------------------------------------->
## Arrange / Order:


```r
mtcars |> arrange(desc(cyl))
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.frame [32 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="qzbjntqrqi" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #qzbjntqrqi .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #qzbjntqrqi .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #qzbjntqrqi .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #qzbjntqrqi .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #qzbjntqrqi .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #qzbjntqrqi .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #qzbjntqrqi .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #qzbjntqrqi .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #qzbjntqrqi .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #qzbjntqrqi .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #qzbjntqrqi .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #qzbjntqrqi .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #qzbjntqrqi .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #qzbjntqrqi .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #qzbjntqrqi .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #qzbjntqrqi .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #qzbjntqrqi .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #qzbjntqrqi .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #qzbjntqrqi .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #qzbjntqrqi .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #qzbjntqrqi .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #qzbjntqrqi .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #qzbjntqrqi .gt_left {
##   text-align: left;
## }
## 
## #qzbjntqrqi .gt_center {
##   text-align: center;
## }
## 
## #qzbjntqrqi .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #qzbjntqrqi .gt_font_normal {
##   font-weight: normal;
## }
## 
## #qzbjntqrqi .gt_font_bold {
##   font-weight: bold;
## }
## 
## #qzbjntqrqi .gt_font_italic {
##   font-style: italic;
## }
## 
## #qzbjntqrqi .gt_super {
##   font-size: 65%;
## }
## 
## #qzbjntqrqi .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #qzbjntqrqi .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #qzbjntqrqi .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #qzbjntqrqi .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #qzbjntqrqi .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #qzbjntqrqi .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">360</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">175</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">14.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">360</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">245</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15.84</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">10.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">472</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">205</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.93</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5.25</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.98</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">10.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">460</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">215</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.424</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.82</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">14.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">440</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">230</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.23</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5.345</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.42</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">318</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">150</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.76</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.52</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.87</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">304</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">150</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.435</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">13.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">350</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">245</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.73</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.84</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.41</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">19.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">400</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">175</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.845</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.05</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">351</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">264</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.22</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.17</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">14.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">301</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">335</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.54</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">14.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #FFFFFF; color: #000000;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="mlbhpibrsh" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #mlbhpibrsh .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #mlbhpibrsh .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #mlbhpibrsh .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #mlbhpibrsh .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #mlbhpibrsh .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #mlbhpibrsh .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #mlbhpibrsh .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #mlbhpibrsh .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #mlbhpibrsh .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #mlbhpibrsh .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #mlbhpibrsh .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #mlbhpibrsh .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #mlbhpibrsh .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mlbhpibrsh .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #mlbhpibrsh .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #mlbhpibrsh .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mlbhpibrsh .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #mlbhpibrsh .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mlbhpibrsh .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #mlbhpibrsh .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mlbhpibrsh .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #mlbhpibrsh .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mlbhpibrsh .gt_left {
##   text-align: left;
## }
## 
## #mlbhpibrsh .gt_center {
##   text-align: center;
## }
## 
## #mlbhpibrsh .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #mlbhpibrsh .gt_font_normal {
##   font-weight: normal;
## }
## 
## #mlbhpibrsh .gt_font_bold {
##   font-weight: bold;
## }
## 
## #mlbhpibrsh .gt_font_italic {
##   font-style: italic;
## }
## 
## #mlbhpibrsh .gt_super {
##   font-size: 65%;
## }
## 
## #mlbhpibrsh .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #mlbhpibrsh .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #mlbhpibrsh .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #mlbhpibrsh .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #mlbhpibrsh .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #mlbhpibrsh .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">360</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">175</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">14.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">360</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">245</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15.84</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">10.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">472</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">205</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.93</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5.25</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.98</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">10.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">460</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">215</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.424</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.82</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">14.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">440</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">230</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.23</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5.345</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.42</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">318</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">150</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.76</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.52</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.87</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">304</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">150</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.435</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">13.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">350</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">245</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.73</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.84</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.41</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">19.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">400</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">175</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.845</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.05</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">351</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">264</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.22</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.17</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">14.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">301</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">335</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.54</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">14.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #222222; color: #FFFFFF;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div></details>
## 
## ```
```

```r
MT[order(-cyl)]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [32 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="gbfrdenkgg" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #gbfrdenkgg .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #gbfrdenkgg .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #gbfrdenkgg .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #gbfrdenkgg .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #gbfrdenkgg .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #gbfrdenkgg .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #gbfrdenkgg .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #gbfrdenkgg .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #gbfrdenkgg .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #gbfrdenkgg .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #gbfrdenkgg .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #gbfrdenkgg .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #gbfrdenkgg .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #gbfrdenkgg .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #gbfrdenkgg .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #gbfrdenkgg .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #gbfrdenkgg .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #gbfrdenkgg .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #gbfrdenkgg .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #gbfrdenkgg .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #gbfrdenkgg .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #gbfrdenkgg .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #gbfrdenkgg .gt_left {
##   text-align: left;
## }
## 
## #gbfrdenkgg .gt_center {
##   text-align: center;
## }
## 
## #gbfrdenkgg .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #gbfrdenkgg .gt_font_normal {
##   font-weight: normal;
## }
## 
## #gbfrdenkgg .gt_font_bold {
##   font-weight: bold;
## }
## 
## #gbfrdenkgg .gt_font_italic {
##   font-style: italic;
## }
## 
## #gbfrdenkgg .gt_super {
##   font-size: 65%;
## }
## 
## #gbfrdenkgg .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #gbfrdenkgg .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #gbfrdenkgg .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #gbfrdenkgg .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #gbfrdenkgg .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #gbfrdenkgg .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">360</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">175</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">14.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">360</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">245</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15.84</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">10.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">472</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">205</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.93</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5.25</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.98</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">10.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">460</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">215</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.424</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.82</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">14.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">440</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">230</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.23</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5.345</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.42</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">318</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">150</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.76</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.52</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.87</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">304</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">150</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.435</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">13.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">350</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">245</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.73</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.84</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.41</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">19.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">400</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">175</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.845</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.05</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">351</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">264</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.22</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.17</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">14.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">301</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">335</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.54</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">14.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #FFFFFF; color: #000000;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="kncagrqabf" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #kncagrqabf .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #kncagrqabf .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #kncagrqabf .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #kncagrqabf .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #kncagrqabf .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #kncagrqabf .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #kncagrqabf .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #kncagrqabf .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #kncagrqabf .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #kncagrqabf .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #kncagrqabf .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #kncagrqabf .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #kncagrqabf .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kncagrqabf .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #kncagrqabf .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #kncagrqabf .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kncagrqabf .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #kncagrqabf .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kncagrqabf .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #kncagrqabf .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kncagrqabf .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #kncagrqabf .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kncagrqabf .gt_left {
##   text-align: left;
## }
## 
## #kncagrqabf .gt_center {
##   text-align: center;
## }
## 
## #kncagrqabf .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #kncagrqabf .gt_font_normal {
##   font-weight: normal;
## }
## 
## #kncagrqabf .gt_font_bold {
##   font-weight: bold;
## }
## 
## #kncagrqabf .gt_font_italic {
##   font-style: italic;
## }
## 
## #kncagrqabf .gt_super {
##   font-size: 65%;
## }
## 
## #kncagrqabf .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #kncagrqabf .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #kncagrqabf .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #kncagrqabf .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #kncagrqabf .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #kncagrqabf .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">360</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">175</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">14.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">360</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">245</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15.84</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">10.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">472</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">205</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.93</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5.25</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.98</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">10.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">460</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">215</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.424</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.82</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">14.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">440</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">230</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.23</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5.345</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.42</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">318</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">150</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.76</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.52</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.87</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">304</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">150</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.435</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">13.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">350</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">245</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.73</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.84</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.41</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">19.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">400</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">175</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.845</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.05</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">351</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">264</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.22</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.17</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">14.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">301</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">335</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.54</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">14.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #222222; color: #FFFFFF;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div></details>
## 
## ```
```

```r
IRIS[chorder(Species)]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [150 x 5]*</summary>
## <br>
## <div class='light-mode'>
## <div id="uvyiokqkfa" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #uvyiokqkfa .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #uvyiokqkfa .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #uvyiokqkfa .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #uvyiokqkfa .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #uvyiokqkfa .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #uvyiokqkfa .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #uvyiokqkfa .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #uvyiokqkfa .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #uvyiokqkfa .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #uvyiokqkfa .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #uvyiokqkfa .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #uvyiokqkfa .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #uvyiokqkfa .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uvyiokqkfa .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #uvyiokqkfa .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #uvyiokqkfa .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uvyiokqkfa .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #uvyiokqkfa .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uvyiokqkfa .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #uvyiokqkfa .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uvyiokqkfa .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #uvyiokqkfa .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uvyiokqkfa .gt_left {
##   text-align: left;
## }
## 
## #uvyiokqkfa .gt_center {
##   text-align: center;
## }
## 
## #uvyiokqkfa .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #uvyiokqkfa .gt_font_normal {
##   font-weight: normal;
## }
## 
## #uvyiokqkfa .gt_font_bold {
##   font-weight: bold;
## }
## 
## #uvyiokqkfa .gt_font_italic {
##   font-style: italic;
## }
## 
## #uvyiokqkfa .gt_super {
##   font-size: 65%;
## }
## 
## #uvyiokqkfa .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #uvyiokqkfa .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #uvyiokqkfa .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #uvyiokqkfa .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #uvyiokqkfa .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #uvyiokqkfa .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Sepal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Sepal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Petal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Petal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Species</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.4</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.3</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.1</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #FFFFFF; color: #000000;" colspan="5"><em>[ omitted 135 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="sbdfzqcpvb" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #sbdfzqcpvb .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #sbdfzqcpvb .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #sbdfzqcpvb .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #sbdfzqcpvb .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #sbdfzqcpvb .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #sbdfzqcpvb .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #sbdfzqcpvb .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #sbdfzqcpvb .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #sbdfzqcpvb .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #sbdfzqcpvb .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #sbdfzqcpvb .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #sbdfzqcpvb .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #sbdfzqcpvb .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sbdfzqcpvb .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #sbdfzqcpvb .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #sbdfzqcpvb .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sbdfzqcpvb .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #sbdfzqcpvb .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sbdfzqcpvb .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #sbdfzqcpvb .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sbdfzqcpvb .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #sbdfzqcpvb .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sbdfzqcpvb .gt_left {
##   text-align: left;
## }
## 
## #sbdfzqcpvb .gt_center {
##   text-align: center;
## }
## 
## #sbdfzqcpvb .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #sbdfzqcpvb .gt_font_normal {
##   font-weight: normal;
## }
## 
## #sbdfzqcpvb .gt_font_bold {
##   font-weight: bold;
## }
## 
## #sbdfzqcpvb .gt_font_italic {
##   font-style: italic;
## }
## 
## #sbdfzqcpvb .gt_super {
##   font-size: 65%;
## }
## 
## #sbdfzqcpvb .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #sbdfzqcpvb .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #sbdfzqcpvb .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #sbdfzqcpvb .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #sbdfzqcpvb .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #sbdfzqcpvb .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Sepal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Sepal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Petal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Petal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Species</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.4</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.3</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.1</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #222222; color: #FFFFFF;" colspan="5"><em>[ omitted 135 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div></details>
## 
## ```
```


```r
setorder(MT, -cyl)[]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [32 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="bcqflakhuy" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #bcqflakhuy .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #bcqflakhuy .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #bcqflakhuy .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #bcqflakhuy .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #bcqflakhuy .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #bcqflakhuy .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #bcqflakhuy .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #bcqflakhuy .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #bcqflakhuy .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #bcqflakhuy .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #bcqflakhuy .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #bcqflakhuy .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #bcqflakhuy .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bcqflakhuy .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #bcqflakhuy .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #bcqflakhuy .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bcqflakhuy .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #bcqflakhuy .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bcqflakhuy .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #bcqflakhuy .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bcqflakhuy .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #bcqflakhuy .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bcqflakhuy .gt_left {
##   text-align: left;
## }
## 
## #bcqflakhuy .gt_center {
##   text-align: center;
## }
## 
## #bcqflakhuy .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #bcqflakhuy .gt_font_normal {
##   font-weight: normal;
## }
## 
## #bcqflakhuy .gt_font_bold {
##   font-weight: bold;
## }
## 
## #bcqflakhuy .gt_font_italic {
##   font-style: italic;
## }
## 
## #bcqflakhuy .gt_super {
##   font-size: 65%;
## }
## 
## #bcqflakhuy .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #bcqflakhuy .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #bcqflakhuy .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #bcqflakhuy .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #bcqflakhuy .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #bcqflakhuy .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">360</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">175</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">14.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">360</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">245</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15.84</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">10.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">472</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">205</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.93</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5.25</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.98</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">10.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">460</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">215</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.424</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.82</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">14.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">440</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">230</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.23</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5.345</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.42</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">318</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">150</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.76</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.52</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.87</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">304</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">150</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.435</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">13.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">350</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">245</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.73</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.84</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.41</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">19.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">400</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">175</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.845</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.05</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">351</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">264</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.22</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.17</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">14.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">301</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">335</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.54</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">14.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #FFFFFF; color: #000000;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="sdjcfpmyiy" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #sdjcfpmyiy .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #sdjcfpmyiy .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #sdjcfpmyiy .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #sdjcfpmyiy .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #sdjcfpmyiy .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #sdjcfpmyiy .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #sdjcfpmyiy .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #sdjcfpmyiy .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #sdjcfpmyiy .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #sdjcfpmyiy .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #sdjcfpmyiy .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #sdjcfpmyiy .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #sdjcfpmyiy .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sdjcfpmyiy .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #sdjcfpmyiy .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #sdjcfpmyiy .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sdjcfpmyiy .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #sdjcfpmyiy .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sdjcfpmyiy .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #sdjcfpmyiy .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sdjcfpmyiy .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #sdjcfpmyiy .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #sdjcfpmyiy .gt_left {
##   text-align: left;
## }
## 
## #sdjcfpmyiy .gt_center {
##   text-align: center;
## }
## 
## #sdjcfpmyiy .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #sdjcfpmyiy .gt_font_normal {
##   font-weight: normal;
## }
## 
## #sdjcfpmyiy .gt_font_bold {
##   font-weight: bold;
## }
## 
## #sdjcfpmyiy .gt_font_italic {
##   font-style: italic;
## }
## 
## #sdjcfpmyiy .gt_super {
##   font-size: 65%;
## }
## 
## #sdjcfpmyiy .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #sdjcfpmyiy .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #sdjcfpmyiy .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #sdjcfpmyiy .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #sdjcfpmyiy .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #sdjcfpmyiy .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">360</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">175</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">14.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">360</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">245</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15.84</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">10.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">472</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">205</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.93</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5.25</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.98</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">10.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">460</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">215</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.424</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.82</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">14.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">440</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">230</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.23</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5.345</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.42</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">318</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">150</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.76</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.52</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.87</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">304</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">150</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.435</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">13.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">350</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">245</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.73</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.84</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.41</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">19.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">400</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">175</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.845</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.05</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">351</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">264</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.22</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.17</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">14.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">301</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">335</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.54</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.57</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">14.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #222222; color: #FFFFFF;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div></details>
## 
## ```
```


**Ordering with keys**

- Keys physically reorders the dataset within the RAM (by reference)  
  - No memory is used for sorting (other than marking which columns is the key)  
- The dataset is marked with an attribute _"sorted"_  
- The dataset is always sorted in _ascending order_, with _NAs_ first  
- Using `keyby` instead of `by` when grouping will set the grouping factors as keys

:::{.callout-tip}
See [this SO post](https://stackoverflow.com/questions/20039335/what-is-the-purpose-of-setting-a-key-in-data-table?rq=1) for more information on keys.
:::


```r
setkey(MT, cyl, gear)

setkeyv(MT, c("cyl", "gear"))

MT
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [32 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="jkvrfnmxvc" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #jkvrfnmxvc .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #jkvrfnmxvc .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #jkvrfnmxvc .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #jkvrfnmxvc .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #jkvrfnmxvc .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #jkvrfnmxvc .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #jkvrfnmxvc .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #jkvrfnmxvc .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #jkvrfnmxvc .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #jkvrfnmxvc .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #jkvrfnmxvc .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #jkvrfnmxvc .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #jkvrfnmxvc .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #jkvrfnmxvc .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #jkvrfnmxvc .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #jkvrfnmxvc .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #jkvrfnmxvc .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #jkvrfnmxvc .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #jkvrfnmxvc .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #jkvrfnmxvc .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #jkvrfnmxvc .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #jkvrfnmxvc .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #jkvrfnmxvc .gt_left {
##   text-align: left;
## }
## 
## #jkvrfnmxvc .gt_center {
##   text-align: center;
## }
## 
## #jkvrfnmxvc .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #jkvrfnmxvc .gt_font_normal {
##   font-weight: normal;
## }
## 
## #jkvrfnmxvc .gt_font_bold {
##   font-weight: bold;
## }
## 
## #jkvrfnmxvc .gt_font_italic {
##   font-style: italic;
## }
## 
## #jkvrfnmxvc .gt_super {
##   font-size: 65%;
## }
## 
## #jkvrfnmxvc .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #jkvrfnmxvc .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #jkvrfnmxvc .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #jkvrfnmxvc .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #jkvrfnmxvc .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #jkvrfnmxvc .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">120.1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">97</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.465</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">20.01</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">108</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">93</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.85</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.32</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.61</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">24.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">146.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.69</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.19</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">20</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">140.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">95</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">22.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">32.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">78.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">66</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.08</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.47</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">30.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">75.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">52</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.93</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.615</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.52</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">33.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">71.1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">65</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.22</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.835</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">27.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">79</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">66</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.935</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">121</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">109</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.11</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.78</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">26</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">120.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">91</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.43</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.14</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">16.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">30.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">95.1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">113</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.77</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.513</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">258</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.215</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">19.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">225</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">105</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.76</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">20.22</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.62</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">16.46</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.875</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #FFFFFF; color: #000000;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="skkvdxbuaf" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #skkvdxbuaf .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #skkvdxbuaf .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #skkvdxbuaf .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #skkvdxbuaf .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #skkvdxbuaf .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #skkvdxbuaf .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #skkvdxbuaf .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #skkvdxbuaf .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #skkvdxbuaf .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #skkvdxbuaf .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #skkvdxbuaf .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #skkvdxbuaf .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #skkvdxbuaf .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #skkvdxbuaf .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #skkvdxbuaf .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #skkvdxbuaf .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #skkvdxbuaf .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #skkvdxbuaf .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #skkvdxbuaf .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #skkvdxbuaf .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #skkvdxbuaf .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #skkvdxbuaf .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #skkvdxbuaf .gt_left {
##   text-align: left;
## }
## 
## #skkvdxbuaf .gt_center {
##   text-align: center;
## }
## 
## #skkvdxbuaf .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #skkvdxbuaf .gt_font_normal {
##   font-weight: normal;
## }
## 
## #skkvdxbuaf .gt_font_bold {
##   font-weight: bold;
## }
## 
## #skkvdxbuaf .gt_font_italic {
##   font-style: italic;
## }
## 
## #skkvdxbuaf .gt_super {
##   font-size: 65%;
## }
## 
## #skkvdxbuaf .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #skkvdxbuaf .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #skkvdxbuaf .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #skkvdxbuaf .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #skkvdxbuaf .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #skkvdxbuaf .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">120.1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">97</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.465</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">20.01</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">108</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">93</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.85</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.32</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.61</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">24.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">146.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.69</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.19</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">20</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">140.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">95</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">22.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">32.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">78.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">66</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.08</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.47</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">30.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">75.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">52</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.93</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.615</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.52</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">33.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">71.1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">65</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.22</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.835</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">27.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">79</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">66</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.935</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">121</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">109</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.11</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.78</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">26</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">120.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">91</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.43</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.14</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">16.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">30.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">95.1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">113</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.77</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.513</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">258</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.215</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">19.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">225</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">105</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.76</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">20.22</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.62</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">16.46</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.875</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #222222; color: #FFFFFF;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div></details>
## 
## ```
```

To see over which keys (if any) the dataset is currently ordered:


```r
haskey(MT)
```

```
## [1] TRUE
```

```r
key(MT)
```

```
## [1] "cyl"  "gear"
```

:::{.callout-warning}
Unless our task involves repeated subsetting on the same column, the speed gain from key-based subsetting could effectively be nullified by the time needed to reorder the data in RAM, especially for large datasets.
:::


**Ordering with (secondary) indices**

- `setindex` creates an index for the provided columns, but doesn’t physically reorder the dataset in RAM.  
- It computes the ordering vector of the dataset's rows according to the provided columns in an additional attribute called _index_  






```r
setindex(MT, cyl, gear)

setindexv(MT, c("cyl", "gear"))

MT
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [32 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="rdmkcuqpaq" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #rdmkcuqpaq .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #rdmkcuqpaq .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #rdmkcuqpaq .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #rdmkcuqpaq .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #rdmkcuqpaq .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #rdmkcuqpaq .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #rdmkcuqpaq .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #rdmkcuqpaq .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #rdmkcuqpaq .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #rdmkcuqpaq .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #rdmkcuqpaq .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #rdmkcuqpaq .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #rdmkcuqpaq .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rdmkcuqpaq .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #rdmkcuqpaq .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #rdmkcuqpaq .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rdmkcuqpaq .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #rdmkcuqpaq .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rdmkcuqpaq .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #rdmkcuqpaq .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rdmkcuqpaq .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #rdmkcuqpaq .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rdmkcuqpaq .gt_left {
##   text-align: left;
## }
## 
## #rdmkcuqpaq .gt_center {
##   text-align: center;
## }
## 
## #rdmkcuqpaq .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #rdmkcuqpaq .gt_font_normal {
##   font-weight: normal;
## }
## 
## #rdmkcuqpaq .gt_font_bold {
##   font-weight: bold;
## }
## 
## #rdmkcuqpaq .gt_font_italic {
##   font-style: italic;
## }
## 
## #rdmkcuqpaq .gt_super {
##   font-size: 65%;
## }
## 
## #rdmkcuqpaq .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #rdmkcuqpaq .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #rdmkcuqpaq .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #rdmkcuqpaq .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #rdmkcuqpaq .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #rdmkcuqpaq .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">22.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">108</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">93</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.85</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.32</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.61</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">258</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.215</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">19.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">360</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">175</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">225</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">105</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.76</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.46</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">20.22</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">14.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">360</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">245</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.57</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.84</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">24.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">146.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">62</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.69</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.19</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">20</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">22.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">140.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">95</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">22.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">19.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">123</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">16.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.73</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">15.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.78</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">10.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">472</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">205</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.93</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.25</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.98</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #FFFFFF; color: #000000;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="xjpapcvfvp" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #xjpapcvfvp .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #xjpapcvfvp .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #xjpapcvfvp .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #xjpapcvfvp .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #xjpapcvfvp .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #xjpapcvfvp .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #xjpapcvfvp .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #xjpapcvfvp .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #xjpapcvfvp .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #xjpapcvfvp .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #xjpapcvfvp .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #xjpapcvfvp .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #xjpapcvfvp .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xjpapcvfvp .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #xjpapcvfvp .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #xjpapcvfvp .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xjpapcvfvp .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #xjpapcvfvp .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xjpapcvfvp .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #xjpapcvfvp .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xjpapcvfvp .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #xjpapcvfvp .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xjpapcvfvp .gt_left {
##   text-align: left;
## }
## 
## #xjpapcvfvp .gt_center {
##   text-align: center;
## }
## 
## #xjpapcvfvp .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #xjpapcvfvp .gt_font_normal {
##   font-weight: normal;
## }
## 
## #xjpapcvfvp .gt_font_bold {
##   font-weight: bold;
## }
## 
## #xjpapcvfvp .gt_font_italic {
##   font-style: italic;
## }
## 
## #xjpapcvfvp .gt_super {
##   font-size: 65%;
## }
## 
## #xjpapcvfvp .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #xjpapcvfvp .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #xjpapcvfvp .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #xjpapcvfvp .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #xjpapcvfvp .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #xjpapcvfvp .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">22.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">108</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">93</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.85</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.32</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.61</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">258</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.215</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">19.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">360</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">175</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.02</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">225</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">105</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.76</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.46</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">20.22</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">14.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">360</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">245</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.57</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.84</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">24.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">146.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">62</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.69</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.19</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">20</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">22.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">140.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">95</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">22.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">19.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">123</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">16.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.73</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">15.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.78</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">10.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">472</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">205</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.93</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.25</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.98</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #222222; color: #FFFFFF;" colspan="11"><em>[ omitted 17 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div></details>
## 
## ```
```

We can see the additional _index_ attribute added to the `data.table`:


```r
names(attributes(MT))
```

```
## [1] "names"             "row.names"         "class"            
## [4] ".internal.selfref" "index"
```

We can get the currently used indices with:


```r
indices(MT)
```

```
## [1] "cyl__gear"
```

Adding a new index doesn't remove a previously existing one:


```r
setindex(MT, hp)

indices(MT)
```

```
## [1] "cyl__gear" "hp"
```

We can thus use indices to pre-compute the ordering for the columns (or combinations of columns) that we will be using to group or subset by frequently !



<!-------------------------------------------------------->
## Subset / Filter:





```r
mtcars |> filter(cyl >= 6 & disp < 180)
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.frame [5 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="cbdwydtgea" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #cbdwydtgea .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #cbdwydtgea .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #cbdwydtgea .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #cbdwydtgea .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #cbdwydtgea .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #cbdwydtgea .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #cbdwydtgea .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #cbdwydtgea .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #cbdwydtgea .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #cbdwydtgea .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #cbdwydtgea .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #cbdwydtgea .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #cbdwydtgea .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #cbdwydtgea .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #cbdwydtgea .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #cbdwydtgea .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #cbdwydtgea .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #cbdwydtgea .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #cbdwydtgea .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #cbdwydtgea .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #cbdwydtgea .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #cbdwydtgea .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #cbdwydtgea .gt_left {
##   text-align: left;
## }
## 
## #cbdwydtgea .gt_center {
##   text-align: center;
## }
## 
## #cbdwydtgea .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #cbdwydtgea .gt_font_normal {
##   font-weight: normal;
## }
## 
## #cbdwydtgea .gt_font_bold {
##   font-weight: bold;
## }
## 
## #cbdwydtgea .gt_font_italic {
##   font-style: italic;
## }
## 
## #cbdwydtgea .gt_super {
##   font-size: 65%;
## }
## 
## #cbdwydtgea .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #cbdwydtgea .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #cbdwydtgea .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #cbdwydtgea .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #cbdwydtgea .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #cbdwydtgea .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">123</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">145</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">175</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.77</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="dewiweiohy" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #dewiweiohy .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #dewiweiohy .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #dewiweiohy .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #dewiweiohy .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #dewiweiohy .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #dewiweiohy .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #dewiweiohy .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #dewiweiohy .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #dewiweiohy .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #dewiweiohy .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #dewiweiohy .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #dewiweiohy .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #dewiweiohy .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #dewiweiohy .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #dewiweiohy .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #dewiweiohy .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #dewiweiohy .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #dewiweiohy .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #dewiweiohy .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #dewiweiohy .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #dewiweiohy .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #dewiweiohy .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #dewiweiohy .gt_left {
##   text-align: left;
## }
## 
## #dewiweiohy .gt_center {
##   text-align: center;
## }
## 
## #dewiweiohy .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #dewiweiohy .gt_font_normal {
##   font-weight: normal;
## }
## 
## #dewiweiohy .gt_font_bold {
##   font-weight: bold;
## }
## 
## #dewiweiohy .gt_font_italic {
##   font-style: italic;
## }
## 
## #dewiweiohy .gt_super {
##   font-size: 65%;
## }
## 
## #dewiweiohy .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #dewiweiohy .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #dewiweiohy .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #dewiweiohy .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #dewiweiohy .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #dewiweiohy .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">123</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">145</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">175</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.77</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div></details>
## 
## ```
```

```r
MT[cyl >= 6 & disp < 180]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [5 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="oibonlisgx" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #oibonlisgx .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #oibonlisgx .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #oibonlisgx .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #oibonlisgx .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #oibonlisgx .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #oibonlisgx .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #oibonlisgx .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #oibonlisgx .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #oibonlisgx .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #oibonlisgx .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #oibonlisgx .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #oibonlisgx .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #oibonlisgx .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #oibonlisgx .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #oibonlisgx .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #oibonlisgx .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #oibonlisgx .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #oibonlisgx .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #oibonlisgx .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #oibonlisgx .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #oibonlisgx .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #oibonlisgx .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #oibonlisgx .gt_left {
##   text-align: left;
## }
## 
## #oibonlisgx .gt_center {
##   text-align: center;
## }
## 
## #oibonlisgx .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #oibonlisgx .gt_font_normal {
##   font-weight: normal;
## }
## 
## #oibonlisgx .gt_font_bold {
##   font-weight: bold;
## }
## 
## #oibonlisgx .gt_font_italic {
##   font-style: italic;
## }
## 
## #oibonlisgx .gt_super {
##   font-size: 65%;
## }
## 
## #oibonlisgx .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #oibonlisgx .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #oibonlisgx .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #oibonlisgx .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #oibonlisgx .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #oibonlisgx .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">123</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">145</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">175</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.77</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="hxpfbieoam" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #hxpfbieoam .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #hxpfbieoam .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #hxpfbieoam .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #hxpfbieoam .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #hxpfbieoam .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #hxpfbieoam .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #hxpfbieoam .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #hxpfbieoam .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #hxpfbieoam .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #hxpfbieoam .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #hxpfbieoam .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #hxpfbieoam .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #hxpfbieoam .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hxpfbieoam .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #hxpfbieoam .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #hxpfbieoam .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hxpfbieoam .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #hxpfbieoam .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hxpfbieoam .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #hxpfbieoam .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hxpfbieoam .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #hxpfbieoam .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hxpfbieoam .gt_left {
##   text-align: left;
## }
## 
## #hxpfbieoam .gt_center {
##   text-align: center;
## }
## 
## #hxpfbieoam .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #hxpfbieoam .gt_font_normal {
##   font-weight: normal;
## }
## 
## #hxpfbieoam .gt_font_bold {
##   font-weight: bold;
## }
## 
## #hxpfbieoam .gt_font_italic {
##   font-style: italic;
## }
## 
## #hxpfbieoam .gt_super {
##   font-size: 65%;
## }
## 
## #hxpfbieoam .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #hxpfbieoam .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #hxpfbieoam .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #hxpfbieoam .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #hxpfbieoam .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #hxpfbieoam .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">123</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">145</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">175</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.77</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div></details>
## 
## ```
```


**Filtering on characters:**

For non-regex, use `%chin%`, which is a character-optimized version of `%in%`.  


```r
IRIS[Species %chin% c("setosa")]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [50 x 5]*</summary>
## <br>
## <div class='light-mode'>
## <div id="eukfettgfx" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #eukfettgfx .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #eukfettgfx .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #eukfettgfx .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #eukfettgfx .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #eukfettgfx .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #eukfettgfx .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #eukfettgfx .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #eukfettgfx .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #eukfettgfx .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #eukfettgfx .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #eukfettgfx .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #eukfettgfx .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #eukfettgfx .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #eukfettgfx .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #eukfettgfx .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #eukfettgfx .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #eukfettgfx .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #eukfettgfx .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #eukfettgfx .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #eukfettgfx .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #eukfettgfx .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #eukfettgfx .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #eukfettgfx .gt_left {
##   text-align: left;
## }
## 
## #eukfettgfx .gt_center {
##   text-align: center;
## }
## 
## #eukfettgfx .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #eukfettgfx .gt_font_normal {
##   font-weight: normal;
## }
## 
## #eukfettgfx .gt_font_bold {
##   font-weight: bold;
## }
## 
## #eukfettgfx .gt_font_italic {
##   font-style: italic;
## }
## 
## #eukfettgfx .gt_super {
##   font-size: 65%;
## }
## 
## #eukfettgfx .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #eukfettgfx .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #eukfettgfx .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #eukfettgfx .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #eukfettgfx .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #eukfettgfx .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Sepal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Sepal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Petal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Petal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Species</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.4</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.3</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.1</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #FFFFFF; color: #000000;" colspan="5"><em>[ omitted 35 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="kutgmqzkvs" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #kutgmqzkvs .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #kutgmqzkvs .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #kutgmqzkvs .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #kutgmqzkvs .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #kutgmqzkvs .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #kutgmqzkvs .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #kutgmqzkvs .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #kutgmqzkvs .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #kutgmqzkvs .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #kutgmqzkvs .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #kutgmqzkvs .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #kutgmqzkvs .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #kutgmqzkvs .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kutgmqzkvs .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #kutgmqzkvs .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #kutgmqzkvs .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kutgmqzkvs .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #kutgmqzkvs .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kutgmqzkvs .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #kutgmqzkvs .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kutgmqzkvs .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #kutgmqzkvs .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kutgmqzkvs .gt_left {
##   text-align: left;
## }
## 
## #kutgmqzkvs .gt_center {
##   text-align: center;
## }
## 
## #kutgmqzkvs .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #kutgmqzkvs .gt_font_normal {
##   font-weight: normal;
## }
## 
## #kutgmqzkvs .gt_font_bold {
##   font-weight: bold;
## }
## 
## #kutgmqzkvs .gt_font_italic {
##   font-style: italic;
## }
## 
## #kutgmqzkvs .gt_super {
##   font-size: 65%;
## }
## 
## #kutgmqzkvs .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #kutgmqzkvs .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #kutgmqzkvs .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #kutgmqzkvs .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #kutgmqzkvs .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #kutgmqzkvs .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Sepal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Sepal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Petal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Petal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Species</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.4</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.3</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.1</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #222222; color: #FFFFFF;" colspan="5"><em>[ omitted 35 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div></details>
## 
## ```
```


**Filter with pattern:**

For regex patterns, use `%like%`


```r
mtcars |> filter(str_detect(disp, "^\\d{3}\\."))
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.frame [9 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="onrcaajsiz" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #onrcaajsiz .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #onrcaajsiz .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #onrcaajsiz .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #onrcaajsiz .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #onrcaajsiz .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #onrcaajsiz .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #onrcaajsiz .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #onrcaajsiz .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #onrcaajsiz .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #onrcaajsiz .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #onrcaajsiz .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #onrcaajsiz .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #onrcaajsiz .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #onrcaajsiz .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #onrcaajsiz .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #onrcaajsiz .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #onrcaajsiz .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #onrcaajsiz .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #onrcaajsiz .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #onrcaajsiz .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #onrcaajsiz .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #onrcaajsiz .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #onrcaajsiz .gt_left {
##   text-align: left;
## }
## 
## #onrcaajsiz .gt_center {
##   text-align: center;
## }
## 
## #onrcaajsiz .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #onrcaajsiz .gt_font_normal {
##   font-weight: normal;
## }
## 
## #onrcaajsiz .gt_font_bold {
##   font-weight: bold;
## }
## 
## #onrcaajsiz .gt_font_italic {
##   font-style: italic;
## }
## 
## #onrcaajsiz .gt_super {
##   font-size: 65%;
## }
## 
## #onrcaajsiz .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #onrcaajsiz .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #onrcaajsiz .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #onrcaajsiz .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #onrcaajsiz .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #onrcaajsiz .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">24.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">146.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.69</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.19</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">20</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">140.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">95</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">22.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">123</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">120.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">97</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.465</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">20.01</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">26</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">120.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">91</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.43</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.14</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="uqbmviaqxs" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #uqbmviaqxs .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #uqbmviaqxs .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #uqbmviaqxs .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #uqbmviaqxs .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #uqbmviaqxs .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #uqbmviaqxs .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #uqbmviaqxs .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #uqbmviaqxs .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #uqbmviaqxs .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #uqbmviaqxs .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #uqbmviaqxs .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #uqbmviaqxs .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #uqbmviaqxs .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uqbmviaqxs .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #uqbmviaqxs .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #uqbmviaqxs .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uqbmviaqxs .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #uqbmviaqxs .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uqbmviaqxs .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #uqbmviaqxs .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uqbmviaqxs .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #uqbmviaqxs .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #uqbmviaqxs .gt_left {
##   text-align: left;
## }
## 
## #uqbmviaqxs .gt_center {
##   text-align: center;
## }
## 
## #uqbmviaqxs .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #uqbmviaqxs .gt_font_normal {
##   font-weight: normal;
## }
## 
## #uqbmviaqxs .gt_font_bold {
##   font-weight: bold;
## }
## 
## #uqbmviaqxs .gt_font_italic {
##   font-style: italic;
## }
## 
## #uqbmviaqxs .gt_super {
##   font-size: 65%;
## }
## 
## #uqbmviaqxs .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #uqbmviaqxs .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #uqbmviaqxs .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #uqbmviaqxs .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #uqbmviaqxs .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #uqbmviaqxs .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">24.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">146.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.69</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.19</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">20</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">140.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">95</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">22.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">123</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">120.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">97</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.465</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">20.01</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">26</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">120.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">91</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.43</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.14</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div></details>
## 
## ```
```

```r
MT[like(disp, "^\\d{3}\\.")]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [9 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="incboommit" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #incboommit .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #incboommit .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #incboommit .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #incboommit .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #incboommit .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #incboommit .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #incboommit .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #incboommit .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #incboommit .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #incboommit .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #incboommit .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #incboommit .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #incboommit .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #incboommit .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #incboommit .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #incboommit .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #incboommit .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #incboommit .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #incboommit .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #incboommit .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #incboommit .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #incboommit .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #incboommit .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #incboommit .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #incboommit .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #incboommit .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #incboommit .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #incboommit .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #incboommit .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #incboommit .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #incboommit .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #incboommit .gt_left {
##   text-align: left;
## }
## 
## #incboommit .gt_center {
##   text-align: center;
## }
## 
## #incboommit .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #incboommit .gt_font_normal {
##   font-weight: normal;
## }
## 
## #incboommit .gt_font_bold {
##   font-weight: bold;
## }
## 
## #incboommit .gt_font_italic {
##   font-style: italic;
## }
## 
## #incboommit .gt_super {
##   font-size: 65%;
## }
## 
## #incboommit .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #incboommit .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #incboommit .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #incboommit .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #incboommit .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #incboommit .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">24.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">146.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.69</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.19</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">20</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">140.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">95</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">22.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">123</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">120.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">97</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.465</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">20.01</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">26</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">120.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">91</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.43</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.14</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="wfpopcqtbh" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #wfpopcqtbh .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #wfpopcqtbh .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #wfpopcqtbh .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #wfpopcqtbh .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #wfpopcqtbh .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #wfpopcqtbh .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #wfpopcqtbh .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #wfpopcqtbh .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #wfpopcqtbh .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #wfpopcqtbh .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #wfpopcqtbh .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #wfpopcqtbh .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #wfpopcqtbh .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #wfpopcqtbh .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #wfpopcqtbh .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #wfpopcqtbh .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #wfpopcqtbh .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #wfpopcqtbh .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #wfpopcqtbh .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #wfpopcqtbh .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #wfpopcqtbh .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #wfpopcqtbh .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #wfpopcqtbh .gt_left {
##   text-align: left;
## }
## 
## #wfpopcqtbh .gt_center {
##   text-align: center;
## }
## 
## #wfpopcqtbh .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #wfpopcqtbh .gt_font_normal {
##   font-weight: normal;
## }
## 
## #wfpopcqtbh .gt_font_bold {
##   font-weight: bold;
## }
## 
## #wfpopcqtbh .gt_font_italic {
##   font-style: italic;
## }
## 
## #wfpopcqtbh .gt_super {
##   font-size: 65%;
## }
## 
## #wfpopcqtbh .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #wfpopcqtbh .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #wfpopcqtbh .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #wfpopcqtbh .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #wfpopcqtbh .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #wfpopcqtbh .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">24.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">146.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.69</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.19</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">20</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">140.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">95</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">22.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">123</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">120.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">97</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.465</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">20.01</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">26</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">120.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">91</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.43</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.14</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div></details>
## 
## ```
```

Alternatively:


```r
MT[disp %like% "^\\d{3}\\."]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [9 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="hcmiythxuc" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #hcmiythxuc .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #hcmiythxuc .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #hcmiythxuc .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #hcmiythxuc .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #hcmiythxuc .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #hcmiythxuc .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #hcmiythxuc .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #hcmiythxuc .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #hcmiythxuc .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #hcmiythxuc .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #hcmiythxuc .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #hcmiythxuc .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #hcmiythxuc .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hcmiythxuc .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #hcmiythxuc .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #hcmiythxuc .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hcmiythxuc .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #hcmiythxuc .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hcmiythxuc .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #hcmiythxuc .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hcmiythxuc .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #hcmiythxuc .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #hcmiythxuc .gt_left {
##   text-align: left;
## }
## 
## #hcmiythxuc .gt_center {
##   text-align: center;
## }
## 
## #hcmiythxuc .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #hcmiythxuc .gt_font_normal {
##   font-weight: normal;
## }
## 
## #hcmiythxuc .gt_font_bold {
##   font-weight: bold;
## }
## 
## #hcmiythxuc .gt_font_italic {
##   font-style: italic;
## }
## 
## #hcmiythxuc .gt_super {
##   font-size: 65%;
## }
## 
## #hcmiythxuc .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #hcmiythxuc .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #hcmiythxuc .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #hcmiythxuc .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #hcmiythxuc .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #hcmiythxuc .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">24.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">146.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.69</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.19</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">20</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">140.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">95</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">22.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">123</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">180</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">120.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">97</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.465</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">20.01</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">26</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">120.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">91</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.43</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.14</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="nrktxemcri" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #nrktxemcri .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #nrktxemcri .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #nrktxemcri .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #nrktxemcri .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #nrktxemcri .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #nrktxemcri .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #nrktxemcri .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #nrktxemcri .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #nrktxemcri .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #nrktxemcri .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #nrktxemcri .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #nrktxemcri .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #nrktxemcri .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #nrktxemcri .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #nrktxemcri .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #nrktxemcri .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #nrktxemcri .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #nrktxemcri .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #nrktxemcri .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #nrktxemcri .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #nrktxemcri .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #nrktxemcri .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #nrktxemcri .gt_left {
##   text-align: left;
## }
## 
## #nrktxemcri .gt_center {
##   text-align: center;
## }
## 
## #nrktxemcri .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #nrktxemcri .gt_font_normal {
##   font-weight: normal;
## }
## 
## #nrktxemcri .gt_font_bold {
##   font-weight: bold;
## }
## 
## #nrktxemcri .gt_font_italic {
##   font-style: italic;
## }
## 
## #nrktxemcri .gt_super {
##   font-size: 65%;
## }
## 
## #nrktxemcri .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #nrktxemcri .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #nrktxemcri .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #nrktxemcri .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #nrktxemcri .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #nrktxemcri .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">24.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">146.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.69</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.19</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">20</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">22.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">140.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">95</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.15</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">22.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">123</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">17.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">275.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">180</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.07</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.73</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">275.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">180</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.07</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.78</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">120.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">97</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.465</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">20.01</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">26</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">120.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">91</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.43</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.14</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div></details>
## 
## ```
```


**Filter by keys**

When keys or indices are defined, we can filter based on them, which is often a lot faster.  
- _N.B.: We do not even need to specify the column name we are filtering on: the values will be attributed to the keys in order._



```r
setkey(MT, cyl)

MT[.(6)] # Equivalent to MT[cyl == 6]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [7 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="bizrlnnxgy" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #bizrlnnxgy .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #bizrlnnxgy .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #bizrlnnxgy .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #bizrlnnxgy .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #bizrlnnxgy .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #bizrlnnxgy .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #bizrlnnxgy .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #bizrlnnxgy .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #bizrlnnxgy .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #bizrlnnxgy .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #bizrlnnxgy .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #bizrlnnxgy .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #bizrlnnxgy .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bizrlnnxgy .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #bizrlnnxgy .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #bizrlnnxgy .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bizrlnnxgy .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #bizrlnnxgy .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bizrlnnxgy .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #bizrlnnxgy .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bizrlnnxgy .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #bizrlnnxgy .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bizrlnnxgy .gt_left {
##   text-align: left;
## }
## 
## #bizrlnnxgy .gt_center {
##   text-align: center;
## }
## 
## #bizrlnnxgy .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #bizrlnnxgy .gt_font_normal {
##   font-weight: normal;
## }
## 
## #bizrlnnxgy .gt_font_bold {
##   font-weight: bold;
## }
## 
## #bizrlnnxgy .gt_font_italic {
##   font-style: italic;
## }
## 
## #bizrlnnxgy .gt_super {
##   font-size: 65%;
## }
## 
## #bizrlnnxgy .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #bizrlnnxgy .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #bizrlnnxgy .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #bizrlnnxgy .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #bizrlnnxgy .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #bizrlnnxgy .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">258</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.08</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.215</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">225</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">105</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.76</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.46</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">20.22</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">123</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">145</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">175</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.77</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="rerjokidek" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #rerjokidek .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #rerjokidek .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #rerjokidek .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #rerjokidek .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #rerjokidek .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #rerjokidek .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #rerjokidek .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #rerjokidek .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #rerjokidek .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #rerjokidek .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #rerjokidek .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #rerjokidek .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #rerjokidek .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rerjokidek .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #rerjokidek .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #rerjokidek .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rerjokidek .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #rerjokidek .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rerjokidek .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #rerjokidek .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rerjokidek .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #rerjokidek .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #rerjokidek .gt_left {
##   text-align: left;
## }
## 
## #rerjokidek .gt_center {
##   text-align: center;
## }
## 
## #rerjokidek .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #rerjokidek .gt_font_normal {
##   font-weight: normal;
## }
## 
## #rerjokidek .gt_font_bold {
##   font-weight: bold;
## }
## 
## #rerjokidek .gt_font_italic {
##   font-style: italic;
## }
## 
## #rerjokidek .gt_super {
##   font-size: 65%;
## }
## 
## #rerjokidek .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #rerjokidek .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #rerjokidek .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #rerjokidek .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #rerjokidek .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #rerjokidek .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">258</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.08</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.215</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">225</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">105</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.76</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.46</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">20.22</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">123</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">145</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">175</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.77</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">15.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div></details>
## 
## ```
```


```r
setkey(MT, cyl, gear)

MT[.(6, 4)] # Equivalent to MT[cyl == 6 & gear == 4]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [4 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="psyrhfsevt" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #psyrhfsevt .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #psyrhfsevt .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #psyrhfsevt .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #psyrhfsevt .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #psyrhfsevt .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #psyrhfsevt .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #psyrhfsevt .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #psyrhfsevt .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #psyrhfsevt .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #psyrhfsevt .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #psyrhfsevt .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #psyrhfsevt .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #psyrhfsevt .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #psyrhfsevt .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #psyrhfsevt .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #psyrhfsevt .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #psyrhfsevt .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #psyrhfsevt .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #psyrhfsevt .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #psyrhfsevt .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #psyrhfsevt .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #psyrhfsevt .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #psyrhfsevt .gt_left {
##   text-align: left;
## }
## 
## #psyrhfsevt .gt_center {
##   text-align: center;
## }
## 
## #psyrhfsevt .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #psyrhfsevt .gt_font_normal {
##   font-weight: normal;
## }
## 
## #psyrhfsevt .gt_font_bold {
##   font-weight: bold;
## }
## 
## #psyrhfsevt .gt_font_italic {
##   font-style: italic;
## }
## 
## #psyrhfsevt .gt_super {
##   font-size: 65%;
## }
## 
## #psyrhfsevt .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #psyrhfsevt .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #psyrhfsevt .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #psyrhfsevt .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #psyrhfsevt .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #psyrhfsevt .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">123</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="xnbqexqyod" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #xnbqexqyod .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #xnbqexqyod .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #xnbqexqyod .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #xnbqexqyod .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #xnbqexqyod .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #xnbqexqyod .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #xnbqexqyod .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #xnbqexqyod .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #xnbqexqyod .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #xnbqexqyod .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #xnbqexqyod .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #xnbqexqyod .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #xnbqexqyod .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xnbqexqyod .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #xnbqexqyod .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #xnbqexqyod .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xnbqexqyod .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #xnbqexqyod .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xnbqexqyod .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #xnbqexqyod .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xnbqexqyod .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #xnbqexqyod .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #xnbqexqyod .gt_left {
##   text-align: left;
## }
## 
## #xnbqexqyod .gt_center {
##   text-align: center;
## }
## 
## #xnbqexqyod .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #xnbqexqyod .gt_font_normal {
##   font-weight: normal;
## }
## 
## #xnbqexqyod .gt_font_bold {
##   font-weight: bold;
## }
## 
## #xnbqexqyod .gt_font_italic {
##   font-style: italic;
## }
## 
## #xnbqexqyod .gt_super {
##   font-size: 65%;
## }
## 
## #xnbqexqyod .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #xnbqexqyod .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #xnbqexqyod .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #xnbqexqyod .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #xnbqexqyod .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #xnbqexqyod .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">123</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div></details>
## 
## ```
```


**Filter by indices**

To filter by indices, we can use the `on` argument, which creates a **temporary secondary index** on the fly (if it doesn't already exist).


```r
IRIS["setosa", on = "Species"]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [50 x 5]*</summary>
## <br>
## <div class='light-mode'>
## <div id="whjdlaxdkm" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #whjdlaxdkm .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #whjdlaxdkm .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #whjdlaxdkm .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #whjdlaxdkm .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #whjdlaxdkm .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #whjdlaxdkm .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #whjdlaxdkm .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #whjdlaxdkm .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #whjdlaxdkm .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #whjdlaxdkm .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #whjdlaxdkm .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #whjdlaxdkm .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #whjdlaxdkm .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #whjdlaxdkm .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #whjdlaxdkm .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #whjdlaxdkm .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #whjdlaxdkm .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #whjdlaxdkm .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #whjdlaxdkm .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #whjdlaxdkm .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #whjdlaxdkm .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #whjdlaxdkm .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #whjdlaxdkm .gt_left {
##   text-align: left;
## }
## 
## #whjdlaxdkm .gt_center {
##   text-align: center;
## }
## 
## #whjdlaxdkm .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #whjdlaxdkm .gt_font_normal {
##   font-weight: normal;
## }
## 
## #whjdlaxdkm .gt_font_bold {
##   font-weight: bold;
## }
## 
## #whjdlaxdkm .gt_font_italic {
##   font-style: italic;
## }
## 
## #whjdlaxdkm .gt_super {
##   font-size: 65%;
## }
## 
## #whjdlaxdkm .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #whjdlaxdkm .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #whjdlaxdkm .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #whjdlaxdkm .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #whjdlaxdkm .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #whjdlaxdkm .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Sepal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Sepal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Petal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Petal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">Species</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.4</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.3</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.5</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.1</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">5.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #FFFFFF; color: #000000;">setosa</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #FFFFFF; color: #000000;" colspan="5"><em>[ omitted 35 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="bzpmppvwon" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #bzpmppvwon .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #bzpmppvwon .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #bzpmppvwon .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #bzpmppvwon .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #bzpmppvwon .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #bzpmppvwon .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #bzpmppvwon .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #bzpmppvwon .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #bzpmppvwon .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #bzpmppvwon .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #bzpmppvwon .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #bzpmppvwon .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #bzpmppvwon .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bzpmppvwon .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #bzpmppvwon .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #bzpmppvwon .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bzpmppvwon .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #bzpmppvwon .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bzpmppvwon .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #bzpmppvwon .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bzpmppvwon .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #bzpmppvwon .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #bzpmppvwon .gt_left {
##   text-align: left;
## }
## 
## #bzpmppvwon .gt_center {
##   text-align: center;
## }
## 
## #bzpmppvwon .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #bzpmppvwon .gt_font_normal {
##   font-weight: normal;
## }
## 
## #bzpmppvwon .gt_font_bold {
##   font-weight: bold;
## }
## 
## #bzpmppvwon .gt_font_italic {
##   font-style: italic;
## }
## 
## #bzpmppvwon .gt_super {
##   font-size: 65%;
## }
## 
## #bzpmppvwon .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #bzpmppvwon .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #bzpmppvwon .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #bzpmppvwon .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #bzpmppvwon .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #bzpmppvwon .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Sepal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Sepal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Petal.Length</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Petal.Width</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">Species</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.4</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.3</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.5</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.5</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.2</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.1</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0.1</td>
## <td class="gt_row gt_left" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">setosa</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">5.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0.2</td>
## <td class="gt_row gt_left" style="background-color: #222222; color: #FFFFFF;">setosa</td></tr>
##   </tbody>
##   <tfoot class="gt_sourcenotes">
##     <tr>
##       <td class="gt_sourcenote" style="background-color: #222222; color: #FFFFFF;" colspan="5"><em>[ omitted 35 entries ]</em></td>
##     </tr>
##   </tfoot>
##   
## </table>
## </div>
## </div></details>
## 
## ```
```

Since the time to compute the secondary indices is quite small, we don’t have to use `setindex`, unless the task involves repeated subsetting on the same columns.


:::{.callout-tip}
When using `on` with multiple values, the `nomatch = NULL` argument avoids 
creating combinations that do not exist in the original data (i.e. for `cyl == 5` here)
:::


```r
MT[.(4:6, 4), on = c("cyl", "gear"), nomatch = NULL]
```

```
## ```{=html}
## 
## <details>
## <summary>
## *data.table [12 x 11]*</summary>
## <br>
## <div class='light-mode'>
## <div id="kqpthjuimo" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #kqpthjuimo .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #kqpthjuimo .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #kqpthjuimo .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #kqpthjuimo .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #kqpthjuimo .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #kqpthjuimo .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #kqpthjuimo .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #kqpthjuimo .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #kqpthjuimo .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #kqpthjuimo .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #kqpthjuimo .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #kqpthjuimo .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #kqpthjuimo .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kqpthjuimo .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #kqpthjuimo .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #kqpthjuimo .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kqpthjuimo .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #kqpthjuimo .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kqpthjuimo .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #kqpthjuimo .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kqpthjuimo .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #kqpthjuimo .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #kqpthjuimo .gt_left {
##   text-align: left;
## }
## 
## #kqpthjuimo .gt_center {
##   text-align: center;
## }
## 
## #kqpthjuimo .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #kqpthjuimo .gt_font_normal {
##   font-weight: normal;
## }
## 
## #kqpthjuimo .gt_font_bold {
##   font-weight: bold;
## }
## 
## #kqpthjuimo .gt_font_italic {
##   font-style: italic;
## }
## 
## #kqpthjuimo .gt_super {
##   font-size: 65%;
## }
## 
## #kqpthjuimo .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #kqpthjuimo .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #kqpthjuimo .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #kqpthjuimo .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #kqpthjuimo .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #kqpthjuimo .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #FFFFFF; color: #0D6EFD; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #0d6efd; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #0d6efd;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">22.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">108</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">93</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.85</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.32</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.61</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">24.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">146.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">62</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.69</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.19</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">20</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">22.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">140.8</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">95</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">22.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">32.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">78.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">66</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">19.47</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">30.4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">75.7</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">52</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.93</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.615</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.52</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">33.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">71.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">65</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.22</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1.835</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">19.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">27.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">79</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">66</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4.08</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1.935</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">121</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">109</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4.11</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.78</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">21</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">160</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">110</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">123</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">1</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">0</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td>
## <td class="gt_row gt_right" style="background-color: #FFFFFF; color: #000000;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(233,233,233,0.8); color: #000000; font-weight: normal;">4</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div><div class='dark-mode'><div id="mzwtzoyxny" style="overflow-x:auto;overflow-y:auto;width:100%;height:auto;">
##   <style>html {
##   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
## }
## 
## #mzwtzoyxny .gt_table {
##   display: table;
##   border-collapse: collapse;
##   margin-left: auto;
##   margin-right: auto;
##   color: #333333;
##   font-size: 16px;
##   font-weight: normal;
##   font-style: normal;
##   background-color: #FFFFFF;
##   width: 100%;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #A8A8A8;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #A8A8A8;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_heading {
##   background-color: #FFFFFF;
##   text-align: center;
##   border-bottom-color: #FFFFFF;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_title {
##   color: #333333;
##   font-size: 125%;
##   font-weight: initial;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-color: #FFFFFF;
##   border-bottom-width: 0;
## }
## 
## #mzwtzoyxny .gt_subtitle {
##   color: #333333;
##   font-size: 85%;
##   font-weight: initial;
##   padding-top: 0;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-color: #FFFFFF;
##   border-top-width: 0;
## }
## 
## #mzwtzoyxny .gt_bottom_border {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_col_headings {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_col_heading {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 6px;
##   padding-left: 5px;
##   padding-right: 5px;
##   overflow-x: hidden;
## }
## 
## #mzwtzoyxny .gt_column_spanner_outer {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: normal;
##   text-transform: inherit;
##   padding-top: 0;
##   padding-bottom: 0;
##   padding-left: 4px;
##   padding-right: 4px;
## }
## 
## #mzwtzoyxny .gt_column_spanner_outer:first-child {
##   padding-left: 0;
## }
## 
## #mzwtzoyxny .gt_column_spanner_outer:last-child {
##   padding-right: 0;
## }
## 
## #mzwtzoyxny .gt_column_spanner {
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: bottom;
##   padding-top: 5px;
##   padding-bottom: 5px;
##   overflow-x: hidden;
##   display: inline-block;
##   width: 100%;
## }
## 
## #mzwtzoyxny .gt_group_heading {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #mzwtzoyxny .gt_empty_group_heading {
##   padding: 0.5px;
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   vertical-align: middle;
## }
## 
## #mzwtzoyxny .gt_from_md > :first-child {
##   margin-top: 0;
## }
## 
## #mzwtzoyxny .gt_from_md > :last-child {
##   margin-bottom: 0;
## }
## 
## #mzwtzoyxny .gt_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   margin: 10px;
##   border-top-style: solid;
##   border-top-width: 1px;
##   border-top-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 1px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 1px;
##   border-right-color: #D3D3D3;
##   vertical-align: middle;
##   overflow-x: hidden;
## }
## 
## #mzwtzoyxny .gt_stub {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mzwtzoyxny .gt_stub_row_group {
##   color: #333333;
##   background-color: #FFFFFF;
##   font-size: 100%;
##   font-weight: initial;
##   text-transform: inherit;
##   border-right-style: solid;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
##   padding-left: 5px;
##   padding-right: 5px;
##   vertical-align: top;
## }
## 
## #mzwtzoyxny .gt_row_group_first td {
##   border-top-width: 2px;
## }
## 
## #mzwtzoyxny .gt_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mzwtzoyxny .gt_first_summary_row {
##   border-top-style: solid;
##   border-top-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_first_summary_row.thick {
##   border-top-width: 2px;
## }
## 
## #mzwtzoyxny .gt_last_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_grand_summary_row {
##   color: #333333;
##   background-color: #FFFFFF;
##   text-transform: inherit;
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mzwtzoyxny .gt_first_grand_summary_row {
##   padding-top: 8px;
##   padding-bottom: 8px;
##   padding-left: 5px;
##   padding-right: 5px;
##   border-top-style: double;
##   border-top-width: 6px;
##   border-top-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_striped {
##   background-color: rgba(128, 128, 128, 0.05);
## }
## 
## #mzwtzoyxny .gt_table_body {
##   border-top-style: solid;
##   border-top-width: 2px;
##   border-top-color: #D3D3D3;
##   border-bottom-style: solid;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_footnotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_footnote {
##   margin: 0px;
##   font-size: 90%;
##   padding-left: 4px;
##   padding-right: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mzwtzoyxny .gt_sourcenotes {
##   color: #333333;
##   background-color: #FFFFFF;
##   border-bottom-style: none;
##   border-bottom-width: 2px;
##   border-bottom-color: #D3D3D3;
##   border-left-style: none;
##   border-left-width: 2px;
##   border-left-color: #D3D3D3;
##   border-right-style: none;
##   border-right-width: 2px;
##   border-right-color: #D3D3D3;
## }
## 
## #mzwtzoyxny .gt_sourcenote {
##   font-size: 90%;
##   padding-top: 4px;
##   padding-bottom: 4px;
##   padding-left: 5px;
##   padding-right: 5px;
## }
## 
## #mzwtzoyxny .gt_left {
##   text-align: left;
## }
## 
## #mzwtzoyxny .gt_center {
##   text-align: center;
## }
## 
## #mzwtzoyxny .gt_right {
##   text-align: right;
##   font-variant-numeric: tabular-nums;
## }
## 
## #mzwtzoyxny .gt_font_normal {
##   font-weight: normal;
## }
## 
## #mzwtzoyxny .gt_font_bold {
##   font-weight: bold;
## }
## 
## #mzwtzoyxny .gt_font_italic {
##   font-style: italic;
## }
## 
## #mzwtzoyxny .gt_super {
##   font-size: 65%;
## }
## 
## #mzwtzoyxny .gt_two_val_uncert {
##   display: inline-block;
##   line-height: 1em;
##   text-align: right;
##   font-size: 60%;
##   vertical-align: -0.25em;
##   margin-left: 0.1em;
## }
## 
## #mzwtzoyxny .gt_footnote_marks {
##   font-style: italic;
##   font-weight: normal;
##   font-size: 75%;
##   vertical-align: 0.4em;
## }
## 
## #mzwtzoyxny .gt_asterisk {
##   font-size: 100%;
##   vertical-align: 0;
## }
## 
## #mzwtzoyxny .gt_slash_mark {
##   font-size: 0.7em;
##   line-height: 0.7em;
##   vertical-align: 0.15em;
## }
## 
## #mzwtzoyxny .gt_fraction_numerator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: 0.45em;
## }
## 
## #mzwtzoyxny .gt_fraction_denominator {
##   font-size: 0.6em;
##   line-height: 0.6em;
##   vertical-align: -0.05em;
## }
## </style>
##   <table class="gt_table">
##   
##   <thead class="gt_col_headings">
##     <tr>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">mpg</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">cyl</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">disp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">hp</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">drat</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">wt</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">qsec</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">vs</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">am</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">gear</th>
##       <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" style="background-color: #222222; color: #20C997; font-weight: bold; border-top-width: 2px; border-top-style: solid; border-top-color: #20c997; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #20c997;">carb</th>
##     </tr>
##   </thead>
##   <tbody class="gt_table_body">
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">22.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">108</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">93</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.85</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.32</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.61</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">24.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">146.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">62</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.69</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.19</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">20</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">22.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">140.8</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">95</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.15</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">22.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">32.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">78.7</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">66</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.08</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.2</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">19.47</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">30.4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">75.7</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">52</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.93</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.615</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.52</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">33.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">71.1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">65</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.22</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1.835</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">19.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">27.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">79</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">66</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4.08</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1.935</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21.4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">121</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">109</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4.11</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.78</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">21</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">160</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">110</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.9</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">2.62</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">16.46</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">21</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">160</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">110</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">2.875</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.02</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">19.2</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">167.6</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">123</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.92</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">3.44</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">18.3</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">1</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">0</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td>
## <td class="gt_row gt_right" style="background-color: #222222; color: #FFFFFF;">4</td></tr>
##     <tr><td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">17.8</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">167.6</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">123</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.92</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">3.44</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">18.9</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">1</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">0</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td>
## <td class="gt_row gt_right" style="background-color: rgba(30,30,30,0.8); color: #FFFFFF; font-weight: normal;">4</td></tr>
##   </tbody>
##   
##   
## </table>
## </div>
## </div></details>
## 
## ```
```
