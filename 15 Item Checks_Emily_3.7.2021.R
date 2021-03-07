#Look at frequencies of last two questions and make separate datasets
library(psych)
install.packages("dplyr")
library(dplyr)
install.packages("matrixStats")
library(matrixStats)

# Clean up
##Notes - 
##First_Click = page is clicked, but no answer
##Last_Click = answer is chosen
##Page_Submit = when the page actually moves on
##Click_Count = 1 = chose to move on (2 probably means that the person clicked twice,
##and only clicked the next button once; it's weird when it's zero - check javascript/qualtrics
##renata to test)


str(X15Item)
Raw <- subset(X15Item, select = -c(0:17))

##Frequencies of Last two questions
Carefulness <- data.frame(ftable(Raw[,440]))
difficulty <- data.frame(ftable(Raw[,441]))

Answers <- Raw %>% select(!contains("Click"))
Answers <- Answers %>% select(!contains("Submit"))

##Change answers to numeric

Answers <- (Answers[,1:99])
Answers_recode <- as.data.frame(ifelse(Answers == "Very Undesirable", 1, ifelse(Answers == "Undesirable", 2, 
      ifelse(Answers == "Neutral", 3, ifelse(Answers == "Desirable", 4, 
      ifelse(Answers == "Very Desirable", 5,NA))))))

Last_Two <- (Raw[,440:441])

Answers_only <- as.data.frame(c(Answers_recode,Last_Two))


##Subset by Carefulness (using raw)
Not_Careful <- Raw %>% filter(Raw$Q613 == "Not at All Carefully")
Somewhat_Careful <- Raw %>% filter(Raw$Q613 == "Somewhat Carefully")
Very_Careful <- Raw %>% filter(Raw$Q613 == "Very Carefully")

#Subset by Difficulty (using raw)
V_Easy <- Raw %>% filter(Raw$Q766 == "Very Easy")
Some_Easy <- Raw %>% filter(Raw$Q766 == "Somewhat Easy")
Neutral <- Raw %>% filter(Raw$Q766 == "Not Easy or Difficult")
Some_Diff <- Raw %>% filter(Raw$Q766 == "Somewhat Difficult")
V_Diff <- Raw %>% filter(Raw$Q766 == "Very Difficult")

##Look at data by these dimensions. Carefulness will help to clean as we should delete the
##responses individuals were not careful in. I'm interested to see answers by somewhat
##and very careful as well - how different will they be? If they're quite different (e.g., 
##variance is tight within, but stats are not similar bw should we keep? analyze differently?)
Answers_Not_Careful <- Answers_only %>% filter(Answers_only$Q613 == "Not at All Carefully")
Des_Not_Care <- as.data.frame(describe(Answers_Not_Careful), na.delete = TRUE)
describe(Answers_Not_Careful) ##Need to omit nas or stats will get super messed up

Answers_Somewhat_Careful <- Answers_only %>% filter(Answers_only$Q613 == "Somewhat Carefully")
Des_Some_Care <- as.data.frame(describe(Answers_Somewhat_Careful), na.delete = TRUE)

Answers_Very_Careful <- Answers_only %>% filter(Answers_only$Q613 == "Very Carefully")
Des_Very_Care <- as.data.frame(describe(Answers_Very_Careful), na.delete = TRUE)

##Just want to look at mean and SD differences for now. ##All are pretty close -
##7 have mean differences of .50 and above (range from -.63 to 1.00) 
##SD differencces range from -31 to .37
##median -1 to +1 
##Another note - n counts are quite comparable - 52 - somewhat; 54 - very

Check_Care <- as.data.frame(c(Des_Some_Care[,2:5], Des_Very_Care[,2:5]))
##n.1 and so forth is very carefully

Care_mean <- as.data.frame(Check_Care$mean.1 - Check_Care$mean)
Care_sd <- as.data.frame(Check_Care$sd.1 - Check_Care$sd)
Care_median <- as.data.frame(Check_Care$median.1 - Check_Care$median)

Differences_Care <- as.data.frame(c(Care_mean,Care_sd,Care_median))
Differences_Care <- round(Differences_Care, digits = 2)


##Can also "clean", rather understand, by difficulty... how do stats compare within and between 
##the categories?
Answers_V_Easy <- Answers_only %>% filter(Answers_only$Q766 == "Very Easy")
Des_V_Easy <- as.data.frame(describe(Answers_V_Easy), na.delete = TRUE)

Answers_Some_Easy <- Answers_only %>% filter(Answers_only$Q766 == "Somewhat Easy")
Des_Some_Easy <- as.data.frame(describe(Answers_Some_Easy), na.delete = TRUE)

Answers_Neutral <- Answers_only %>% filter(Answers_only$Q766 == "Not Easy or Difficult")
Des_Neutral <- as.data.frame(describe(Answers_Neutral), na.delete = TRUE)

Answers_Some_Diff <- Answers_only %>% filter(Answers_only$Q766 == "Somewhat Difficult")
Des_Some_Diff <- as.data.frame(describe(Answers_Some_Diff), na.delete = TRUE)

Answers_V_Diff <- Answers_only %>% filter(Answers_only$Q766 == "Very Difficult")
Des_V_Diff <- as.data.frame(describe(Answers_V_Diff), na.delete = TRUE)

Check_Diff_ALL <- as.data.frame(c(Des_V_Easy[,2:5], Des_Some_Easy[,2:5], Des_Neutral[,2:5], 
                              Des_Some_Diff[2:5], Des_V_Diff[,2:5]))

##n = V Easy n.5 = V Difficult
##just skimming through they all seem similar; V difficult only has 4 so not as comparable
##others are pretty similar

Diff_mean <- Check_Diff_ALL %>% select(!contains("sd") & !contains("median")) 
Diff_mean <- round(Diff_mean, digits = 2)


Diff_sd <- Check_Diff_ALL %>% select(!contains("mean") & !contains("median")) 
Diff_sd <- round(Diff_sd, digits = 2)

Diff_median <- Check_Diff_ALL %>% select(!contains("sd") & !contains("mean")) 
Diff_median <- round(Diff_median, digits = 2)


##Look at distribution of each person's answers (% homogeneity = remove :: need
##to discuss what number (%) to use for exclusion criteria)

RowMeans <- as.data.frame(rowMeans(Answers_recode, na.rm = TRUE))
des_rowmeans <- describe(RowMeans)
Answers_recode <- as.matrix(Answers_recode)
RowSD <- as.data.frame(rowSds(Answers_recode, na.rm = TRUE))
RowMin <- as.data.frame(rowMins(Answers_recode, na.rm = TRUE))
RowMAX <- as.data.frame(rowMaxs(Answers_recode, na.rm = TRUE))
RowRange <- (RowMAX - RowMin)

RowStats <- as.data.frame(c(RowMeans, RowSD, RowMin, RowMAX, RowRange))

RowStats_Freq <- as.data.frame(ftable(RowStats[,5]))

                               