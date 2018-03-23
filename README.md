
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Grammar of Tables

The goal of gt is to allow anyone to easily build presentation table
from tabular data using the Grammar of Tables ethos. With this layering
approach, we approach the building of tables with a clear separation of
concerns: you don’t have to decide how the tabular data gets transformed
and structured whilst also worrying about aesthetics.

While the Grammar of Tables API hasn’t been fully developed yet, the
model for the constituent parts of a table has been put forward as a
first draft. The schematic below provides an outline of the how the
table components fit together.

<img src="man/figures/gt_parts_of_a_table.png">

The main structural parts of a table (and their subcomponents) are:

  - the heading (with table number, title, headnote)
  - the stub (with stub head and stub blocks)
  - the boxhead (with panels)
  - the field (contains cells, columns, and rows)
  - the footnote
  - the source note
