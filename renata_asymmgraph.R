## Renata Asymmetric graph

library(matrixStats)
library(tidyverse)

data <- read.csv("C:\\Users\\garciaprier1\\Desktop\\K&T\\Kuncel\\15item.csv")

data <- X15Item

names(data) <- gsub("\\.", " ", names(data))

####worry about things, trust others, take charge, am easy to satisfy, love excitement
asym <- as.data.frame((c((data[,72:92]),  (data[,94:97]),
                         (data[,124:144]), (data[,146:149]),
                         (data[,202:222]), (data[,224:227]),
                         (data[,254:274]), (data[,276:279]),
                         (data[,280:300]), (data[,302:305]))))

##recode - this will remove latency data
asym <- as.data.frame(ifelse(linear == "Very Undesirable", 1, 
                               ifelse(linear == "Undesirable", 2, 
                                      ifelse(linear == "Neutral", 3, 
                                             ifelse(linear == "Desirable", 4, 
                                                    ifelse(linear == "Very Desirable", 5,NA))))))

asym_des <- describe(asym)

asym_des <- asym_des %>%
  slice(which(row_number() %% 5 == 1))
asym_des

##transpose

asym <- as.data.frame(t(asym))

##to use in a plot
asym$level <- NA 
asym$item <- NA
level <- c("Extremely High", "Above Average", "Average", "Below Average", "Extremely Low")
item <- c("Make Friends Easily", "Get Angry Easily", "Often Feel Blue", "Sympathize with Homeless", "Get Irritated Easily")
asym$level <- rep(level, each = 5)
asym$item <- rep(item, each=25)

##removing latencies for now
asym <- asym %>%
  slice(which(row_number() %% 5 == 1))


##combine with means and sds

asym <- cbind(asym, asym_des$mean, asym_des$sd)

  
library(ggplot2)

A_plot <- ggplot(asym, aes(x=level, y=asym_des$mean, group=1)) + geom_line(size=1) +
  scale_x_discrete(limits=c("Extremely High", "Above Average", "Average", "Below Average", "Extremely Low")) +
  facet_wrap(~ item, nrow=1) +
  scale_colour_brewer() + theme_dark()
A_plot + theme(axis.text.x = element_text(angle=60, hjust=1))
