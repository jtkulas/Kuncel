## Script to just look at latencies and whether they can be salvaged at all

## Should also look at original files for potential salvaging

latencies <- read.csv("Reduced_scale.csv")

latencies$Q1643_First.Click <- as.numeric(as.character(latencies$Q1643_First.Click))
hist(latencies$Q1643_First.Click)
