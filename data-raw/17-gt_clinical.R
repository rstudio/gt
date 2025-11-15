library(tidyverse)

rx_subjects <- paste0("GT", 1001:1180)
rx_treatments <- c("Placebo", "Drug 1")

set.seed(3141592)

### Creata rx_adsl
### adsl contains a full description of baseline covariates of study participants (incl. screen failures)

rx_adsl <- dplyr::tribble(
  ~STUDYID, ~STUDYIDN, ~USUBJID,               ~TRTA,   ~TRTAN,      ~ITTFL, ~RANDFL,               ~SCRFREAS,
  "GT01",     "4001",  "GT1000",    "Screen Failure",        3,        "N",     "N", "WITHDRAWAL BY SUBJECT",
  "GT01",     "4001",  "GT1181",    "Screen Failure",        3,        "N",     "N",                 "OTHER",
) |>
  dplyr::bind_rows(
    data.frame(STUDYID = "GT01",
               STUDYIDN = "4001",
               USUBJID = rx_subjects,
               TRTA = rep(rx_treatments, each = length(rx_subjects) / length(rx_treatments)),
               TRTAN = rep(seq_along(rx_treatments), each = length(rx_subjects) / length(rx_treatments)),
               ITTFL = "Y",
               RANDFL = "Y",
               SCRFREAS = ""
    )
  ) |>
  dplyr::mutate(TRTA = factor(TRTA, levels = rx_treatments)) |>
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

attr(rx_adsl$STUDYID, "label") <- "Unique Study Identifier"
attr(rx_adsl$STUDYIDN, "label") <- "Unique Study Identifier (N)"
attr(rx_adsl$USUBJID, "label") <- "Unique Subject Identifier"
attr(rx_adsl$TRTA, "label") <- "Actual Treatment"
attr(rx_adsl$TRTAN, "label") <- "Actual Treatment (N)"
attr(rx_adsl$ITTFL, "label") <- "ITT Population Flag"
attr(rx_adsl$RANDFL, "label") <- "Randomization Flag"
attr(rx_adsl$SCRFREAS, "label") <- "Reason for Screen Failure"
attr(rx_adsl$AGE, "label") <- "Age"
attr(rx_adsl$AGE, "units") <- "Years"
attr(rx_adsl$AAGEGR1, "label") <- "Age Group"
attr(rx_adsl$SEX, "label") <- "Sex"
attr(rx_adsl$ETHNIC, "label") <- "Ethnicity"
attr(rx_adsl$BLBMI, "label") <- "Body Mass Index"
attr(rx_adsl$BLBMI, "units") <- "kg/m2"
attr(rx_adsl$EVNTFL, "label") <- "Event Flag"

### Create rx_addv
### addv contains all study-related protocol deviations for the ITT population

addv_dem <- rx_adsl |>
  dplyr::filter(ITTFL == "Y") |>
  dplyr::select(-c(SCRFREAS, RANDFL, EVNTFL))

# 1. Protocol deviation: Questionnaire not completed at month 3

addv_qsm3 <- addv_dem |>
  dplyr::group_by(TRTA) |>
  dplyr::mutate(
    AVAL = sample(x = c(0, 1), size = dplyr::n(), replace = TRUE, prob = c(.9, .1)),
    DVTERM = "{gt} Questionnaire (GTQ v1.0) not completed at month 3",
    PARAMCD = "PDEV01",
    PARAM = "GTQ not completed month 3.",
    PARCAT1 = "PROTOCOL DEVIATION",
    DVCAT = "Major",
    ACAT1 = "Study Procedures Criteria Deviations",
    CRIT1 = "COVID-19 Related",
    CRIT1FL = sample(x = c("Y", "N"), size = dplyr::n(), replace = TRUE, prob = c(.1, .9))
  ) |>
  dplyr::ungroup() |>
  dplyr::filter(AVAL == 1)

# 2. Protocol deviation: Lab values not taken at month 3

addv_labm3 <- addv_dem |>
  dplyr::group_by(TRTA) |>
  dplyr::mutate(
    AVAL = sample(x = c(0, 1), size = dplyr::n(), replace = TRUE, prob = c(.85, .15)),
    DVTERM = "Lab values not taken at month 3",
    PARAMCD = "PDEV02",
    PARAM = "Lab values not taken month 3.",
    PARCAT1 = "PROTOCOL DEVIATION",
    DVCAT = "Major",
    ACAT1 = "Study Procedures Criteria Deviations",
    CRIT1 = "COVID-19 Related",
    CRIT1FL = sample(x = c("Y", "N"), size = dplyr::n(), replace = TRUE, prob = c(.15, .85))
  ) |>
  dplyr::ungroup() |>
  dplyr::filter(AVAL == 1)

# 3. Protocol deviation: Questionnaire not completed at month 6

addv_qsm6 <- addv_dem |>
  dplyr::group_by(TRTA) |>
  dplyr::mutate(
    AVAL = sample(x = c(0, 1), size = dplyr::n(), replace = TRUE, prob = c(.9, .1)),
    DVTERM = "{gt} Questionnaire (GTQ v1.0) not completed at month 6",
    PARAMCD = "PDEV03",
    PARAM = "GTQ not completed month 6.",
    PARCAT1 = "PROTOCOL DEVIATION",
    DVCAT = "Major",
    ACAT1 = "Study Procedures Criteria Deviations",
    CRIT1 = "COVID-19 Related",
    CRIT1FL = sample(x = c("Y", "N"), size = dplyr::n(), replace = TRUE, prob = c(.3, .7))
  ) |>
  dplyr::ungroup() |>
  dplyr::filter(AVAL == 1)

