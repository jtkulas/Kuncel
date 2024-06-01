##STUDY 2 - Interrater Reliabilities (FINAL SCRIPT)

##PACKAGES NEEDED
library(dplyr)
library(irr)
library(psych)
library(careless)
library(splitstackshape)
library(stringr)
library(readr)

##Dataset outside of github
raw <- read.csv("E:\\SD Research\\Social Desirability\\15ItemCSV_manipcolheaders.csv")

##NOTE 133 Observations to start with. Need to further clean data. 

##Remove preview responses. Leaves 131 observations.
Cleaned <- raw %>%
  filter(Response.Type != 'Survey Preview')

##Removing where people answered that they basically did not do the task. 129 observations.
Cleaned <- Cleaned %>%
  filter(Q613 != 'Not at All Carefully') 


###CARELESSNESS ITEMS NOTES:

#Q659 = What do you put on your feet?
#Q660 = How many days are in a week?
#Q661 = Which animal is the biggest?
#Q662 = Which of the following animals lives in the ocean?
#Q663 = What state is Montclair State University in?
#Q664 = Which one of the following is the highest degree of education?
#Q665 = Which one of the following animals is smallest?
#Q666 = Which of the following animals is a carnivore?
#Q667 = Which one of the following is NOT a winter sport?
#Q668 = Which of the following is a fruit?
#Q669 = Which of the following do you put on your hands?
#Q670 = The Empire State building is in:
#Q671 = Which is not a social media platform?

careless_items <- Cleaned %>% select(c(Q659,Q660,Q661,Q662,Q663,Q664,Q665,Q666,Q667,Q668,
                                       Q669,Q670,Q671))

table(careless_items$Q671)

#Q665 -- my guess is people didn't know what a Sugar Glider was.
#Q670 -- were any of these people from the MN uni?

##decided to keep all due to carelessness items above. There wasn't enough to exclude anyone.
rm(careless_items) ## remove dataframe as it's no longer needed.

##Get row IDs for carelessness indices
Cleaned <- mutate(Cleaned, ID = row_number())

##Carelessness -- parsing down the dataset
RM <- Cleaned %>% dplyr:: select(contains("Desirability"))
ID <- Cleaned %>% dplyr:: select("ID")
RM <- as.data.frame(cbind(RM, ID))

##Removing the first two items as they were not part of the 15
RM <- RM[,11:86]

##Removing no or 1 response -- 11 removed - left with 118
RM[RM == ""] <- NA
RM$NAs <- rowSums(is.na(RM))

RM <- RM %>%
  filter(NAs < 74) 

RM <- as.data.frame(RM$ID)
colnames(RM) <- "ID"

Cleaned <- merge(Cleaned,RM,by="ID", all.x = FALSE, all.y = FALSE) 

rm(RM,ID)

##Now looking at only the items again with 
Only_Items <- Cleaned %>% dplyr:: select(contains("Desirability"))

##Only_Items <- Only_Items[!apply(Only_Items == "", 1, all),]
Only_Items[Only_Items == "Very Undesirable"] <-1
Only_Items[Only_Items == "Undesirable"] <-2
Only_Items[Only_Items == "Neutral"] <-3
Only_Items[Only_Items == "Desirable"] <-4
Only_Items[Only_Items == "Very Desirable"] <-5

##Remove first two variables
Only_Items <- Only_Items [,11:85]

##Make the responses numeric instead of string
Only_Items <- as.data.frame(lapply(Only_Items,as.numeric))

##saving a dataframe as wide format
unt_only_items <- Only_Items

##wide to tall dataset
Only_Items <- as.data.frame(t(Only_Items))

##Determine if any have only 1 or 2 responses. Observations = 129 (none removed)
Only_One_Answer <- Only_Items %>% select(where(~n_distinct(.) <2)) 
Two_Answers <- Only_Items %>% select(where(~n_distinct(.) <3)) 

##Patterns in data (e.g., 1...2...3...4..5...1..2..3..4..5 etc.)
##Start with longest consecutive length of one answer. ##Need to determine how many responses in a row is okay.
Consecutive <- as.data.frame(longstring(unt_only_items, avg=FALSE))
table(Consecutive) ##Quite a few with consecutive responses - what should be the cutoff for this?

##IRV (Intra-Indiavidiual Response Variability) ##Need to determine what an appropriate variability is for this.
IRV <- as.data.frame(irv(unt_only_items, na.rm = TRUE, split = FALSE, num.split = 3)) ##this is a more random approach

