
kun_sort <- read.csv("http://web.stcloudstate.edu/jtkulas/Kuncel Tellegen.csv")

form1 <- kun_sort[kun_sort$form == 1, ]
form2 <- kun_sort[kun_sort$form == 2, ]
form3 <- kun_sort[kun_sort$form == 3, ]
form4 <- kun_sort[kun_sort$form == 4, ]
form5 <- kun_sort[kun_sort$form == 5, ]
form6 <- kun_sort[kun_sort$form == 6, ]
form7 <- kun_sort[kun_sort$form == 7, ]
form8 <- kun_sort[kun_sort$form == 8, ]
form9 <- kun_sort[kun_sort$form == 9, ]
form10 <- kun_sort[kun_sort$form == 10, ]


form2r <- form2[,c(1:2, 298:302, 293:297, 288:292, 283:287, 278:282, 273:277, 268:272, 263:267,
                   258:262, 253:257, 248:252, 243:247, 238:242, 233:237, 228:232, 223:227,
                   218:222, 213:217, 208:212, 203:207, 198:202, 193:197, 188:192, 183:187,
                   178:182, 173:177, 168:172, 163:167, 158:162, 153:157, 148:152, 143:147,
                   138:142, 133:137, 128:132, 123:127, 118:122, 113:117, 108:112, 103:107,
                   98:102, 93:97, 88:92, 83:87, 78:82, 73:77, 68:72, 63:67, 58:62, 53:57,
                   48:52, 43:47, 38:42, 33:37, 28:32, 23:27, 18:22, 13:17, 08:12, 03:07, 303)]

form4r <- form4[,c(1:2, 298:302, 293:297, 288:292, 283:287, 278:282, 273:277, 268:272, 263:267,
                   258:262, 253:257, 248:252, 243:247, 238:242, 233:237, 228:232, 223:227,
                   218:222, 213:217, 208:212, 203:207, 198:202, 193:197, 188:192, 183:187,
                   178:182, 173:177, 168:172, 163:167, 158:162, 153:157, 148:152, 143:147,
                   138:142, 133:137, 128:132, 123:127, 118:122, 113:117, 108:112, 103:107,
                   98:102, 93:97, 88:92, 83:87, 78:82, 73:77, 68:72, 63:67, 58:62, 53:57,
                   48:52, 43:47, 38:42, 33:37, 28:32, 23:27, 18:22, 13:17, 08:12, 03:07, 303)]

form6r <- form6[,c(1:2, 298:302, 293:297, 288:292, 283:287, 278:282, 273:277, 268:272, 263:267,
                   258:262, 253:257, 248:252, 243:247, 238:242, 233:237, 228:232, 223:227,
                   218:222, 213:217, 208:212, 203:207, 198:202, 193:197, 188:192, 183:187,
                   178:182, 173:177, 168:172, 163:167, 158:162, 153:157, 148:152, 143:147,
                   138:142, 133:137, 128:132, 123:127, 118:122, 113:117, 108:112, 103:107,
                   98:102, 93:97, 88:92, 83:87, 78:82, 73:77, 68:72, 63:67, 58:62, 53:57,
                   48:52, 43:47, 38:42, 33:37, 28:32, 23:27, 18:22, 13:17, 08:12, 03:07, 303)]

form8r <- form8[,c(1:2, 298:302, 293:297, 288:292, 283:287, 278:282, 273:277, 268:272, 263:267,
                   258:262, 253:257, 248:252, 243:247, 238:242, 233:237, 228:232, 223:227,
                   218:222, 213:217, 208:212, 203:207, 198:202, 193:197, 188:192, 183:187,
                   178:182, 173:177, 168:172, 163:167, 158:162, 153:157, 148:152, 143:147,
                   138:142, 133:137, 128:132, 123:127, 118:122, 113:117, 108:112, 103:107,
                   98:102, 93:97, 88:92, 83:87, 78:82, 73:77, 68:72, 63:67, 58:62, 53:57,
                   48:52, 43:47, 38:42, 33:37, 28:32, 23:27, 18:22, 13:17, 08:12, 03:07, 303)]

form10r <- form10[,c(1:2, 298:302, 293:297, 288:292, 283:287, 278:282, 273:277, 268:272, 263:267,
                     258:262, 253:257, 248:252, 243:247, 238:242, 233:237, 228:232, 223:227,
                     218:222, 213:217, 208:212, 203:207, 198:202, 193:197, 188:192, 183:187,
                     178:182, 173:177, 168:172, 163:167, 158:162, 153:157, 148:152, 143:147,
                     138:142, 133:137, 128:132, 123:127, 118:122, 113:117, 108:112, 103:107,
                     98:102, 93:97, 88:92, 83:87, 78:82, 73:77, 68:72, 63:67, 58:62, 53:57,
                     48:52, 43:47, 38:42, 33:37, 28:32, 23:27, 18:22, 13:17, 08:12, 03:07, 303)]

names(form2r) <- names(form1)
names(form4r) <- names(form3)
names(form6r) <- names(form5)
names(form2r) <- names(form7)
names(form10r) <- names(form9)


##combine forms (1&2) (3&4) (5&6) (7&8) (9&10)

form12 <- rbind(form1,form2r)
form34 <- rbind(form3,form4r)
form56 <- rbind(form5,form6r)
form78 <- rbind(form7,form8r)
form910 <- rbind(form9,form10r)

plot12 <- as.data.frame(sapply(form12[3:302], mean, na.rm=TRUE))
plot34 <- as.data.frame(sapply(form34[3:302], mean, na.rm=TRUE))
plot56 <- as.data.frame(sapply(form56[3:302], mean, na.rm=TRUE))
plot78 <- as.data.frame(sapply(form78[3:302], mean, na.rm=TRUE))
plot910 <- as.data.frame(sapply(form910[3:302], mean, na.rm=TRUE))

colnames(plot12) <- "mean"
colnames(plot34) <- "mean"
colnames(plot56) <- "mean"
colnames(plot78) <- "mean"
colnames(plot910) <- "mean"

data <- as.data.frame(rbind(plot12,plot34,plot56,plot78,plot910))


data$item <- NA      ## want to create a new variable called "item" that we can select from
data$level <- NA     

level <- c("Extremely High", "Above Average", "Average", "Below Average", "Extremely Low")
data$level <- rep(level, 300)


## actually probably want item text for item values

