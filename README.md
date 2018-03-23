
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Grammar of Tables

The goal of **gt** is to allow anyone to easily build presentation
tables from tabular data using the Grammar of Tables approach. We
essentially want the activity of building tables to be done with a clear
separation of concerns: you don’t have to decide how the tabular data
gets transformed and structured while also worrying about aesthetics.

While the Grammar of Tables API is still undergoing a first draft, the
model for the constituent parts of a table has been tentatively put
forward. The schematic below provides an outline of how the table
components fit together.

<img src="man/figures/gt_parts_of_a_table.png">

The main structural parts of a table (and their subparts) are:

  - the **heading** (optional; possibly with a **table number**,
    **title**, or **headnote**)
  - the **stub** (contains a **stub head** and one or more **stub
    blocks**)
  - the **boxhead** (contains **column headings**, optionally within
    **panels** having one or more **spanner headings**)
  - the **field** (contains *cells*, *columns*, and *rows*)
  - the **footnote**
  - the **source note**

The **heading** table part contains the table title and the optional
table number and headnote subparts. This part is often overlooked but as
it relates very closely to the tabular data it is recognized here as
integral to finalized output.

The **stub** is the area to the left in a table that contains **row
captions**, **summary captions**, and **group headings**. Those subparts
can be grouped in a sequence of **stub blocks**. The **stub head**
provides a location for a caption that describes the **stub**.

The **boxhead** is the part that contains the **column headings**, which
can themselves be supplemented by **spanner headings** (which are placed
above) and contained in one or more **panels**.

The **field** is located below the **boxhead** and right of the
**stub**. Composed of *cells*, where vertical and horizontal collections
are termed *columns* and *rows*.

The **footnote** area contains statements explaining information (or,
lack of information) in a column, row, or one or more cells. This is
done by affixing reference symbols or letters/digits to points of
reference.

The **source note** area is for provision of citation information for
the presented data. As it is commonly seen, the citation is preceeded by
the word `Source`.

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.

## License

MIT © RStudio