##combine the datasets
Investigate <- as.data.frame(cbind(Consecutive, IRV))

##CLEANED DATA
##Participants to Remove + Why
##Participants that have >10 consecutive answers will be removed.
Data <- (cbind(Cleaned, Investigate))

##Removed 8 values from the Long String Index (below)
Data  <-Data %>%
 filter(`longstring(unt_only_items, avg = FALSE)` <= 10) 

##Mean after consecutive items = 1.22 ---> SD = 0.22 ---> 1 SDs below mean = 1 --> 2 SDs below = 0.78
describe(Data$`irv(unt_only_items, na.rm = TRUE, split = FALSE, num.split = 3)`)


##This removed 2 participants for IRV; determined by the standard deviation
Data <-Data %>%
  filter(`irv(unt_only_items, na.rm = TRUE, split = FALSE, num.split = 3)` >= 0.78) 

##Just grabbing ID to match onto dataset
Data <- as.data.frame(Data$ID)
colnames(Data) <- "ID"


##Official Cleaned Data
Cleaned <- inner_join(Cleaned,Data, by = "ID")
Cleaned <- as.data.frame(Cleaned[,18:459])

##Removing unneeded dataframes
rm(Data,Investigate,IRV,Only_Items, Only_One_Answer,Two_Answers,unt_only_items,Consecutive)

##Going Back to Only Items in the dataset
Cleaned <- Cleaned %>% dplyr:: select(contains("Desirability"))
Cleaned[Cleaned == "Very Undesirable"] <-1
Cleaned[Cleaned == "Undesirable"] <-2
Cleaned[Cleaned == "Neutral"] <-3
Cleaned[Cleaned == "Desirable"] <-4
Cleaned[Cleaned == "Very Desirable"] <-5
Cleaned[Cleaned == ""] <-NA


#### INTERRATER RELIABILITY - DOES DOING IT LIKE THIS ACTUALLY MAKE SENSE?
library(icr)

##WORRY
Worry <- Cleaned[,11:15]
Worry <- Worry[rowSums(is.na(Worry)) != ncol(Worry), ]
Worry <- as.matrix(Worry)

Worry <- kripp.alpha(Worry, method = "ordinal") 
worry_f <- as.data.frame(Worry$value)
colnames(worry_f) <- "Worry"

rm(Worry)

##FRIENDS
Friends2 <- Cleaned[,16:20]
Friends2 <- Friends2[rowSums(is.na(Friends2)) != ncol(Friends2), ]
Friends2 <- as.matrix(Friends2)

Friends2 <- kripp.alpha(Friends2, method = "ordinal") 
Friends_f <- as.data.frame(Friends2$value)
colnames(Friends_f) <- "Friends"

rm(Friends2)

##TRUST
Trust2 <- Cleaned[,21:25]
Trust2 <- Trust2[rowSums(is.na(Trust2)) != ncol(Trust2), ]
Trust2 <- as.matrix(Trust2)

Trust2 <- kripp.alpha(Trust2, method = "ordinal") 
Trust_f <- as.data.frame(Trust2$value)
colnames(Trust_f) <- "Trust"

rm(Trust2)

##ANGRY
Angry2 <- Cleaned[,26:30]
Angry2 <- Angry2[rowSums(is.na(Angry2)) != ncol(Angry2), ]
Angry2 <- as.matrix(Angry2)

Angry2<-kripp.alpha(Angry2, method = "ordinal")
Angry_f <- as.data.frame(Angry2$value)
colnames(Angry_f) <- "Angry"

rm(Angry2)

##BLUE
Blue2 <- Cleaned[,31:35]
Blue2 <- Blue2[rowSums(is.na(Blue2)) != ncol(Blue2), ]
Blue2 <- as.matrix(Blue2)

Blue2<-kripp.alpha(Blue2, method = "ordinal") 
Blue_f <- as.data.frame(Blue2$value)
colnames(Blue_f) <- "Blue"

rm(Blue2)

##TAKE CHARGE
Charge2 <- Cleaned[,36:40]
Charge2 <- Charge2[rowSums(is.na(Charge2)) != ncol(Charge2), ]
Charge2 <- as.matrix(Charge2)

Charge2<-kripp.alpha(Charge2, method = "ordinal") 
Charge_f <- as.data.frame(Charge2$value)
colnames(Charge_f) <- "Charge"