##make these UC first word and LC other words.
items <- c("Worry about things"
           ,"Make friends easily"
           ,"Have a vivid imagination"
           ,"Trust others"
           ,"Complete tasks successfully"
           ,"Get angry easily"
           ,"Love large parties"
           ,"Believe in the importance"
           ,"Would never cheat on my taxes"
           ,"Like order"
           ,"Often feel blue"
           ,"Take Charge"
           ,"Experience my emotions intensely"
           ,"Make people feel welcome"
           ,"Try to follow the rules"
           ,"Am easily intimidated"
           ,"Am always busy"
           ,"Prefer variety to routine"
           ,"Am easy to satisfy"
           ,"Go straight for the goal"
           ,"Often eat too much"
           ,"Love excitement"
           ,"Like to solve complex problems"
           ,"Dislike being the center of attention"
           ,"Get chores done right away"
           ,"Panic easily"
           ,"Radiate Joy"
           ,"Tend to vote for liberal political candidates"
           ,"Sympathize with the homeless"
           ,"Avoid mistakes"
           ,"Fear for the worst"
           ,"Warm up quickly to others"
           ,"Enjoy wild flights of fantasy"
           ,"Believe that others have good intentions"
           ,"Excel in what I do"
           ,"Get irritated easily"
           ,"Talk to a lot of different people at parties"
           ,"Like music"
           ,"Stick to the rules"
           ,"Like to tidy up"
           ,"Dislike myself"
           ,"Try to lead others"
           ,"Feel others' emotions"
           ,"Anticipate the needs of others"
           ,"Keep my promises"
           ,"Am afraid that I will do the wrong thing"
           ,"Am always on the go"
           ,"Like to visit new places"
           ,"Can't stand confrontations"
           ,"Work hard"
           ,"Don't know why I do some of the things I do"
           ,"Seek adventure"
           ,"Love to read challenging material"
           ,"Dislike talking about myself"
           ,"Am always prepared"
           ,"Become overwhelmed by events"
           ,"Have a lot of fun"
           ,"Believe that there is no absolute right or wrong"
           ,"Feel sympathy for those who are worse off than myself"
           ,"Choose my words with care"
           ,"Am afraid of many things"
           ,"Feel comfortable around people"
           ,"Love to daydream"
           ,"Trust what people say"
           ,"Handle tasks smoothly"
           ,"Get upset easily"
           ,"Enjoy being part of a group"
           ,"See beauty in things that others might not notice"
           ,"Use flattery to get ahead"
           ,"Want everything to be 'just right'"
           
           
           
           
           
           
           
           
           
           
           ,"Am often down in the dumps"
           ,"Can talk others into doing things"
           ,"Am passionate about causes"
           ,"Love to help others"
           ,"Pay my bills on time"
           ,"Find it difficult to approach others"
           ,"Do a lot in my spare time"
           ,"Interested in many things"
           ,"Hate to seem pushy"
           ,"Turn plans into actions"
           ,"Do things I later regret"
           ,"Love action"
           ,"Have a rich vocabulary"
           ,"Consider myself an average person"
           ,"Start tasks right away"
           ,"Feel that I'm unable to deal with things"
           ,"Express childlike joy"
           ,"Believe that criminals should receive help rather than punishment"
           ,"Value cooperation over competition"
           ,"Stick to my chosen path"
           ,"Get stressed out easily"
           ,"Act comfortably with others"
           ,"Like to get lost in thought"
           ,"Believe that people are basically moral"
           ,"Am sure of my ground"
           ,"Am often in a bad mood"
           ,"Involve others in what I am doing"
           ,"Love flowers"
           ,"Use others for my own ends"
           ,"Love order and regularity"
           ,"Have a low opinion of myself"
           ,"Seek to influence others"
           ,"Enjoy examining myself and my life"
           ,"Am concerned about others"
           ,"Tell the truth"
           ,"Am afraid to draw attention to myself"
           ,"Can manage many things at the same time"
           ,"Like to begin new things"
           ,"Have a sharp tongue"
           ,"Plunge into tasks with all my heart"
           ,"Go on binges"
           ,"Enjoy being part of a loud crowd"
           ,"Can handle a lot of information"
           ,"Seldom toot my own horn"
           ,"Get to work at once"
           ,"Can't make up my mind"
           ,"Laugh my way through life"
           ,"Believe in one true religion"
           ,"Suffer from others' sorrows"
           ,"Jump into things without thinking"
           ,"Get caught up in my problems"
           ,"Cheer people up"
           ,"Induldge in my fantasies"
           ,"Believe in human goodness"
           ,"Come up with good solutions"
           ,"Lose my temper"
           ,"Love surprise parties"
           ,"Enjoy the beauty of nature"
           ,"Know how to get around the rules"
           ,"Do things according to a plan"
           ,"Have frequent mood swings"
           ,"Take control of things"
           ,"Try to understand myself"
           ,"Have a good word for everyone"
           ,"Listen to my conscience"
           ,"Only feel comfortable with friends"
           ,"React quickly"
           ,"Prefer to stik with things that I know"
           ,"Contradict others"
           ,"Do more than what's expected of me"
           ,"Love to eat"
           ,"Enjoy being reckless"
           ,"Enjoy thinking about things"
           ,"Believe that I am better than others"
           ,"Carry out my plans"
           ,"Get overwhelmed by emotions"
           ,"Love life"
           ,"Tend to vote for conservative political candidates"
           ,"Am not interested in other people's problems"
           ,"Make rash decisions"
           ,"Am not easily bothered by things"
           ,"Am hard to get to know"
           ,"Spend time reflecting on things"
           ,"Think that all will be well"
           ,"Know how to get things done"
           ,"Rarely get irritated"
           ,"Prefer to be alone"
           ,"Do not like art"
           ,"Cheat to get ahead"
           ,"Often forget to put things back in their proper place"
           ,"Feel desperate"
           ,"Wait for others to lead the way"
           ,"Seldom get emotional"
           ,"Look down on others"
           ,"Break rules"
           ,"Stumble over my words"
           ,"Like to take it easy"
           ,"Dislike changes"
           ,"Love a good fight"
           ,"Set high standards for myself and others"
           ,"Rarely overindulge"
           ,"Act wild and crazy"
           ,"Am not interested in abstract ideas"
           ,"Think highly of myself"
           ,"Find it difficult to get down to work"
           ,"Remain calm under pressure"
           ,"Look at the bright side of life"
           ,"Believe that too much tax money goes to support artists"
           ,"Tend to dislike soft hearted people"
           ,"Like to act on a whim"
           ,"Am relaxed most of the time"
           ,"Often feel uncomfortable around others"
           ,"Seldom daydream"
           ,"Distrust people"
           ,"Misjudge situations"
           ,"Seldom get mad"
           ,"Want to be left alone"
           ,"Do not like poetry"
           ,"Put people under pressure"
           ,"Leave a mess in my room"
           ,"Feel that my life lacks direction"
           ,"Keep in the background"
           ,"Am not easily affected by my emotions"
           ,"Am indifferent to the feelings of others"
           ,"Break my promises"
           ,"Am not embarassed easily"
           ,"Like to take my time"
           ,"Don't like the idea of change"
           ,"Yell at people"
           ,"Demand quality"
           ,"Easily resist temptations"
           ,"Willing to try anything once"
           ,"Avoid philosophical discussions"
           ,"Have a high opinion of myself"
           ,"Waste my time"
           ,"Can handle complex problems"
           ,"Laugh aloud"
           ,"Believe laws should be strictly enforced"
           ,"Believe in an eye for an eye"
           ,"Rush into things"
           ,"Am not easily disturbed by events"
           ,"Avoid contact with others"
           ,"Do not have a good imagination"
           ,"Suspect hidden motives in others"
           ,"Don't understand things"
           ,"Am not easily annoyed"
           ,"Don't like crowded events"
           ,"Do not enjoy going to art museums"
           ,"Pretend to be concerned for others"
           ,"Leave my belongings around"
           ,"Seldom feel blue"
           ,"Have little to say"
           ,"Rarely notice my emotional reactions"
           ,"Make people feel uncomfortable"
           ,"Get others to do my duties"
           ,"Am comfortable in unfamiliar situations"
           ,"Like a leisurely lifestyle"
           ,"Am a creature of habit"
           ,"Insult people"
           ,"Am not highly motivated to succeed"
           ,"Am able to control my cravings"
           
           
           
           
           ,"Seek danger"
           ,"Have difficulty understanding abstract ideas"
           ,"Know the answers to many questions"
           ,"Need a push to get started"
           ,"Know how to cope"
           ,"Amuse my friends"
           ,"Believe that we coddle criminals too much"
           ,"Try not to think about the needy"
           ,"Do crazy things"
           ,"Don't worry about things that have already happened"
           ,"Am not really interested in others"
           ,"Seldom get lost in thought"
           ,"Am wary of others"
           ,"Have little to contribute"
           ,"Keep my cool"
           ,"Avoid crowds"
           ,"Do not like concerts"
           ,"Take advantage of others"
           ,"Am not bothered by messy people"
           ,"Feel comfortable with myself"
           ,"Don't like to draw attention to myself"
           ,"Experience very few emotional highs and lows"
           ,"Turn my back on others"
           ,"Do the opposite of what is asked"
           ,"Am not bothered by difficult social situations"
           ,"Let things proceed at their own pace"
           ,"Dislike new foods"
           ,"Get back at others"
           ,"Do just enough work to get by"
           ,"Never spend more than I can afford"
           ,"Would never go hand gliding or bungee jumping"
           ,"Am not interested in theoretical discussions"
           ,"Boast about my virtues"
           ,"Have difficulty starting tasks"
           ,"Readily overcome setbacks"
           ,"Am not easily amused"
           ,"Believe that we should be tough on crime"
           ,"Believe people should fend for themselves"
           ,"Act without thinking"
           ,"Adapt easily to new situations"
           ,"Keep others at a distance"
           ,"Have difficulty imagining things"
           ,"Believe that people are essentially evil"
           ,"Don't see the consequences of things"
           ,"Rarely complain"
           ,"Seek quiet"
           ,"Do not enjoy watching dance performances"
           ,"Obstruct others' plans"
           ,"Am not bothered by disorder"
           ,"Am very pleased with myself"
           ,"Hold back my opinions"
           ,"Don't understand people who get emotional"
           ,"Take no time for others"
           ,"Misinterpret the facts"
           ,"Am able t stand up for myself"
           ,"React slowly"
           ,"Am attached to conventional ways"
           ,"Hold a grudge"
           ,"Put little time and effort into my work"
           ,"Never splurge"
           ,"Dislike loud music"
           ,"Avoid difficult reading material"
           ,"Make myself the center of attention"
           ,"Postpone decisions"
           ,"Am calm even in tense situations"
           ,"Seldom joke around"
           ,"Like to stand during the national anthem"
           ,"Can't stand weak people"
           ,"Often make last minute plans")

