## Isolating 15 Study 2 items from Study 1 paper/pencil responses (run .Rmd through `Figure 2` chunk first)

##LINEAR: make friends easily, get angry easily, often feel blue, sympathize with the homeless, get irritated easily
friends <- form12[8:12]; names(friends) <- c("friends_1", "friends_2", "friends_3", "friends_4", "friends_5")
angry <- form12[28:32]; names(angry) <- c("angry_1", "angry_2", "angry_3", "angry_4", "angry_5")
blue <- form12[53:57]; names(blue) <- c("blue_1", "blue_2", "blue_3", "blue_4", "blue_5")
simp <- form12[143:147]; names(simp) <- c("simp_1", "simp_2", "simp_3", "simp_4", "simp_5")
irritated <- form12[178:182]; names(irritated) <- c("irritated_1", "irritated_2", "irritated_3", "irritated_4", "irritated_5")

##ASSYM: worry about things, trust others, take charge, am easy to satisfy, love excitement
worry <- form12[3:7]; names(worry) <- c("worry_1", "worry_2", "worry_3", "worry_4", "worry_5")
trust <- form12[18:22]; names(trust) <- c("trust_1", "trust_2", "trust_3", "trust_4", "trust_5")
charge <- form12[58:62]; names(charge) <- c("charge_1", "charge_2", "charge_3", "charge_4", "charge_5")
satisfy <- form12[93:97]; names(satisfy) <- c("satisfy_1", "satisfy_2", "satisfy_3", "satisfy_4", "satisfy_5")
excite <- form12[108:112]; names(excite) <- c("excite_1", "excite_2", "excite_3", "excite_4", "excite_5")

##QUASI: am always busy, enjoy wild flights of fantasy, am always on the go, am relaxed most of the time, am a creature of habit
busy <- form12[83:87]; names(busy) <- c("busy_1", "busy_2", "busy_3", "busy_4", "busy_5")
enjoy <- form12[163:167]; names(enjoy) <- c("enjoy_1", "enjoy_2", "enjoy_3", "enjoy_4", "enjoy_5")
go <- form12[233:237]; names(go) <- c("go_1", "go_2", "go_3", "go_4", "go_5")
relaxed <- form78[3:7]; names(relaxed) <- c("relaxed_1", "relaxed_2", "relaxed_3", "relaxed_4", "relaxed_5")
habit <- form78[238:242]; names(habit) <- c("habit_1", "habit_2", "habit_3", "habit_4", "habit_5")

old15 <- gdata::cbindX(friends, angry, blue, simp, irritated,
               worry, trust, charge, satisfy, excite,
               busy, enjoy, go, relaxed, habit)

write.csv(old15, "old15.csv")


