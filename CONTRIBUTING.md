# Information and Guidelines for Contributing to gt

There are many ways to contribute to the ongoing development of the
**gt** package. Some contributions can be rather easy to do (e.g.,
fixing typos, improving documentation, filing issues for feature
requests or problems, etc.) whereas other contributions can require more
time and patience (like answering questions and submitting pull requests
with code changes). Just know that that help provided in any capacity is
very much appreciated. :)

## Filing Issues

If you believe you found a bug, create a minimal
[reprex](https://reprex.tidyverse.org) for your posting to the [**gt**
issue tracker](https://github.com/rstudio/gt/issues). Try not to include
anything unnecessary, just the minimal amount of code that constitutes
the reproducible bug. We will try to verify the bug by running the code
in the reprex provided. The quality of the reprex will reduce the amount
of back-and-forth communication in trying to understand how to execute
the code on our systems.

## Answering questions

A great way to help is by simply answering questions. It’s amazing how a
little conversation could lead to better insights on a problem. Don’t
quite know the answer? That’s okay too. We’re all in this together.

Where might you answer user questions? Some of the forums for Q&A on
**gt** include the [Posit community](https://forum.posit.co), on Bluesky
(a good search term is `gt #rstats`), and on [Stack
Overflow](https://stackoverflow.com). Good etiquette is key during these
interactions: be a good person to all who ask questions.

### Making Pull Requests

Should you consider making a pull request (PR), please file an issue
first and explain the problem in some detail. If the PR is an
enhancement, detail how the change would make things better for package
users. Bugfix PRs also require some explanation about the bug and how
the proposed fix will remove that bug. A great way to illustrate the bug
is to include a [reprex](https://reprex.tidyverse.org). While all this
upfront work prior to preparing a PR can be time-consuming it opens a
line of communication with the package authors and the community,
perhaps leading to better enhancement or more effective fixes!

Once there is consensus that a PR based on the issue would be helpful,
adhering to the following process will make things proceed more quickly:

- Create a separate Git branch for each PR.
- Look at the build status badges before and after making changes; these
  badges are available in the package
  [README](https://github.com/rstudio/gt).  
- The **gt** package follows the tidyverse [style
  guide](http://style.tidyverse.org) so please adopt those style
  guidelines in your submitted code as best as possible.
- The internal documentation uses
  [roxygen2](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html);
  if your contribution requires new or revised documentation ensure that
  the roxygen comments are added/modified (do not modify any `.Rd` files
  in the `man` folder).

Many functions share parameters. For common parameters like `rows`,
`columns`, `data`, we use
[`@inheritParams`](https://roxygen2.r-lib.org/reference/tags-reuse.html)
to document them. Only document these parameters if there is a special
case for the function you are documenting. In this case, go to
`R/format-data.R`, copy the parameter documentation to the desired
function and add additional details.

- We use [testthat](https://cran.r-project.org/web/packages/testthat/)
  for code coverage; those contributions with test cases included are
  helpful easier to accept.
- Ensure that you have signed the contributor license agreement. It will
  appear as a “Check” on your PR and a comment from “CLAassistant” will
  also appear explaining whether you have yet to sign. After you sign,
  you can click the “Recheck” link in that comment and the check will
  flip to reflect that you’ve signed.
