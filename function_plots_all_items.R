### recreating function plots - 12/16/23
### First run .Rmd through `Figure 2` chunk to populate data objects
library(ggplot2)

toplot <- data
toplot$cat <- rep(seq(1,5),300)
toplot$num <- rep(1:300, each=5)

toplot1 <- toplot[c(1:75),]
toplot2 <- toplot[c(76:150),]
toplot3 <- toplot[c(151:225),]
toplot4 <- toplot[c(226:300),]
toplot5 <- toplot[c(301:375),]
toplot6 <- toplot[c(376:450),]
toplot7 <- toplot[c(451:525),]
toplot8 <- toplot[c(526:600),]
toplot9 <- toplot[c(601:675),]
toplot10 <- toplot[c(676:750),]
toplot11 <- toplot[c(751:825),]
toplot12 <- toplot[c(826:900),]
toplot13 <- toplot[c(901:975),]
toplot14 <- toplot[c(976:1050),]
toplot15 <- toplot[c(1051:1125),]
toplot16 <- toplot[c(1126:1200),]
toplot17 <- toplot[c(1201:1275),]
toplot18 <- toplot[c(1276:1350),]
toplot19 <- toplot[c(1351:1425),]
toplot20 <- toplot[c(1426:1500),]

a <- ggplot(toplot1, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
b <- ggplot(toplot2, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
c <- ggplot(toplot3, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
d <- ggplot(toplot4, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
e <- ggplot(toplot5, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
f <- ggplot(toplot6, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
g <- ggplot(toplot7, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
h <- ggplot(toplot8, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
i <- ggplot(toplot9, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
j <- ggplot(toplot10, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
k <- ggplot(toplot11, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
l <- ggplot(toplot12, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
m <- ggplot(toplot13, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
n <- ggplot(toplot14, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
o <- ggplot(toplot15, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
p <- ggplot(toplot16, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
q <- ggplot(toplot17, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
r <- ggplot(toplot18, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
s <- ggplot(toplot19, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)
t <- ggplot(toplot20, aes(x=cat, y=mean)) + geom_line() + facet_wrap(~num,  ncol=5)

ggsave("functionplots/first.png",a)
ggsave("functionplots/second.png",b)
ggsave("functionplots/third.png",c)
ggsave("functionplots/fourth.png",d)
ggsave("functionplots/fifth.png",e)
ggsave("functionplots/sixth.png",f)
ggsave("functionplots/seventh.png",g)
ggsave("functionplots/eighth.png",h)
ggsave("functionplots/ninth.png",i)
ggsave("functionplots/tenth.png",j)
ggsave("functionplots/eleventh.png",k)
ggsave("functionplots/twelfth.png",l)
ggsave("functionplots/thirteen.png",m)
ggsave("functionplots/fourteen.png",n)
ggsave("functionplots/fifteen.png",o)
ggsave("functionplots/sixteen.png",p)
ggsave("functionplots/seventeen.png",q)
ggsave("functionplots/eighteen.png",r)
ggsave("functionplots/nineteen.png",s)
ggsave("functionplots/twenty.png",t)


## Playing again with residuals
## i300 = 71:75    # i15
## i291 = 26:30    # i6

item286 <- toplot20[c(1:5),]
item287 <- toplot20[c(6:10),]
item288 <- toplot20[c(11:15),]
item289 <- toplot20[c(16:20),]
item290 <- toplot20[c(21:25),]

item291 <- toplot20[c(26:30),]
item292 <- toplot20[c(31:35),]
item293 <- toplot20[c(36:40),]
item294 <- toplot20[c(41:45),]
item295 <- toplot20[c(46:50),]

item296 <- toplot20[c(51:55),]
item297 <- toplot20[c(56:60),]
item298 <- toplot20[c(61:65),]
item299 <- toplot20[c(66:70),]
item300 <- toplot20[c(71:75),]

reg286 <- lm(mean~cat,item286)
reg287 <- lm(mean~cat,item287)
reg288 <- lm(mean~cat,item288)
reg289 <- lm(mean~cat,item289)
reg290 <- lm(mean~cat,item290)
reg291 <- lm(mean~cat,item291)
reg292 <- lm(mean~cat,item292)
reg293 <- lm(mean~cat,item293)
reg294 <- lm(mean~cat,item294)
reg295 <- lm(mean~cat,item295)
reg296 <- lm(mean~cat,item296)
reg297 <- lm(mean~cat,item297)
reg298 <- lm(mean~cat,item298)
reg299 <- lm(mean~cat,item299)
reg300 <- lm(mean~cat,item300)

des286 <- psych::describe(reg286$residuals)
des287 <- psych::describe(reg287$residuals)
des288 <- psych::describe(reg288$residuals)
des289 <- psych::describe(reg289$residuals)
des290 <- psych::describe(reg290$residuals)
des291 <- psych::describe(reg291$residuals)
des292 <- psych::describe(reg292$residuals)
des293 <- psych::describe(reg293$residuals)
des294 <- psych::describe(reg294$residuals)
des295 <- psych::describe(reg295$residuals)
des296 <- psych::describe(reg296$residuals)
des297 <- psych::describe(reg297$residuals)
des298 <- psych::describe(reg298$residuals)
des299 <- psych::describe(reg299$residuals)
des300 <- psych::describe(reg300$residuals)

testing <- rbind(des286,des287,des288,des289,des290,
                 des291,des292,des293,des294,des295,
                 des296,des297,des298,des299,des300)

edwards <- toplot20$Edwards[seq(1, length(toplot20$Edwards), 5)]

testing2 <- cbind(testing,edwards)

psych::pairs.panels(testing2[c(14,3:5,7:13)])
