library(tidyverse)

gt_subjects <- paste0("GT", 1001:1180)
gt_treatments <- c("Placebo", "Drug 1")

set.seed(3141592)

gt_adsl <- dplyr::tribble(
  ~STUDYID, ~STUDYIDN, ~USUBJID,               ~TRTA,   ~TRTAN,      ~ITTFL, ~RANDFL,               ~SCRFREAS,
  "GT01",     "4001",  "GT1000",    "Screen Failure",        3,        "N",     "N", "WITHDRAWAL BY SUBJECT",
  "GT01",     "4001",  "GT1181",    "Screen Failure",        3,        "N",     "N",                 "OTHER",
) |>
  dplyr::bind_rows(
    data.frame(STUDYID = "GT01",
               STUDYIDN = "4001",
               USUBJID = gt_subjects,
               TRTA = rep(gt_treatments, each = length(gt_subjects)/length(gt_treatments)),
               TRTAN = rep(seq_along(gt_treatments), each = length(gt_subjects)/length(gt_treatments)),
               ITTFL = "Y",
               RANDFL = "Y",
               SCRFREAS = ""
                 )
  ) |>
  dplyr::mutate(TRTA = factor(TRTA, levels = gt_treatments)) |>
  dplyr::arrange(USUBJID) |>
  dplyr::group_by(TRTA) |>
  dplyr::mutate(AGE = rpois(n = dplyr::n(), lambda = 40),
                AAGEGR1 = factor(
                  ifelse(AGE >= 40, ">=40", "<40"),
                  levels = c("<40", ">=40")
                ),
                SEX = factor(
                  sample(c("M", "F", "U"), dplyr::n(), replace = TRUE, prob = c(.6, .35, 0.05)),
                  levels = c("M", "F", "U"),
                  labels = c("Male", "Female", "Undifferentiated")
                  ),
                ETHNIC = factor(
                  sample(c("HISPANIC OR LATINO", "NOT HISPANIC OR LATINO", ""), dplyr::n(), replace = TRUE, prob = c(.4, .5, .1)),
                  levels = c("HISPANIC OR LATINO", "NOT HISPANIC OR LATINO", ""),
                  labels = c("Hispanic or Latino", "Not Hispanic or Latino", "Missing")
                ),
                BLBMI = runif(n = dplyr::n(), min = 18, max = 35),
                EVNTFL = dplyr::case_when(
                  TRTAN == 3 ~ "",
                  TRTAN == 2 ~ sample(c("Y", "N"), dplyr::n(), replace = TRUE, prob = c(.7, .3)),
                  TRTAN == 1 ~ sample(c("Y", "N"), dplyr::n(), replace = TRUE, prob = c(.4, .6))
                )
                ) |>
  dplyr::ungroup()

attr(gt_adsl$STUDYID, "label") <- "Unique Study Identifier"
attr(gt_adsl$STUDYIDN, "label") <- "Unique Study Identifier (N)"
attr(gt_adsl$USUBJID, "label") <- "Unique Subject Identifier"
attr(gt_adsl$TRTA, "label") <- "Actual Treatment"
attr(gt_adsl$TRTAN, "label") <- "Actual Treatment (N)"
attr(gt_adsl$ITTFL, "label") <- "ITT Population Flag"
attr(gt_adsl$RANDFL, "label") <- "Randomization Flag"
attr(gt_adsl$SCRFREAS, "label") <- "Reason for Screen Failure"
attr(gt_adsl$AGE, "label") <- "Age"
attr(gt_adsl$AGE, "units") <- "Years"
attr(gt_adsl$AAGEGR1, "label") <- "Age Group"
attr(gt_adsl$SEX, "label") <- "Sex"
attr(gt_adsl$ETHNIC, "label") <- "Ethnicity"
attr(gt_adsl$BLBMI, "label") <- "Body Mass Index"
attr(gt_adsl$BLBMI, "units") <- "kg/m2"
attr(gt_adsl$EVNTFL, "label") <- "Event Flag"