items2 <- items                 ## inefficient but having difficulty sampling 5 at a time in order
items3 <- items
items4 <- items
items5 <- items
all <- rbind(items,items2,items3,items4,items5)

data$item <- as.factor(data$item)

data$item <- all[c(1:1500)]

## temporary subset:
## plot <- data[1:5,]

## based on Edwards' ratings values:

data$ID <- seq.int(nrow(data))     ## need to multiply by FIVE, then subtract FOUR

## Need to just get in for SIOP 9/11/18; these are old values (sdcorrect_2.csv reordered from other Alicia project)
## sdcorrect.csv had middle items reversed - this should be ok 9/11/18

ed.value <- c(-1.16667,
              3.33333,
              1.66667,
              1.83333,
              3.33333,
              -3.50000,
              1.16667,
              1.00000,
              2.66667,
              1.16667,
              -2.00000,
              1.83333,
              0.00000,
              3.50000,
              2.66667,
              -2.33333,
              0.50000,
              0.16667,
              2.16667,
              2.16667,
              -2.33333,
              0.83333,
              1.50000,
              -0.33333,
              2.33333,
              -2.50000,
              3.16667,
              0.16667,
              2.50000,
              1.50000,
              -1.66667,
              2.33333,
              -0.16667,
              1.83333,
              2.83333,
              -2.83333,
              2.00000,
              0.80000,
              2.33333,
              1.66667,
              -3.00000,
              2.33333,
              2.66667,
              2.33333,
              3.83333,
              -0.66667,
              0.16667,
              1.16667,
              -0.33333,
              3.16667,
              -1.00000,
              0.83333,
              0.66667,
              0.16667,
              2.50000,
              -2.16667,
              2.50000,
              0.50000,
              2.83333,
              2.33333,
              -2.16667,
              2.50000,
              0.00000,
              1.50000,
              2.16667,
              -2.33333,
              1.83333,
              1.66667,
              -1.00000,
              -0.50000,
              -2.00000,
              1.33333,
              2.50000,
              3.83333,
              2.50000,
              -1.66667,
              1.16667,
              1.00000,
              1.33333,
              1.83333,
              -2.33333,
              0.83333,
              1.20000,
              -0.16667,
              2.33333,
              -2.33333,
              1.33333,
              0.16667,
              2.00000,
              -0.16667,
              -2.50000,
              2.33333,
              -0.16667,
              2.16667,
              2.00000,
              -2.83333,
              1.66667,
              0.16667,
              -2.66667,
              0.33333,
              -1.83333,
              0.60000,
              1.33333,
              2.33333,
              3.50000,
              -0.33333,
              1.83333,
              1.50000,
              -2.50000,
              1.83333,
              -2.83333,
              -0.50000,
              2.16667,
              2.00000,
              1.66667,
              -1.33333,
              1.50000,
              -0.50000,
              0.66667,
              -2.00000,
              -2.16667,
              3.16667,
              -0.33333,
              3.00000,
              2.00000,
              -3.00000,
              0.16667,
              1.66667,
              -0.50000,
              1.83333,
              -2.00000,
              1.83333,
              2.00000,
              3.00000,
              3.33333,
              -0.83333,
              0.50000,
              -0.83333,
              -1.33333,
              3.00000,
              -0.66667,
              -1.50000,
              0.33333,
              -2.66667,
              2.00000,
              -1.33333,
              3.00000,
              0.00000,
              -1.83333,
              -0.50000,
              2.16667,
              -1.50000,
              1.50000,
              1.66667,
              2.50000,
              1.83333,
              -1.16667,
              -0.33333,
              -3.50000,
              -1.00000,
              -2.16667,
              -0.50000,
              0.33333,
              -3.00000,
              -1.66667,
              -1.50000,
              0.16667,
              -1.16667,
              -2.00000,
              2.33333,
              1.33333,
              -1.16667,
              -0.50000,
              -0.33333,
              -1.83333,
              2.16667,
              3.00000,
              -0.33333,
              -2.00000,
              -0.33333,
              2.00000,
              -2.33333,
              0.00000,
              -1.33333,
              -1.66667,
              2.50000,
              -1.80000,
              -0.16667,
              -1.40000,
              -0.83333,
              -1.66667,
              -0.83333,
              0.83333,
              -2.83333,
              -3.50000,
              1.00000,
              0.83333,
              -1.16667,
              -2.83333,
              1.83333,
              1.50000,
              1.33333,
              -0.50000,
              -0.66667,
              -2.00000,
              2.33333,
              2.33333,
              0.16667,
              -1.00000,
              -1.33333,
              1.66667,
              -2.33333,
              -0.66667,
              -1.33333,
              -1.66667,
              1.16667,
              -0.66667,
              -0.83333,
              -0.66667,
              -1.40000,
              1.80000,
              -0.80000,
              -0.16667,
              -3.00000,
              -2.33333,
              1.50000,
              0.00000,
              -0.33333,
              -3.66667,
              0.00000,
              2.00000,
              -0.83333,
              -0.83333,
              2.33333,
              -1.33333,
              2.66667,
              1.83333,
              -0.33333,
              -1.50000,
              -1.50000,
              1.16667,
              -2.66667,
              0.33333,
              -1.50000,
              -2.00000,
              3.00000,
              -0.50000,
              -0.50000,
              -3.83333,
              0.66667,
              3.33333,
              0.00000,
              -0.66667,
              -3.66667,
              -3.16667,
              2.33333,
              0.66667,
              -0.83333,
              -2.66667,
              -2.66667,
              2.83333,
              -0.83333,
              0.16667,
              -2.16667,
              -1.50000,
              3.16667,
              -1.50000,
              0.66667,
              -1.33333,
              -2.16667,
              2.83333,
              -2.00000,
              -0.50000,
              -3.33333,
              -2.66667,
              2.66667,
              -0.33333,
              -0.50000,
              -3.00000,
              -0.16667,
              -0.16667,
              -0.16667,
              -1.16667,
              -2.66667,
              -3.16667,
              2.33333,
              -0.83333,
              -1.16667,
              -2.66667,
              -3.16667,
              -0.83333,
              0.00000,
              -1.00000,
              -1.00000,
              -1.33333,
              2.50000,
              -2.16667,
              1.66667,
              -2.00000,
              -0.50000)

