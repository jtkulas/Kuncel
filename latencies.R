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
