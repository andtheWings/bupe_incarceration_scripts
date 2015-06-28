
*Age

tabstat BC2 if drugtx ==1, statistics( mean p50 sd ) by(BC31)
histogram BC2 if drugtx==1, by(BC31)
ttest BC2 if drugtx==1, by(BC31) unequal

*Male

tabulate BC8, generate(gender)
by BC31, sort: fre gender1 if drugtx==1
prtest gender1 if drugtx==1, by(BC31)

*Race/Ethnicity

tabulate racemd, generate(ethrace)

prtest ethrace1 if drugtx==1, by(BC31)
prtest ethrace2 if drugtx==1, by(BC31)
prtest ethrace3 if drugtx==1, by(BC31)
prtest ethrace4 if drugtx==1, by(BC31)
prtest ethrace5 if drugtx==1, by(BC31)

*High school diploma or equivalency

recode BC10 (1 = 0) (2 =0) (3=1) (4=1) (5=1) (6=1), generate(hsdiploma)
label variable hsdiploma "Does person have at a least a high school diploma or equivalent?"

by BC31, sort: fre hsdiploma if drugtx==1
prtest hsdiploma if drugtx==1, by(BC31)

*Inject drugs ever?

tab BC103R, generate(injectheroin)
drop injectheroin1 injectheroin2 injectheroin3 injectheroin6 injectheroin7 injectheroin8
rename injectheroin4 injectheroin1
rename injectheroin5 injectheroin2

tab BC104R, generate(injectmethadone)
drop injectmethadone1 injectmethadone2 injectmethadone4 injectmethadone5
rename injectmethadone3 injectmethadone

tab BC105R, generate(injectotherpk)
drop injectotherpk1 injectotherpk2 injectotherpk3 injectotherpk6 injectotherpk7 injectotherpk8
rename injectotherpk4 injectotherpk1
rename injectotherpk5 injectotherpk2

tab BC108R, generate(injectcocaine)
drop injectsedative2 injectcocaine1 injectcocaine2 injectcocaine3 injectcocaine6 injectcocaine7
rename injectcocaine4 injectcocaine1
rename injectcocaine5 injectcocaine2

tab BC109R, generate(injectamph)
drop injectamph1 injectamph2 injectamph3 injectamph6 injectamph7
rename injectamph4 injectamph1
rename injectamph5 injectamph2

tab BC111R, generate(injecthalluc)
drop injecthalluc1 injecthalluc2 injecthalluc4 injecthalluc5
rename injecthalluc3 injecthalluc

tab BC112R, generate(injectinhal)
drop injectinhal1 injectinhal2 injectinhal3 injectinhal5 injectinhal6 injectinhal7
rename injectinhal4 injectinhal

tab BC107R, generate(injectsedative)
drop injectsedative1 injectsedative2 injectsedative5 injectsedative6
rename injectsedative3 injectsedative1
rename injectsedative4 injectsedative2

recode injectsedative2 injectsedative1 injectinhal injecthalluc injectamph2 injectamph1 injectcocaine2 injectcocaine1 injectotherpk2 injectotherpk1 injectmethadone injectheroin2 injectheroin1 (. = 0) (0=0)(1=1)

generate numinjectdrugs =  injectheroin1+ injectheroin2+ injectmethadone+ injectotherpk1+ injectotherpk2+ injectcocaine1+ injectcocaine2+ injectamph1+ injectamph2+ injecthalluc+ injectinhal+ injectsedative1+ injectsedative2
label variable numinjectdrugs "How many drugs does person inject?"

recode numinjectdrugs (0 = 0) (1 =1) (2=1) (3=1) (4=1) (5=1), generate(injectdrugs)
label variable injectdrugs "Does person inject any drugs?"

by BC31, sort: fre injectdrugs if drugtx == 1
prtest injectdrugs if drugtx==1, by(BC31)