use <- rep(ed.value, each=5)

data$Edwards <- NA
data$Edwards <- use


i1 <- data[c(1:5),]
i2 <- data[c(6:10),]
i3 <- data[c(11:15),]
i4 <- data[c(16:20),]
i5 <- data[c(21:25),]
i6 <- data[c(26:30),]
i7 <- data[c(31:35),]
i8 <- data[c(36:40),]
i9 <- data[c(41:45),]
i10 <- data[c(46:50),]
i11 <- data[c(51:55),]
i12 <- data[c(56:60),]
i13 <- data[c(61:65),]
i14 <- data[c(66:70),]
i15 <- data[c(71:75),]
i16 <- data[c(76:80),]
i17 <- data[c(81:85),]
i18 <- data[c(86:90),]
i19 <- data[c(91:95),]
i20 <- data[c(96:100),]

i21 <- data[c(101:105),]
i22 <- data[c(106:110),]
i23 <- data[c(111:115),]
i24 <- data[c(116:120),]
i25 <- data[c(121:125),]
i26 <- data[c(126:130),]
i27 <- data[c(131:135),]
i28 <- data[c(136:140),]
i29 <- data[c(141:145),]
i30 <- data[c(146:150),]
i31 <- data[c(151:155),]
i32 <- data[c(156:160),]
i33 <- data[c(161:165),]
i34 <- data[c(166:170),]
i35 <- data[c(171:175),]
i36 <- data[c(176:180),]
i37 <- data[c(181:185),]
i38 <- data[c(186:190),]
i39 <- data[c(191:195),]
i40 <- data[c(196:200),]

i41 <- data[c(201:205),]
i42 <- data[c(206:210),]
i43 <- data[c(211:215),]
i44 <- data[c(216:220),]
i45 <- data[c(221:225),]
i46 <- data[c(226:230),]
i47 <- data[c(231:235),]
i48 <- data[c(236:240),]
i49 <- data[c(241:245),]
i50 <- data[c(246:250),]
i51 <- data[c(251:255),]
i52 <- data[c(256:260),]
i53 <- data[c(261:265),]
i54 <- data[c(266:270),]
i55 <- data[c(271:275),]
i56 <- data[c(276:280),]
i57 <- data[c(281:285),]
i58 <- data[c(286:290),]
i59 <- data[c(291:295),]
i60 <- data[c(296:300),]

i61 <- data[c(301:305),]
i62 <- data[c(306:310),]
i63 <- data[c(311:315),]
i64 <- data[c(316:320),]
i65 <- data[c(321:325),]
i66 <- data[c(326:330),]
i67 <- data[c(331:335),]
i68 <- data[c(336:340),]
i69 <- data[c(341:345),]
i70 <- data[c(346:350),]
i71 <- data[c(351:355),]
i72 <- data[c(356:360),]
i73 <- data[c(361:365),]
i74 <- data[c(366:370),]
i75 <- data[c(371:375),]
i76 <- data[c(376:380),]
i77 <- data[c(381:385),]
i78 <- data[c(386:390),]
i79 <- data[c(391:395),]
i80 <- data[c(396:400),]

i81 <- data[c(401:405),]
i82 <- data[c(406:410),]
i83 <- data[c(411:415),]
i84 <- data[c(416:420),]
i85 <- data[c(421:425),]
i86 <- data[c(426:430),]
i87 <- data[c(431:435),]
i88 <- data[c(436:440),]
i89 <- data[c(441:445),]
i90 <- data[c(446:450),]
i91 <- data[c(451:455),]
i92 <- data[c(456:460),]
i93 <- data[c(461:465),]
i94 <- data[c(466:470),]
i95 <- data[c(471:475),]
i96 <- data[c(476:480),]
i97 <- data[c(481:485),]
i98 <- data[c(486:490),]
i99 <- data[c(491:495),]
i100 <- data[c(496:500),]



i101 <- data[c(501:505),]
i102 <- data[c(506:510),]
i103 <- data[c(511:515),]
i104 <- data[c(516:520),]
i105 <- data[c(521:525),]
i106 <- data[c(526:530),]
i107 <- data[c(531:535),]
i108 <- data[c(536:540),]
i109 <- data[c(541:545),]
i110 <- data[c(546:550),]
i111 <- data[c(551:555),]
i112 <- data[c(556:560),]
i113 <- data[c(561:565),]
i114 <- data[c(566:570),]
i115 <- data[c(571:575),]
i116 <- data[c(576:580),]
i117 <- data[c(581:585),]
i118 <- data[c(586:590),]
i119 <- data[c(591:595),]
i120 <- data[c(596:600),]

i121 <- data[c(601:605),]
i122 <- data[c(606:610),]
i123 <- data[c(611:615),]
i124 <- data[c(616:620),]
i125 <- data[c(621:625),]
i126 <- data[c(626:630),]
i127 <- data[c(631:635),]
i128 <- data[c(636:640),]
i129 <- data[c(641:645),]
i130 <- data[c(646:650),]
i131 <- data[c(651:655),]
i132 <- data[c(656:660),]
i133 <- data[c(661:665),]
i134 <- data[c(666:670),]
i135 <- data[c(671:675),]
i136 <- data[c(676:680),]
i137 <- data[c(681:685),]
i138 <- data[c(686:690),]
i139 <- data[c(691:695),]
i140 <- data[c(696:700),]

i141 <- data[c(701:705),]
i142 <- data[c(706:710),]
i143 <- data[c(711:715),]
i144 <- data[c(716:720),]
i145 <- data[c(721:725),]
i146 <- data[c(726:730),]
i147 <- data[c(731:735),]
i148 <- data[c(736:740),]
i149 <- data[c(741:745),]
i150 <- data[c(746:750),]
i151 <- data[c(751:755),]
i152 <- data[c(756:760),]
i153 <- data[c(761:765),]
i154 <- data[c(766:770),]
i155 <- data[c(771:775),]
i156 <- data[c(776:780),]
i157 <- data[c(781:785),]
i158 <- data[c(786:790),]
i159 <- data[c(791:795),]
i160 <- data[c(796:800),]

i161 <- data[c(801:805),]
i162 <- data[c(806:810),]
i163 <- data[c(811:815),]
i164 <- data[c(816:820),]
i165 <- data[c(821:825),]
i166 <- data[c(826:830),]
i167 <- data[c(831:835),]
i168 <- data[c(836:840),]
i169 <- data[c(841:845),]
i170 <- data[c(846:850),]
i171 <- data[c(851:855),]
i172 <- data[c(856:860),]
i173 <- data[c(861:865),]
i174 <- data[c(866:870),]
i175 <- data[c(871:875),]
i176 <- data[c(876:880),]
i177 <- data[c(881:885),]
i178 <- data[c(886:890),]
i179 <- data[c(891:895),]
i180 <- data[c(896:900),]

i181 <- data[c(901:905),]
i182 <- data[c(906:910),]
i183 <- data[c(911:915),]
i184 <- data[c(916:920),]
i185 <- data[c(921:925),]
i186 <- data[c(926:930),]
i187 <- data[c(931:935),]
i188 <- data[c(936:940),]
i189 <- data[c(941:945),]
i190 <- data[c(946:950),]
i191 <- data[c(951:955),]
i192 <- data[c(956:960),]
i193 <- data[c(961:965),]
i194 <- data[c(966:970),]
i195 <- data[c(971:975),]
i196 <- data[c(976:980),]
i197 <- data[c(981:985),]
i198 <- data[c(986:990),]
i199 <- data[c(991:995),]
i200 <- data[c(996:1000),]