# 4. Protocol deviation: Visit at month 3 not done

addv_vsm3 <- addv_dem |>
  dplyr::group_by(TRTA) |>
  dplyr::mutate(
    AVAL = sample(x = c(0, 1), size = dplyr::n(), replace = TRUE, prob = c(.9, .1)),
    DVTERM = "Month 3 Visit is not done",
    PARAMCD = "PDEV04",
    PARAM = "Month 3 Visit not done.",
    PARCAT1 = "PROTOCOL DEVIATION",
    DVCAT = "Major",
    ACAT1 = "Study Visit Schedule Deviations",
    CRIT1 = "COVID-19 Related",
    CRIT1FL = sample(x = c("Y", "N"), size = dplyr::n(), replace = TRUE, prob = c(.3, .7))
  ) |>
  dplyr::ungroup() |>
  dplyr::filter(AVAL == 1)

# 5. Protocol deviation: visit at month 6 not done

addv_vsm6 <- addv_dem |>
  dplyr::group_by(TRTA) |>
  dplyr::mutate(
    AVAL = sample(x = c(0, 1), size = dplyr::n(), replace = TRUE, prob = c(.85, .15)),
    DVTERM = "Month 6 Visit is not done",
    PARAMCD = "PDEV05",
    PARAM = "Month 6 Visit not done.",
    PARCAT1 = "PROTOCOL DEVIATION",
    DVCAT = "Major",
    ACAT1 = "Study Visit Schedule Deviations",
    CRIT1 = "COVID-19 Related",
    CRIT1FL = sample(x = c("Y", "N"), size = dplyr::n(), replace = TRUE, prob = c(.3, .7))
  ) |>
  dplyr::ungroup() |>
  dplyr::filter(AVAL == 1)

### Combine all protocol deviations and create summaries

rx_addv_raw <- list(addv_qsm3, addv_labm3, addv_qsm6, addv_vsm3, addv_vsm6) |>
  purrr::reduce(dplyr::bind_rows)

addv_sum1 <- merge(addv_dem, dplyr::select(rx_addv_raw, USUBJID, PARAMCD, AVAL, CRIT1FL), all = TRUE) |>
  dplyr::group_by(STUDYID, STUDYIDN, USUBJID, TRTA, TRTAN, ITTFL, AGE, AAGEGR1, SEX, ETHNIC, BLBMI, CRIT1FL) |>
  dplyr::summarize(
    AVAL = as.numeric(sum(AVAL, na.rm = TRUE) == 1),
    PARAMCD = "PDANYM",
    PARAM = "At least one major Protocol Deviation",
    PARCAT1 = "OVERALL",
    .groups = "drop"
  ) |>
  dplyr::mutate(
    CRIT1 = "COVID-19 Related",
    CRIT1FL = ifelse(is.na(CRIT1FL), "N", CRIT1FL)
  )

rx_addv <- dplyr::bind_rows(rx_addv_raw, addv_sum1) |>
  dplyr::mutate(
    dplyr::across(c(DVTERM, DVCAT, ACAT1), ~ifelse(is.na(.), "", .)),
    PARAMCD = factor(
      PARAMCD,
      levels = c("PDANYM", paste0("PDEV0", 1:5))
    ),
    PARAM = forcats::fct_reorder(PARAM, as.numeric(PARAMCD))
  ) |>
  dplyr::arrange(USUBJID, PARAM) |>
  dplyr::select(STUDYID, STUDYIDN, USUBJID, TRTA, TRTAN, ITTFL, AGE, AAGEGR1, SEX, ETHNIC, BLBMI, DVTERM, PARAMCD,
                PARAM, PARCAT1, DVCAT, ACAT1, AVAL, CRIT1, CRIT1FL)


attr(rx_addv$STUDYID, "label") <- "Unique Study Identifier"
attr(rx_addv$STUDYIDN, "label") <- "Unique Study Identifier (N)"
attr(rx_addv$USUBJID, "label") <- "Unique Subject Identifier"
attr(rx_addv$TRTA, "label") <- "Actual Treatment"
attr(rx_addv$TRTAN, "label") <- "Actual Treatment (N)"
attr(rx_addv$ITTFL, "label") <- "ITT Population Flag"
attr(rx_addv$AGE, "label") <- "Age"
attr(rx_addv$AGE, "units") <- "Years"
attr(rx_addv$AAGEGR1, "label") <- "Age Group"
attr(rx_addv$SEX, "label") <- "Sex"
attr(rx_addv$ETHNIC, "label") <- "Ethnicity"
attr(rx_addv$BLBMI, "label") <- "Body Mass Index"
attr(rx_addv$BLBMI, "units") <- "kg/m2"
attr(rx_addv$DVTERM, "label") <- "Protocol Deviation Term"
attr(rx_addv$PARAMCD, "label") <- "Parameter Code"
attr(rx_addv$PARAM, "label") <- "Parameter"
attr(rx_addv$PARCAT1, "label") <- "Parameter Category 1"
attr(rx_addv$DVCAT, "label") <- "Protocol Deviation Category"
attr(rx_addv$ACAT1, "label") <- "Analysis Category 1"
attr(rx_addv$AVAL, "label") <- "Analysis Value"
attr(rx_addv$CRIT1, "label") <- "Analysis Criterion 1"
attr(rx_addv$CRIT1FL, "label") <- "Criterion 1 Evaluation Flag"
