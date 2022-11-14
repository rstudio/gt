library(tidyverse)


set.seed(3141592)


gt_subjects <- paste0("GT", 1001:1018) 
gt_timepoints <- c(0, 0.5, 1, 1.5, 2, 4, 8, 12, 24)
gt_treatments <- c("Placebo", "Treatment 1", "Treatment 2")

gt_adpc <- expand.grid(SUBJID = gt_subjects,
                       PKFL = "Y", 
                       ATPTN = gt_timepoints) |> 
  dplyr::arrange(SUBJID, ATPTN) |> 
  dplyr::mutate(ATPT = ifelse(ATPTN == 0, "predose", paste0(ATPTN, "hrs after administration")),
                TRTAN = rep(1:3, each = dplyr::n()/3),
                TRTA = factor(rep(gt_treatments, each = dplyr::n()/3),
                              levels = gt_treatments),
                AVAL = ifelse(ATPTN == 0, 0, 1000*exp(log((exp(-.2*ATPTN) - exp(-.8*ATPTN))) + (TRTAN-2)*log(1.2) + .2*rnorm(dplyr::n()))),
                AVALC = ifelse(AVAL == 0, "<LLOQ", signif(AVAL, digits = 3))
                )