i201 <- data[c(1001:1005),]
i202 <- data[c(1006:1010),]
i203 <- data[c(1011:1015),]
i204 <- data[c(1016:1020),]
i205 <- data[c(1021:1025),]
i206 <- data[c(1026:1030),]
i207 <- data[c(1031:1035),]
i208 <- data[c(1036:1040),]
i209 <- data[c(1041:1045),]
i210 <- data[c(1046:1050),]
i211 <- data[c(1051:1055),]
i212 <- data[c(1056:1060),]
i213 <- data[c(1061:1065),]
i214 <- data[c(1066:1070),]
i215 <- data[c(1071:1075),]
i216 <- data[c(1076:1080),]
i217 <- data[c(1081:1085),]
i218 <- data[c(1086:1090),]
i219 <- data[c(1091:1095),]
i220 <- data[c(1096:1100),]
i221 <- data[c(1101:1105),]
i222 <- data[c(1106:1110),]
i223 <- data[c(1111:1115),]
i224 <- data[c(1116:1120),]
i225 <- data[c(1121:1125),]
i226 <- data[c(1126:1130),]
i227 <- data[c(1131:1135),]
i228 <- data[c(1136:1140),]
i229 <- data[c(1141:1145),]
i230 <- data[c(1146:1150),]
i231 <- data[c(1151:1155),]
i232 <- data[c(1156:1160),]
i233 <- data[c(1161:1165),]
i234 <- data[c(1166:1170),]
i235 <- data[c(1171:1175),]
i236 <- data[c(1176:1180),]
i237 <- data[c(1181:1185),]
i238 <- data[c(1186:1190),]
i239 <- data[c(1191:1195),]
i240 <- data[c(1196:1200),]
i241 <- data[c(1201:1205),]
i242 <- data[c(1206:1210),]
i243 <- data[c(1211:1215),]
i244 <- data[c(1216:1220),]
i245 <- data[c(1221:1225),]
i246 <- data[c(1226:1230),]
i247 <- data[c(1231:1235),]
i248 <- data[c(1236:1240),]
i249 <- data[c(1241:1245),]
i250 <- data[c(1246:1250),]
i251 <- data[c(1251:1255),]
i252 <- data[c(1256:1260),]
i253 <- data[c(1261:1265),]
i254 <- data[c(1266:1270),]
i255 <- data[c(1271:1275),]
i256 <- data[c(1276:1280),]
i257 <- data[c(1281:1285),]
i258 <- data[c(1286:1290),]
i259 <- data[c(1291:1295),]
i260 <- data[c(1296:1300),]
i261 <- data[c(1301:1305),]
i262 <- data[c(1306:1310),]
i263 <- data[c(1311:1315),]
i264 <- data[c(1316:1320),]
i265 <- data[c(1321:1325),]
i266 <- data[c(1326:1330),]
i267 <- data[c(1331:1335),]
i268 <- data[c(1336:1340),]
i269 <- data[c(1341:1345),]
i270 <- data[c(1346:1350),]
i271 <- data[c(1351:1355),]
i272 <- data[c(1356:1360),]
i273 <- data[c(1361:1365),]
i274 <- data[c(1366:1370),]
i275 <- data[c(1371:1375),]
i276 <- data[c(1376:1380),]
i277 <- data[c(1381:1385),]
i278 <- data[c(1386:1390),]
i279 <- data[c(1391:1395),]
i280 <- data[c(1396:1400),]
i281 <- data[c(1401:1405),]
i282 <- data[c(1406:1410),]
i283 <- data[c(1411:1415),]
i284 <- data[c(1416:1420),]
i285 <- data[c(1421:1425),]
i286 <- data[c(1426:1430),]
i287 <- data[c(1431:1435),]
i288 <- data[c(1436:1440),]
i289 <- data[c(1441:1445),]
i290 <- data[c(1446:1450),]
i291 <- data[c(1451:1455),]
i292 <- data[c(1456:1460),]
i293 <- data[c(1461:1465),]
i294 <- data[c(1466:1470),]
i295 <- data[c(1471:1475),]
i296 <- data[c(1476:1480),]
i297 <- data[c(1481:1485),]
i298 <- data[c(1486:1490),]
i299 <- data[c(1491:1495),]
i300 <- data[c(1496:1500),]


