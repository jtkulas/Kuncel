## Script to just look at latencies and whether they can be salvaged at all

## Should also look at original files for potential salvaging

latencies <- read.csv("Reduced_scale.csv")

latencies$Q1643_First.Click <- as.numeric(as.character(latencies$Q1643_First.Click))
hist(latencies$Q1643_First.Click)

library(data.table)
## creating function for outliers 
outlierReplace = function(dataframe, cols, rows, newValue = NA) {
  if (any(rows)) {
    set(dataframe, rows, cols, newValue)
  }
}

# same variable without outliers
outlierReplace(latencies, "Q1643_First.Click", which(latencies$Q1643_First.Click > 600), NA )
hist(latencies$Q1643_First.Click)

# online version of K&T

# This shorter version was created since we noticed participants were clicking mindlessly through the 300 item 
# version of the Kuncel & Tellegen assessment. We reviewed the items' from the Minnesota data and we selected the items
# that followed the expected distributions or linearity of the responses. We selected 3 items for each possible 
# response. 

library(readxl)
X15Item <- read_excel("15Item.xlsx", skip = 1)
View(X15Item)

## First two items in the survey -> make people feel welcome and insult people/others were example items that we shouldn't consider
# when analyzing data 