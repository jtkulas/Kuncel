## Run .Rmd chunks to obtain "i61" etc item objects - 6/13/24

exampleitems <- rbind(i61, i1, i274, i11, i197, i268, i264, i13, i55, i22, i73)

exampleitems$cat <- rep(c("linear(p)", "xtreme hook(p)", "egyptian(p)", "mod hook(p)", "opposite hook/ladle", "witches hat", "flat", "mod hook", "egyptian", "xtreme hook", "linear"), each=5)

ggplot(exampleitems, aes(x=level, y=mean, colour=Edwards, group=1)) + 
         geom_line(linewidth=1) +  
         scale_x_discrete(limits=c("Extremely High", "Above Average", "Average", "Below Average", "Extremely Low")) + 
         facet_wrap(~ cat, nrow=1) +
        theme(axis.title.x=element_blank(),        
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank())