r1 <- lm(mean ~ ID, i1)
r2 <- lm(mean ~ ID, i2)
r3 <- lm(mean ~ ID, i3)
r4 <- lm(mean ~ ID, i4)
r5 <- lm(mean ~ ID, i5)
r6 <- lm(mean ~ ID, i6)
r7 <- lm(mean ~ ID, i7)
r8 <- lm(mean ~ ID, i8)
r9 <- lm(mean ~ ID, i9)
r10 <- lm(mean ~ ID, i10)
r11 <- lm(mean ~ ID, i11)
r12 <- lm(mean ~ ID, i12)
r13 <- lm(mean ~ ID, i13)
r14 <- lm(mean ~ ID, i14)
r15 <- lm(mean ~ ID, i15)
r16 <- lm(mean ~ ID, i16)
r17 <- lm(mean ~ ID, i17)
r18 <- lm(mean ~ ID, i18)
r19 <- lm(mean ~ ID, i19)
r20 <- lm(mean ~ ID, i20)
r21 <- lm(mean ~ ID, i21)
r22 <- lm(mean ~ ID, i22)
r23 <- lm(mean ~ ID, i23)
r24 <- lm(mean ~ ID, i24)
r25 <- lm(mean ~ ID, i25)
r26 <- lm(mean ~ ID, i26)
r27 <- lm(mean ~ ID, i27)
r28 <- lm(mean ~ ID, i28)
r29 <- lm(mean ~ ID, i29)
r30 <- lm(mean ~ ID, i30)
r31 <- lm(mean ~ ID, i31)
r32 <- lm(mean ~ ID, i32)
r33 <- lm(mean ~ ID, i33)
r34 <- lm(mean ~ ID, i34)
r35 <- lm(mean ~ ID, i35)
r36 <- lm(mean ~ ID, i36)
r37 <- lm(mean ~ ID, i37)
r38 <- lm(mean ~ ID, i38)
r39 <- lm(mean ~ ID, i39)
r40 <- lm(mean ~ ID, i40)
r41 <- lm(mean ~ ID, i41)
r42 <- lm(mean ~ ID, i42)
r43 <- lm(mean ~ ID, i43)
r44 <- lm(mean ~ ID, i44)
r45 <- lm(mean ~ ID, i45)
r46 <- lm(mean ~ ID, i46)
r47 <- lm(mean ~ ID, i47)
r48 <- lm(mean ~ ID, i48)
r49 <- lm(mean ~ ID, i49)
r50 <- lm(mean ~ ID, i50)
r51 <- lm(mean ~ ID, i51)
r52 <- lm(mean ~ ID, i52)
r53 <- lm(mean ~ ID, i53)
r54 <- lm(mean ~ ID, i54)
r55 <- lm(mean ~ ID, i55)
r56 <- lm(mean ~ ID, i56)
r57 <- lm(mean ~ ID, i57)
r58 <- lm(mean ~ ID, i58)
r59 <- lm(mean ~ ID, i59)
r60 <- lm(mean ~ ID, i60)
r61 <- lm(mean ~ ID, i61)
r62 <- lm(mean ~ ID, i62)
r63 <- lm(mean ~ ID, i63)
r64 <- lm(mean ~ ID, i64)
r65 <- lm(mean ~ ID, i65)
r66 <- lm(mean ~ ID, i66)
r67 <- lm(mean ~ ID, i67)
r68 <- lm(mean ~ ID, i68)
r69 <- lm(mean ~ ID, i69)
r70 <- lm(mean ~ ID, i70)
r71 <- lm(mean ~ ID, i71)
r72 <- lm(mean ~ ID, i72)
r73 <- lm(mean ~ ID, i73)
r74 <- lm(mean ~ ID, i74)
r75 <- lm(mean ~ ID, i75)
r76 <- lm(mean ~ ID, i76)
r77 <- lm(mean ~ ID, i77)
r78 <- lm(mean ~ ID, i78)
r79 <- lm(mean ~ ID, i79)
r80 <- lm(mean ~ ID, i80)
r81 <- lm(mean ~ ID, i81)
r82 <- lm(mean ~ ID, i82)
r83 <- lm(mean ~ ID, i83)
r84 <- lm(mean ~ ID, i84)
r85 <- lm(mean ~ ID, i85)
r86 <- lm(mean ~ ID, i86)
r87 <- lm(mean ~ ID, i87)
r88 <- lm(mean ~ ID, i88)
r89 <- lm(mean ~ ID, i89)
r90 <- lm(mean ~ ID, i90)
r91 <- lm(mean ~ ID, i91)
r92 <- lm(mean ~ ID, i92)
r93 <- lm(mean ~ ID, i93)
r94 <- lm(mean ~ ID, i94)
r95 <- lm(mean ~ ID, i95)
r96 <- lm(mean ~ ID, i96)
r97 <- lm(mean ~ ID, i97)
r98 <- lm(mean ~ ID, i98)
r99 <- lm(mean ~ ID, i99)
r100 <- lm(mean ~ ID, i100)
r101 <- lm(mean ~ ID, i101)
r102 <- lm(mean ~ ID, i102)
r103 <- lm(mean ~ ID, i103)
r104 <- lm(mean ~ ID, i104)
r105 <- lm(mean ~ ID, i105)
r106 <- lm(mean ~ ID, i106)
r107 <- lm(mean ~ ID, i107)
r108 <- lm(mean ~ ID, i108)
r109 <- lm(mean ~ ID, i109)
r110 <- lm(mean ~ ID, i110)
r111 <- lm(mean ~ ID, i111)
r112 <- lm(mean ~ ID, i112)
r113 <- lm(mean ~ ID, i113)
r114 <- lm(mean ~ ID, i114)
r115 <- lm(mean ~ ID, i115)
r116 <- lm(mean ~ ID, i116)
r117 <- lm(mean ~ ID, i117)
r118 <- lm(mean ~ ID, i118)
r119 <- lm(mean ~ ID, i119)
r120 <- lm(mean ~ ID, i120)
r121 <- lm(mean ~ ID, i121)
r122 <- lm(mean ~ ID, i122)
r123 <- lm(mean ~ ID, i123)
r124 <- lm(mean ~ ID, i124)
r125 <- lm(mean ~ ID, i125)
r126 <- lm(mean ~ ID, i126)
r127 <- lm(mean ~ ID, i127)
r128 <- lm(mean ~ ID, i128)
r129 <- lm(mean ~ ID, i129)
r130 <- lm(mean ~ ID, i130)
r131 <- lm(mean ~ ID, i131)
r132 <- lm(mean ~ ID, i132)
r133 <- lm(mean ~ ID, i133)
r134 <- lm(mean ~ ID, i134)
r135 <- lm(mean ~ ID, i135)
r136 <- lm(mean ~ ID, i136)
r137 <- lm(mean ~ ID, i137)
r138 <- lm(mean ~ ID, i138)
r139 <- lm(mean ~ ID, i139)
r140 <- lm(mean ~ ID, i140)
r141 <- lm(mean ~ ID, i141)
r142 <- lm(mean ~ ID, i142)
r143 <- lm(mean ~ ID, i143)
r144 <- lm(mean ~ ID, i144)
r145 <- lm(mean ~ ID, i145)
r146 <- lm(mean ~ ID, i146)
r147 <- lm(mean ~ ID, i147)
r148 <- lm(mean ~ ID, i148)
r149 <- lm(mean ~ ID, i149)
r150 <- lm(mean ~ ID, i150)
r151 <- lm(mean ~ ID, i151)
r152 <- lm(mean ~ ID, i152)
r153 <- lm(mean ~ ID, i153)
r154 <- lm(mean ~ ID, i154)
r155 <- lm(mean ~ ID, i155)
r156 <- lm(mean ~ ID, i156)
r157 <- lm(mean ~ ID, i157)
r158 <- lm(mean ~ ID, i158)
r159 <- lm(mean ~ ID, i159)
r160 <- lm(mean ~ ID, i160)
r161 <- lm(mean ~ ID, i161)
r162 <- lm(mean ~ ID, i162)
r163 <- lm(mean ~ ID, i163)
r164 <- lm(mean ~ ID, i164)
r165 <- lm(mean ~ ID, i165)
r166 <- lm(mean ~ ID, i166)
r167 <- lm(mean ~ ID, i167)
r168 <- lm(mean ~ ID, i168)
r169 <- lm(mean ~ ID, i169)
r170 <- lm(mean ~ ID, i170)
r171 <- lm(mean ~ ID, i171)
r172 <- lm(mean ~ ID, i172)
r173 <- lm(mean ~ ID, i173)
r174 <- lm(mean ~ ID, i174)
r175 <- lm(mean ~ ID, i175)
r176 <- lm(mean ~ ID, i176)
r177 <- lm(mean ~ ID, i177)
r178 <- lm(mean ~ ID, i178)
r179 <- lm(mean ~ ID, i179)
r180 <- lm(mean ~ ID, i180)
r181 <- lm(mean ~ ID, i181)
r182 <- lm(mean ~ ID, i182)
r183 <- lm(mean ~ ID, i183)
r184 <- lm(mean ~ ID, i184)
r185 <- lm(mean ~ ID, i185)
r186 <- lm(mean ~ ID, i186)
r187 <- lm(mean ~ ID, i187)
r188 <- lm(mean ~ ID, i188)
r189 <- lm(mean ~ ID, i189)
r190 <- lm(mean ~ ID, i190)
r191 <- lm(mean ~ ID, i191)
r192 <- lm(mean ~ ID, i192)
r193 <- lm(mean ~ ID, i193)
r194 <- lm(mean ~ ID, i194)
r195 <- lm(mean ~ ID, i195)
r196 <- lm(mean ~ ID, i196)
r197 <- lm(mean ~ ID, i197)
r198 <- lm(mean ~ ID, i198)
r199 <- lm(mean ~ ID, i199)
r200 <- lm(mean ~ ID, i200)
r201 <- lm(mean ~ ID, i201)
r202 <- lm(mean ~ ID, i202)
r203 <- lm(mean ~ ID, i203)
r204 <- lm(mean ~ ID, i204)
r205 <- lm(mean ~ ID, i205)
r206 <- lm(mean ~ ID, i206)
r207 <- lm(mean ~ ID, i207)
r208 <- lm(mean ~ ID, i208)
r209 <- lm(mean ~ ID, i209)
r210 <- lm(mean ~ ID, i210)
r211 <- lm(mean ~ ID, i211)
r212 <- lm(mean ~ ID, i212)
r213 <- lm(mean ~ ID, i213)
r214 <- lm(mean ~ ID, i214)
r215 <- lm(mean ~ ID, i215)
r216 <- lm(mean ~ ID, i216)
r217 <- lm(mean ~ ID, i217)
r218 <- lm(mean ~ ID, i218)
r219 <- lm(mean ~ ID, i219)
r220 <- lm(mean ~ ID, i220)
r221 <- lm(mean ~ ID, i221)
r222 <- lm(mean ~ ID, i222)
r223 <- lm(mean ~ ID, i223)
r224 <- lm(mean ~ ID, i224)
r225 <- lm(mean ~ ID, i225)
r226 <- lm(mean ~ ID, i226)
r227 <- lm(mean ~ ID, i227)
r228 <- lm(mean ~ ID, i228)
r229 <- lm(mean ~ ID, i229)
r230 <- lm(mean ~ ID, i230)
r231 <- lm(mean ~ ID, i231)
r232 <- lm(mean ~ ID, i232)
r233 <- lm(mean ~ ID, i233)
r234 <- lm(mean ~ ID, i234)
r235 <- lm(mean ~ ID, i235)
r236 <- lm(mean ~ ID, i236)
r237 <- lm(mean ~ ID, i237)
r238 <- lm(mean ~ ID, i238)
r239 <- lm(mean ~ ID, i239)
r240 <- lm(mean ~ ID, i240)
r241 <- lm(mean ~ ID, i241)
r242 <- lm(mean ~ ID, i242)
r243 <- lm(mean ~ ID, i243)
r244 <- lm(mean ~ ID, i244)
r245 <- lm(mean ~ ID, i245)
r246 <- lm(mean ~ ID, i246)
r247 <- lm(mean ~ ID, i247)
r248 <- lm(mean ~ ID, i248)
r249 <- lm(mean ~ ID, i249)
r250 <- lm(mean ~ ID, i250)
r251 <- lm(mean ~ ID, i251)
r252 <- lm(mean ~ ID, i252)
r253 <- lm(mean ~ ID, i253)
r254 <- lm(mean ~ ID, i254)
r255 <- lm(mean ~ ID, i255)
r256 <- lm(mean ~ ID, i256)
r257 <- lm(mean ~ ID, i257)
r258 <- lm(mean ~ ID, i258)
r259 <- lm(mean ~ ID, i259)
r260 <- lm(mean ~ ID, i260)
r261 <- lm(mean ~ ID, i261)
r262 <- lm(mean ~ ID, i262)
r263 <- lm(mean ~ ID, i263)
r264 <- lm(mean ~ ID, i264)
r265 <- lm(mean ~ ID, i265)
r266 <- lm(mean ~ ID, i266)
r267 <- lm(mean ~ ID, i267)
r268 <- lm(mean ~ ID, i268)
r269 <- lm(mean ~ ID, i269)
r270 <- lm(mean ~ ID, i270)
r271 <- lm(mean ~ ID, i271)
r272 <- lm(mean ~ ID, i272)
r273 <- lm(mean ~ ID, i273)
r274 <- lm(mean ~ ID, i274)
r275 <- lm(mean ~ ID, i275)
r276 <- lm(mean ~ ID, i276)
r277 <- lm(mean ~ ID, i277)
r278 <- lm(mean ~ ID, i278)
r279 <- lm(mean ~ ID, i279)
r280 <- lm(mean ~ ID, i280)
r281 <- lm(mean ~ ID, i281)
r282 <- lm(mean ~ ID, i282)
r283 <- lm(mean ~ ID, i283)
r284 <- lm(mean ~ ID, i284)
r285 <- lm(mean ~ ID, i285)
r286 <- lm(mean ~ ID, i286)
r287 <- lm(mean ~ ID, i287)
r288 <- lm(mean ~ ID, i288)
r289 <- lm(mean ~ ID, i289)
r290 <- lm(mean ~ ID, i290)
r291 <- lm(mean ~ ID, i291)
r292 <- lm(mean ~ ID, i292)
r293 <- lm(mean ~ ID, i293)
r294 <- lm(mean ~ ID, i294)
r295 <- lm(mean ~ ID, i295)
r296 <- lm(mean ~ ID, i296)
r297 <- lm(mean ~ ID, i297)
r298 <- lm(mean ~ ID, i298)
r299 <- lm(mean ~ ID, i299)
r300 <- lm(mean ~ ID, i300)

