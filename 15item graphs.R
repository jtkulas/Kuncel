#Look at frequencies of last two questions and make separate datasets
library(psych)
#install.packages("dplyr")
library(dplyr)
#install.packages("matrixStats")
library(matrixStats)
library(tidyverse)

data <- read.csv("C:\\Users\\johns\\OneDrive\\Desktop\\15item.csv")

names(data) <- gsub("\\.", " ", names(data))

##make friends easily, get angry easily, often feel blue, sympathize with the homeless, get irritated easily
linear <- as.data.frame((c((data[,98:118]),  (data[,120:123]),
                           (data[,150:170]), (data[,171:174]),
                           (data[,176:196]), (data[,198:201]),
                           (data[,306:326]), (data[,328:331]),
                           (data[,358:378]), (data[,380:383]))))

##recode - this will remove latency data
linear <- as.data.frame(ifelse(linear == "Very Undesirable", 1, 
                               ifelse(linear == "Undesirable", 2, 
                               ifelse(linear == "Neutral", 3, 
                               ifelse(linear == "Desirable", 4, 
                               ifelse(linear == "Very Desirable", 5,NA))))))

Linear_des <- describe(linear)

Linear_des <- Linear_des %>%
  slice(which(row_number() %% 5 == 1))


##transpose

linear <- as.data.frame(t(linear))

##to use in a plot
linear$level <- NA 
linear$item <- NA
level <- c("Extremely High", "Above Average", "Average", "Below Average", "Extremely Low")
item <- c("Make Friends Easily", "Get Angry Easily", "Often Feel Blue", "Sympathize with Homeless", "Get Irritated Easily")
linear$level <- rep(level, each = 5)
linear$item <- rep(item, each=25)

##removing latencies for now
linear <- linear %>%
  slice(which(row_number() %% 5 == 1))


##combine with means and sds

linear <- cbind(linear, Linear_des$mean, Linear_des$sd)

##worry about things, trust others, take charge, am easy to satisfy, love excitement
asymm <-
##am always busy, enjoy wild flights of fantasy, am always on the go, am relaxed most of the time, am a creature of habit
quasi <- 
  
library(ggplot2)
L_plot <- ggplot(linear, aes(x=level, y=Linear_des$mean, group=1)) + geom_line(size=1) +
  scale_x_discrete(limits=c("Extremely High", "Above Average", "Average", "Below Average", "Extremely Low")) +
  facet_wrap(~ item, nrow=1) +
  scale_colour_brewer() + theme_dark()
L_plot + theme(axis.text.x = element_text(angle=60, hjust=1))