rm(Charge2)

##AM BUSY
Busy2 <- Cleaned[,41:45]
Busy2 <- Busy2[rowSums(is.na(Busy2)) != ncol(Busy2), ]
Busy2 <- as.matrix(Busy2)

Busy2<-kripp.alpha(Busy2, method = "ordinal")
Busy_f <- as.data.frame(Busy2$value)
colnames(Busy_f) <- "Busy"

rm(Busy2)

##SATISFY
Sat2 <- Cleaned[,46:50]
Sat2 <- Sat2[rowSums(is.na(Sat2)) != ncol(Sat2), ]
Sat2 <- as.matrix(Sat2)

Sat2<-kripp.alpha(Sat2, method = "ordinal") 
Sat_f <- as.data.frame(Sat2$value)
colnames(Sat_f) <- "Sat"

rm(Sat2)

##EXCITE
Excite2 <- Cleaned[,51:55]
Excite2 <- Excite2[rowSums(is.na(Excite2)) != ncol(Excite2), ]
Excite2 <- as.matrix(Excite2)

Excite2<-kripp.alpha(Excite2, method = "ordinal") 
Excite_f <- as.data.frame(Excite2$value)
colnames(Excite_f) <- "Excite"

rm(Excite2)

##SYMPATHY
Symp2 <- Cleaned[,56:60]
Symp2 <- Symp2[rowSums(is.na(Symp2)) != ncol(Symp2), ]
Symp2 <- as.matrix(Symp2)

Symp2<-kripp.alpha(Symp2, method = "ordinal") 
Symp_f <- as.data.frame(Symp2$value)
colnames(Symp_f) <- "Symp"

rm(Symp2)

##FANTASY
fant2 <- Cleaned[,61:65]
fant2 <- fant2[rowSums(is.na(fant2)) != ncol(fant2), ]
fant2 <- as.matrix(fant2)

fant2<-kripp.alpha(fant2, method = "ordinal")
fant_f <- as.data.frame(fant2$value)
colnames(fant_f) <- "fant"

rm(fant2)

##IRRITATED
irr2 <- Cleaned[,66:70]
irr2 <- irr2[rowSums(is.na(irr2)) != ncol(irr2), ]
irr2 <- as.matrix(irr2)

irr2<-kripp.alpha(irr2, method = "ordinal")
irr_f <- as.data.frame(irr2$value)
colnames(irr_f) <- "irritated"

rm(irr2)

##ON THE GO
go2 <- Cleaned[,71:75]
go2 <- go2[rowSums(is.na(go2)) != ncol(go2), ]
go2 <- as.matrix(go2)

go2<-kripp.alpha(go2, method = "ordinal") 
go_f <- as.data.frame(go2$value)
colnames(go_f) <- "On.the.Go"

rm(go2)

##RELAX
relax2 <- Cleaned[,76:80]
relax2 <- relax2[rowSums(is.na(relax2)) != ncol(relax2), ]
relax2 <- as.matrix(relax2)


relax2<-kripp.alpha(relax2, method = "ordinal") 
relax_f <- as.data.frame(relax2$value)
colnames(relax_f) <- "relaxed"

rm(relax2)

##HABITS
habit2 <- Cleaned[,81:85]
habit2 <- habit2[rowSums(is.na(habit2)) != ncol(habit2), ]
habit2 <- as.matrix(habit2)

habit2 <- kripp.alpha(habit2, method = "ordinal") 
habit_f <- as.data.frame(habit2$value)
colnames(habit_f) <- "habit"

rm(habit2)

##ALL
all <- Cleaned[,11:85]
all <- all[rowSums(is.na(all)) != ncol(all), ]
all <- as.matrix(all)

all <- kripp.alpha(all, method = "ordinal") 
all_f <- as.data.frame(all$value)
colnames(all_f) <- "all"

rm(all)

###MERGE

Kripp_alpha <- cbind(worry_f, Trust_f, Charge_f, Sat_f, Excite_f, Friends_f, Angry_f, Blue_f,Symp_f, irr_f, Busy_f, fant_f, go_f, relax_f,habit_f,all_f)
Kripp_alpha$Overall.mean <- rowMeans(Kripp_alpha[,1:15]) ##overall mean = 0.208
Kripp_alpha$Asymmetric.mean <- rowMeans(Kripp_alpha[,1:5]) ##Asymmetric mean = 0.263
Kripp_alpha$Linear.mean <- rowMeans(Kripp_alpha[,6:10]) ##Linear mean = 0.227
Kripp_alpha$Quasi.mean <- rowMeans(Kripp_alpha[,11:15]) ##Quasi mean = 0.13

