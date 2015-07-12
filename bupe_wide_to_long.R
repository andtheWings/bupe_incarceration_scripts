library(foreign)

bupe.wide <- read.csv("longitudinal_wide3.csv")

bupe.wide <- data.frame(bupe.wide$pid, bupe.wide$qc17_1,bupe.wide$qc17_2, 
               bupe.wide$qc17_3, bupe.wide$qc17_4,bupe.wide$qc17_5, 
               bupe.wide$qc17_6, bupe.wide$visit_1, bupe.wide$visit_2, 
               bupe.wide$visit_3, bupe.wide$visit_4, bupe.wide$visit_5,
               bupe.wide$visit_6)

bupe.long <- reshape(bupe.wide, 
                     varying=c("bupe.wide.qc17_1","bupe.wide.qc17_2", 
                               "bupe.wide.qc17_3", "bupe.wide.qc17_4", 
                               "bupe.wide.qc17_5", "bupe.wide.qc17_6",
                               "bupe.wide.visit_1", "bupe.wide.visit_2",
                               "bupe.wide.visit_3", "bupe.wide.visit_4",
                               "bupe.wide.visit_5", "bupe.wide.visit_6"),
                     timevar="visit_number",
                     idvar="pid",
                     direction="long",
                     sep="_")

write.table(bupe.long, file="bupe.long.csv", sep=",")