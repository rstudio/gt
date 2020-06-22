# gt 0.2.1.9000 (unreleased)

* Restore the ability to have row striping in stub cells (with `tab_option()`'s `row.striping.include_stub = TRUE`). Thanks @gergness for creating the PR that prompted this final fix (#537). PR: #564.

# gt 0.2.1

* `summary_rows()` and `grand_summary_rows()` no longer incorrectly calculate summary values in cases where rows aren't already sorted by group (#556).

* Ensure compatibility with **tibble** 3.0.0 (#557).

* Adapt tests to changes in dependent packages (#575)

# gt 0.2.0.5 (2020-03-31)

* New package with 80 exported functions for building display tables

# gt 0.1.0 (unreleased)
