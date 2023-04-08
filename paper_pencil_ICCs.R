## Looking at inter-rater for paper and pencil forms - 4/8/23

## Run .Rmd through `Figure 2` chunk to populate environment

oneicc <- form1[3:302]

## psych::ICC(t(oneicc))

oneicc_1 = oneicc[,grepl("_1",names(oneicc))]
oneicc_2 = oneicc[,grepl("_2",names(oneicc))]
oneicc_3 = oneicc[,grepl("_3",names(oneicc))]
oneicc_4 = oneicc[,grepl("_4",names(oneicc))]
oneicc_5 = oneicc[,grepl("_5",names(oneicc))]

psych::ICC(t(oneicc_1))
psych::ICC(t(oneicc_2))
psych::ICC(t(oneicc_3))
psych::ICC(t(oneicc_4))
psych::ICC(t(oneicc_5))
