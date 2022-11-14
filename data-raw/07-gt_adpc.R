library(tidyverse)


set.seed(3141592)


gt_subjects <- paste0("GT", 1001:1018) 
gt_timepoints <- c(0, 0.5, 1, 1.5, 2, 4, 8, 12, 24)
gt_treatments <- c("Placebo", "Treatment 1", "Treatment 2")

gt_adpc <- expand.grid(USUBJID = gt_subjects,
                       PKFL = "Y", 
                       ATPTN = gt_timepoints) |> 
  dplyr::arrange(USUBJID, ATPTN) |> 
  dplyr::mutate(ATPT = ifelse(ATPTN == 0, "predose", paste0(ATPTN, "hrs after administration")),
                TRTAN = rep(1:3, each = dplyr::n()/3),
                TRTA = factor(rep(gt_treatments, each = dplyr::n()/3),
                              levels = gt_treatments),
                AVAL = ifelse(ATPTN == 0, 0, 1000*exp(log((exp(-.2*ATPTN) - exp(-.8*ATPTN))) + (TRTAN-2)*log(1.2) + .2*rnorm(dplyr::n()))),
                AVALC = ifelse(AVAL == 0, "<LLOQ", signif(AVAL, digits = 3))
                )

set.seed(7)

gt_adsl <- gt_adpc |> 
  dplyr::select(USUBJID, TRTAN, TRTA) |> 
  dplyr::distinct() |> 
  dplyr::mutate(STUDYID = "GT01",
                SEX = sample(c("F", "M", "U"), dplyr::n(), replace = TRUE, prob = c(.45, .52, .03)),
                AAGE = runif(dplyr::n(), min = 22, max = 65),
                AGE = round(AAGE),
                BLBMI = runif(dplyr::n(), min = 16, max = 35),
                PKFL = "Y",
                ITTFL = sample(c("Y", "N"), dplyr::n(), replace = TRUE, prob = c(.9, .1)))