c1 <- r1$coefficients
c2 <- r2$coefficients
c3 <- r3$coefficients
c4 <- r4$coefficients
c5 <- r5$coefficients
c6 <- r6$coefficients
c7 <- r7$coefficients
c8 <- r8$coefficients
c9 <- r9$coefficients
c10 <- r10$coefficients
c11 <- r11$coefficients
c12 <- r12$coefficients
c13 <- r13$coefficients
c14 <- r14$coefficients
c15 <- r15$coefficients
c16 <- r16$coefficients
c17 <- r17$coefficients
c18 <- r18$coefficients
c19 <- r19$coefficients
c20 <- r20$coefficients
c21 <- r21$coefficients
c22 <- r22$coefficients
c23 <- r23$coefficients
c24 <- r24$coefficients
c25 <- r25$coefficients
c26 <- r26$coefficients
c27 <- r27$coefficients
c28 <- r28$coefficients
c29 <- r29$coefficients
c30 <- r30$coefficients
c31 <- r31$coefficients
c32 <- r32$coefficients
c33 <- r33$coefficients
c34 <- r34$coefficients
c35 <- r35$coefficients
c36 <- r36$coefficients
c37 <- r37$coefficients
c38 <- r38$coefficients
c39 <- r39$coefficients
c40 <- r40$coefficients
c41 <- r41$coefficients
c42 <- r42$coefficients
c43 <- r43$coefficients
c44 <- r44$coefficients
c45 <- r45$coefficients
c46 <- r46$coefficients
c47 <- r47$coefficients
c48 <- r48$coefficients
c49 <- r49$coefficients
c50 <- r50$coefficients
c51 <- r51$coefficients
c52 <- r52$coefficients
c53 <- r53$coefficients
c54 <- r54$coefficients
c55 <- r55$coefficients
c56 <- r56$coefficients
c57 <- r57$coefficients
c58 <- r58$coefficients
c59 <- r59$coefficients
c60 <- r60$coefficients
c61 <- r61$coefficients
c62 <- r62$coefficients
c63 <- r63$coefficients
c64 <- r64$coefficients
c65 <- r65$coefficients
c66 <- r66$coefficients
c67 <- r67$coefficients
c68 <- r68$coefficients
c69 <- r69$coefficients
c70 <- r70$coefficients
c71 <- r71$coefficients
c72 <- r72$coefficients
c73 <- r73$coefficients
c74 <- r74$coefficients
c75 <- r75$coefficients
c76 <- r76$coefficients
c77 <- r77$coefficients
c78 <- r78$coefficients
c79 <- r79$coefficients
c80 <- r80$coefficients
c81 <- r81$coefficients
c82 <- r82$coefficients
c83 <- r83$coefficients
c84 <- r84$coefficients
c85 <- r85$coefficients
c86 <- r86$coefficients
c87 <- r87$coefficients
c88 <- r88$coefficients
c89 <- r89$coefficients
c90 <- r90$coefficients
c91 <- r91$coefficients
c92 <- r92$coefficients
c93 <- r93$coefficients
c94 <- r94$coefficients
c95 <- r95$coefficients
c96 <- r96$coefficients
c97 <- r97$coefficients
c98 <- r98$coefficients
c99 <- r99$coefficients
c100 <- r100$coefficients