Kripp_alpha <- Kripp_alpha %>% 
  mutate_if(is.numeric, round, digits=3)

rm(all_f,Angry_f,Blue_f,Busy_f,Charge_f,Excite_f,fant_f,Friends_f,go_f,habit_f,irr_f,relax_f,Sat_f,Symp_f,Trust_f,worry_f)

#write_csv(Kripp_alpha, "E:/SD Research/Social Desirability/Krippalpha.csv")


##Grab Kripp from Study 1 (Confirmed Correct Data)
studyone <- read.csv("E:\\SD Research\\Social Desirability\\Study1CompareData.csv")


Worry <- studyone[,27:31]
Worry <- Worry[rowSums(is.na(Worry)) != ncol(Worry), ]
Worry <- as.matrix(Worry)

Worry <- kripp.alpha(Worry, method = "ordinal") 
worry_f <- as.data.frame(Worry$value)
colnames(worry_f) <- "Worry"

rm(Worry)

##FRIENDS
Friends2 <- studyone[2:6]
Friends2 <- Friends2[rowSums(is.na(Friends2)) != ncol(Friends2), ]
Friends2 <- as.matrix(Friends2)

Friends2 <- kripp.alpha(Friends2, method = "ordinal") 
Friends_f <- as.data.frame(Friends2$value)
colnames(Friends_f) <- "Friends"

rm(Friends2)

##TRUST
Trust2 <- studyone[,32:36]
Trust2 <- Trust2[rowSums(is.na(Trust2)) != ncol(Trust2), ]
Trust2 <- as.matrix(Trust2)

Trust2 <- kripp.alpha(Trust2, method = "ordinal") 
Trust_f <- as.data.frame(Trust2$value)
colnames(Trust_f) <- "Trust"

rm(Trust2)

##ANGRY
Angry2 <- studyone[,7:11]
Angry2 <- Angry2[rowSums(is.na(Angry2)) != ncol(Angry2), ]
Angry2 <- as.matrix(Angry2)

Angry2<-kripp.alpha(Angry2, method = "ordinal")
Angry_f <- as.data.frame(Angry2$value)
colnames(Angry_f) <- "Angry"

rm(Angry2)

##BLUE
Blue2 <- studyone[,12:16]
Blue2 <- Blue2[rowSums(is.na(Blue2)) != ncol(Blue2), ]
Blue2 <- as.matrix(Blue2)

Blue2<-kripp.alpha(Blue2, method = "ordinal") 
Blue_f <- as.data.frame(Blue2$value)
colnames(Blue_f) <- "Blue"

rm(Blue2)

##TAKE CHARGE
Charge2 <- studyone[,37:41]
Charge2 <- Charge2[rowSums(is.na(Charge2)) != ncol(Charge2), ]
Charge2 <- as.matrix(Charge2)

Charge2<-kripp.alpha(Charge2, method = "ordinal") 
Charge_f <- as.data.frame(Charge2$value)
colnames(Charge_f) <- "Charge"

rm(Charge2)

##AM BUSY
Busy2 <- studyone[,52:56]
Busy2 <- Busy2[rowSums(is.na(Busy2)) != ncol(Busy2), ]
Busy2 <- as.matrix(Busy2)

Busy2<-kripp.alpha(Busy2, method = "ordinal")
Busy_f <- as.data.frame(Busy2$value)
colnames(Busy_f) <- "Busy"

rm(Busy2)

##SATISFY
Sat2 <- studyone[,44:46]
Sat2 <- Sat2[rowSums(is.na(Sat2)) != ncol(Sat2), ]
Sat2 <- as.matrix(Sat2)

Sat2<-kripp.alpha(Sat2, method = "ordinal") 
Sat_f <- as.data.frame(Sat2$value)
colnames(Sat_f) <- "Sat"

rm(Sat2)

##EXCITE
Excite2 <- studyone[,47:51]
Excite2 <- Excite2[rowSums(is.na(Excite2)) != ncol(Excite2), ]
Excite2 <- as.matrix(Excite2)

Excite2<-kripp.alpha(Excite2, method = "ordinal") 
Excite_f <- as.data.frame(Excite2$value)
colnames(Excite_f) <- "Excite"

