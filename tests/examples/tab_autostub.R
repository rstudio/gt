library(gt)

# Create a table that creates a stub and
# stub blocks based on a naming convention
tbl <-
  dplyr::tribble(
    ~groupname, ~rowname, ~value_1, ~value_2,
    "A",        "1",      361.1,    260.1,
    "A",        "2",      184.3,    84.4,
    "A",        "3",      342.3,    126.3,
    "A",        "4",      234.9,    37.1,
    "B",        "1",      190.9,    832.5,
    "B",        "2",      743.3,    281.2,
    "B",        "3",      252.3,    732.5,
    "B",        "4",      344.7,    281.2,
    "C",        "1",      197.2,    818.0,
    "C",        "2",      284.6,    394.4)

# Create a display table
tab_autostub <-
  gt(data = tbl) %>%
  tab_stubhead_caption(caption = "groups")

tab_autostub