c101 <- r101$coefficients
c102 <- r102$coefficients
c103 <- r103$coefficients
c104 <- r104$coefficients
c105 <- r105$coefficients
c106 <- r106$coefficients
c107 <- r107$coefficients
c108 <- r108$coefficients
c109 <- r109$coefficients
c110 <- r110$coefficients
c111 <- r111$coefficients
c112 <- r112$coefficients
c113 <- r113$coefficients
c114 <- r114$coefficients
c115 <- r115$coefficients
c116 <- r116$coefficients
c117 <- r117$coefficients
c118 <- r118$coefficients
c119 <- r119$coefficients
c120 <- r120$coefficients
c121 <- r121$coefficients
c122 <- r122$coefficients
c123 <- r123$coefficients
c124 <- r124$coefficients
c125 <- r125$coefficients
c126 <- r126$coefficients
c127 <- r127$coefficients
c128 <- r128$coefficients
c129 <- r129$coefficients
c130 <- r130$coefficients
c131 <- r131$coefficients
c132 <- r132$coefficients
c133 <- r133$coefficients
c134 <- r134$coefficients
c135 <- r135$coefficients
c136 <- r136$coefficients
c137 <- r137$coefficients
c138 <- r138$coefficients
c139 <- r139$coefficients
c140 <- r140$coefficients
c141 <- r141$coefficients
c142 <- r142$coefficients
c143 <- r143$coefficients
c144 <- r144$coefficients
c145 <- r145$coefficients
c146 <- r146$coefficients
c147 <- r147$coefficients
c148 <- r148$coefficients
c149 <- r149$coefficients
c150 <- r150$coefficients
c151 <- r151$coefficients
c152 <- r152$coefficients
c153 <- r153$coefficients
c154 <- r154$coefficients
c155 <- r155$coefficients
c156 <- r156$coefficients
c157 <- r157$coefficients
c158 <- r158$coefficients
c159 <- r159$coefficients
c160 <- r160$coefficients
c161 <- r161$coefficients
c162 <- r162$coefficients
c163 <- r163$coefficients
c164 <- r164$coefficients
c165 <- r165$coefficients
c166 <- r166$coefficients
c167 <- r167$coefficients
c168 <- r168$coefficients
c169 <- r169$coefficients
c170 <- r170$coefficients
c171 <- r171$coefficients
c172 <- r172$coefficients
c173 <- r173$coefficients
c174 <- r174$coefficients
c175 <- r175$coefficients
c176 <- r176$coefficients
c177 <- r177$coefficients
c178 <- r178$coefficients
c179 <- r179$coefficients
c180 <- r180$coefficients
c181 <- r181$coefficients
c182 <- r182$coefficients
c183 <- r183$coefficients
c184 <- r184$coefficients
c185 <- r185$coefficients
c186 <- r186$coefficients
c187 <- r187$coefficients
c188 <- r188$coefficients
c189 <- r189$coefficients
c190 <- r190$coefficients
c191 <- r191$coefficients
c192 <- r192$coefficients
c193 <- r193$coefficients
c194 <- r194$coefficients
c195 <- r195$coefficients
c196 <- r196$coefficients
c197 <- r197$coefficients
c198 <- r198$coefficients
c199 <- r199$coefficients
c200 <- r200$coefficients

c201 <- r201$coefficients
c202 <- r202$coefficients
c203 <- r203$coefficients
c204 <- r204$coefficients
c205 <- r205$coefficients
c206 <- r206$coefficients
c207 <- r207$coefficients
c208 <- r208$coefficients
c209 <- r209$coefficients
c210 <- r210$coefficients
c211 <- r211$coefficients
c212 <- r212$coefficients
c213 <- r213$coefficients
c214 <- r214$coefficients
c215 <- r215$coefficients
c216 <- r216$coefficients
c217 <- r217$coefficients
c218 <- r218$coefficients
c219 <- r219$coefficients
c220 <- r220$coefficients
c221 <- r221$coefficients
c222 <- r222$coefficients
c223 <- r223$coefficients
c224 <- r224$coefficients
c225 <- r225$coefficients
c226 <- r226$coefficients
c227 <- r227$coefficients
c228 <- r228$coefficients
c229 <- r229$coefficients
c230 <- r230$coefficients
c231 <- r231$coefficients
c232 <- r232$coefficients
c233 <- r233$coefficients
c234 <- r234$coefficients
c235 <- r235$coefficients
c236 <- r236$coefficients
c237 <- r237$coefficients
c238 <- r238$coefficients
c239 <- r239$coefficients
c240 <- r240$coefficients
c241 <- r241$coefficients
c242 <- r242$coefficients
c243 <- r243$coefficients
c244 <- r244$coefficients
c245 <- r245$coefficients
c246 <- r246$coefficients
c247 <- r247$coefficients
c248 <- r248$coefficients
c249 <- r249$coefficients
c250 <- r250$coefficients
c251 <- r251$coefficients
c252 <- r252$coefficients
c253 <- r253$coefficients
c254 <- r254$coefficients
c255 <- r255$coefficients
c256 <- r256$coefficients
c257 <- r257$coefficients
c258 <- r258$coefficients
c259 <- r259$coefficients
c260 <- r260$coefficients
c261 <- r261$coefficients
c262 <- r262$coefficients
c263 <- r263$coefficients
c264 <- r264$coefficients
c265 <- r265$coefficients
c266 <- r266$coefficients
c267 <- r267$coefficients
c268 <- r268$coefficients
c269 <- r269$coefficients
c270 <- r270$coefficients
c271 <- r271$coefficients
c272 <- r272$coefficients
c273 <- r273$coefficients
c274 <- r274$coefficients
c275 <- r275$coefficients
c276 <- r276$coefficients
c277 <- r277$coefficients
c278 <- r278$coefficients
c279 <- r279$coefficients
c280 <- r280$coefficients
c281 <- r281$coefficients
c282 <- r282$coefficients
c283 <- r283$coefficients
c284 <- r284$coefficients
c285 <- r285$coefficients
c286 <- r286$coefficients
c287 <- r287$coefficients
c288 <- r288$coefficients
c289 <- r289$coefficients
c290 <- r290$coefficients
c291 <- r291$coefficients
c292 <- r292$coefficients
c293 <- r293$coefficients
c294 <- r294$coefficients
c295 <- r295$coefficients
c296 <- r296$coefficients
c297 <- r297$coefficients
c298 <- r298$coefficients
c299 <- r299$coefficients
c300 <- r300$coefficients

big.reg <- as.data.frame(rbind(c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,
                               c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,
                               c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,
                               c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,
                               c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,
                               c51,c52,c53,c54,c55,c56,c57,c58,c59,c60,
                               c61,c62,c63,c64,c65,c66,c67,c68,c69,c70,
                               c71,c72,c73,c74,c75,c76,c77,c78,c79,c80,
                               c81,c82,c83,c84,c85,c86,c87,c88,c89,c90,
                               c91,c92,c93,c94,c95,c96,c97,c98,c99,c100,
                               c101,c102,c103,c104,c105,c106,c107,c108,c109,c110,
                               c111,c112,c113,c114,c115,c116,c117,c118,c119,c120,
                               c121,c122,c123,c124,c125,c126,c127,c128,c129,c130,
                               c131,c132,c133,c134,c135,c136,c137,c138,c139,c140,
                               c141,c142,c143,c144,c145,c146,c147,c148,c149,c150,
                               c151,c152,c153,c154,c155,c156,c157,c158,c159,c160,
                               c161,c162,c163,c164,c165,c166,c167,c168,c169,c170,
                               c171,c172,c173,c174,c175,c176,c177,c178,c179,c180,
                               c181,c182,c183,c184,c185,c186,c187,c188,c189,c190,
                               c191,c192,c193,c194,c195,c196,c197,c198,c199,c200,
                               c201,c202,c203,c204,c205,c206,c207,c208,c209,c210,
                               c211,c212,c213,c214,c215,c216,c217,c218,c219,c220,
                               c221,c222,c223,c224,c225,c226,c227,c228,c229,c230,
                               c231,c232,c233,c234,c235,c236,c237,c238,c239,c240,
                               c241,c242,c243,c244,c245,c246,c247,c248,c249,c250,
                               c251,c252,c253,c254,c255,c256,c257,c258,c259,c260,
                               c261,c262,c263,c264,c265,c266,c267,c268,c269,c270,
                               c271,c272,c273,c274,c275,c276,c277,c278,c279,c280,
                               c281,c282,c283,c284,c285,c286,c287,c288,c289,c290,
                               c291,c292,c293,c294,c295,c296,c297,c298,c299,c300))

##lm(big.reg$ID ~ ed.value)

plot(big.reg$ID,ed.value,xlab="Item Slope (Rating Value ~ Category Rated)", 
     ylab="Edwards Scale Value")

paper <- cbind(big.reg,ed.value)

try <- lm(ed.value~ID, paper)

slope <-  as.vector(coef(try)[2]) 