rm(Excite2)

##SYMPATHY
Symp2 <- studyone[,17:21]
Symp2 <- Symp2[rowSums(is.na(Symp2)) != ncol(Symp2), ]
Symp2 <- as.matrix(Symp2)

Symp2<-kripp.alpha(Symp2, method = "ordinal") 
Symp_f <- as.data.frame(Symp2$value)
colnames(Symp_f) <- "Symp"

rm(Symp2)

##FANTASY
fant2 <- studyone[,57:61]
fant2 <- fant2[rowSums(is.na(fant2)) != ncol(fant2), ]
fant2 <- as.matrix(fant2)

fant2<-kripp.alpha(fant2, method = "ordinal")
fant_f <- as.data.frame(fant2$value)
colnames(fant_f) <- "fant"

rm(fant2)

##IRRITATED
irr2 <- studyone[,22:26]
irr2 <- irr2[rowSums(is.na(irr2)) != ncol(irr2), ]
irr2 <- as.matrix(irr2)

irr2<-kripp.alpha(irr2, method = "ordinal")
irr_f <- as.data.frame(irr2$value)
colnames(irr_f) <- "irritated"

rm(irr2)

##ON THE GO
go2 <- studyone[,62:66]
go2 <- go2[rowSums(is.na(go2)) != ncol(go2), ]
go2 <- as.matrix(go2)

go2<-kripp.alpha(go2, method = "ordinal") 
go_f <- as.data.frame(go2$value)
colnames(go_f) <- "On.the.Go"

rm(go2)

##RELAX
relax2 <- studyone[,67:71]
relax2 <- relax2[rowSums(is.na(relax2)) != ncol(relax2), ]
relax2 <- as.matrix(relax2)


relax2<-kripp.alpha(relax2, method = "ordinal") 
relax_f <- as.data.frame(relax2$value)
colnames(relax_f) <- "relaxed"

rm(relax2)

##HABITS
habit2 <- studyone[,72:76]
habit2 <- habit2[rowSums(is.na(habit2)) != ncol(habit2), ]
habit2 <- as.matrix(habit2)

habit2 <- kripp.alpha(habit2, method = "ordinal") 
habit_f <- as.data.frame(habit2$value)
colnames(habit_f) <- "habit"

rm(habit2)

##ALL
all <- studyone[,2:76]
all <- all[rowSums(is.na(all)) != ncol(all), ]
all <- as.matrix(all)

all <- kripp.alpha(all, method = "ordinal") 
all_f <- as.data.frame(all$value)
colnames(all_f) <- "all"

rm(all)

###MERGE

Study1Kripp_alpha <- cbind(worry_f, Trust_f, Charge_f, Sat_f, Excite_f, Friends_f, Angry_f, Blue_f,Symp_f, irr_f, Busy_f, fant_f, go_f, relax_f,habit_f,all_f)
Study1Kripp_alpha$Overall.mean <- rowMeans(Study1Kripp_alpha[,1:15]) 
Study1Kripp_alpha$Asymmetric.mean <- rowMeans(Study1Kripp_alpha[,1:5]) 
Study1Kripp_alpha$Linear.mean <- rowMeans(Study1Kripp_alpha[,6:10]) 
Study1Kripp_alpha$Quasi.mean <- rowMeans(Study1Kripp_alpha[,11:15]) 

Study1Kripp_alpha <- Study1Kripp_alpha %>% 
  mutate_if(is.numeric, round, digits=3)

rm(all_f,Angry_f,Blue_f,Busy_f,Charge_f,Excite_f,fant_f,Friends_f,go_f,habit_f,irr_f,relax_f,Sat_f,Symp_f,Trust_f,worry_f)

##COMBINE KRIPP from STUDY 1 and 2 

Kripp_alpha$Study <- 'Study 2'
Study1Kripp_alpha$Study <- 'Study 1'

All_KA <- as.data.frame(rbind(Kripp_alpha,Study1Kripp_alpha))

rm(Kripp_alpha,studyone,Study1Kripp_alpha)

tALL_KA <- as.data.frame(t(All_KA))

write_csv(All_KA, "E:/SD Research/Social Desirability/Krippalphacompare.csv")

##GET ITEM GRAPHS && OVERLAY KRIPP VALUES?? (Look at those categories from the 
##paper groupings too to see if there is anything there)
