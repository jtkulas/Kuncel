## First run all chunks in "KuncelTellegen.Rmd" - 11/4/23

## "15 item graphs.R" has linear plots for the NJ data
## This script is getting 15 from MN data as well as 300 for re-rating mono and linearity 

data$level <- factor(data$level, levels=c("Extremely High", "Above Average", "Average", "Below Average", "Extremely Low"))

fifteen <- data[c(1:5,16:20,56:60,91:95,106:110,6:10,26:30,51:55,141:145,176:180,81:85,161:165,231:235,901:905,1136:1140),] ## "lookiehere.csv" has items in `data` orderings

fifteen$item <- factor(fifteen$item, levels=c("Make friends easily","Get angry easily","Often feel blue","Sympathize with the homeless","Get irritated easily",
                                              "Am always busy", "Enjoy wild flights of fantasy","Am always on the go","Am relaxed most of the time","Am a creature of habit",
                                              "Worry about things","Trust others","Take Charge","Am easy to satisfy","Love excitement")) ## organized by linear, quasi, assym

ggplot(fifteen, aes(x=level, y=mean, group=item)) + geom_line() + facet_wrap(~item,ncol=5)

a <- ggplot(data[c(1:25),], aes(x=level, y=mean, group=item)) + geom_line() + facet_grid(.~item)
