## Isolating Edwards' item groupings for Emily to run Krippendorf Alphas on - 7/19/24

emily <- read.csv("edwards.csv")[c(1,2,4,7,10,11,12,16),-c(1,2)]
em2 <- emily[,c(6,36,2,11,29,17,47,228,33,181,19,22,12,4,1)]  ## Order of Emily's graphs
write.csv(em2, "Edwards_15_Isolated.csv")
