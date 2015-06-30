
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

*English is primary language

tabulate BC6, generate(english)
drop english2 
rename english1 english

by BC31, sort: fre english if drugtx==1
prtest english if drugtx==1, by(BC31)

*Married

by BC31, sort: fre Married if drugtx==1
prtest Married if drugtx==1, by(BC31)

*Heterosexual

tabulate BC9, generate(heterosexual)
drop heterosexual2 heterosexual3 heterosexual4 
rename heterosexual1 heterosexual

by BC31, sort: fre heterosexual if drugtx==1
prtest heterosexual if drugtx==1, by(BC31)

*Employed

tabulate BC11, generate(employed)
drop employed1 
rename employed2 employed

by BC31, sort: fre employed if drugtx==1
prtest employed if drugtx==1, by(BC31)

*Self-reported homelessness

by BC31, sort: fre BC14 if drugtx==1
prtest BC14 if drugtx==1, by(BC31)

*Recent drug use

generate recentalcintox = .
generate recentheroin = .
generate recentmethad = .
generate otheranalg = .
generate recentbarb = .
generate recentseda = .
generate recentcocaine = .
generate recentamph = .
generate recentmarij = .
generate recenthalluc = .
generate recentinhal = .

replace recentalcintox = 0 if BC102D == 0
replace recentalcintox = 1 if BC102D > 0

replace recentheroin = 0 if BC103D == 0
replace recentheroin = 1 if BC103D > 0

replace recentmethad = 0 if BC104D == 0
replace recentmethad = 1 if BC104D > 0

replace otheranal = 0 if BC105D == 0
replace otheranal = 1 if BC105D > 0

replace recentbarb = 0 if BC106D == 0
replace recentbarb = 1 if BC106D > 0

replace recentseda = 0 if BC107D == 0
replace recentseda = 1 if BC107D > 0

replace recentcocaine = 0 if BC108D == 0
replace recentcocaine = 1 if BC108D > 0

replace recentamph = 0 if BC109D == 0
replace recentamph = 1 if BC109D > 0

replace recentmarij = 0 if BC110D == 0
replace recentmarij = 1 if BC110D > 0

replace recenthalluc = 0 if BC111D == 0
replace recenthalluc = 1 if BC111D > 0

replace recentinhal = 0 if BC112D == 0
replace recentinhal = 1 if BC112D > 0

by BC31, sort: fre recentalcintox if drugtx==1
by BC31, sort: fre recentheroin if drugtx==1
by BC31, sort: fre recentmethad if drugtx==1
by BC31, sort: fre otheranal if drugtx==1
by BC31, sort: fre recentbarb if drugtx==1
by BC31, sort: fre recentseda if drugtx==1
by BC31, sort: fre recentcocaine if drugtx==1
by BC31, sort: fre recentamph if drugtx==1
by BC31, sort: fre recentmarij if drugtx==1
by BC31, sort: fre recenthalluc if drugtx==1
by BC31, sort: fre recentinhal if drugtx==1

prtest recentalcintox if drugtx==1, by(BC31)
prtest recentheroin if drugtx==1, by(BC31)
prtest recentmethad if drugtx==1, by(BC31)
prtest otheranal if drugtx==1, by(BC31)
prtest recentbarb if drugtx==1, by(BC31)
prtest recentseda if drugtx==1, by(BC31)
prtest recentcocaine if drugtx==1, by(BC31)
prtest recentamph if drugtx==1, by(BC31)
prtest recentmarij if drugtx==1, by(BC31)
prtest recenthalluc if drugtx==1, by(BC31)
prtest recentinhal if drugtx==1, by(BC31)

*Lives alone

clonevar alone = BC18A
recode alone (0=0) (1=1) (8=.)
by BC31, sort: fre alone if drugtx==1
prtest alone if drugtx==1, by(BC31)

*Social support index

histogram bsupport if drugtx==1, by(BC31)
ranksum bsupport if drugtx==1, by(BC31)
median bsupport if drugtx==1, by(BC31) exact medianties(split)
by BC31, sort : summarize bsupport if drugtx==1, detail

*Self-reported current health status

histogram BC74 if drugtx==1, by(BC31)
tabstat BC74 if drugtx ==1, statistics( mean p50 sd ) by(BC31)
ttest BC74 if drugtx==1, by(BC31) unequal

*Short form health survey

histogram sf12_GH if drugtx==1, by(BC31)
histogram sf12_PF if drugtx==1, by(BC31)
histogram sf12_RP if drugtx==1, by(BC31)
histogram sf12_BP if drugtx==1, by(BC31)
histogram sf12_VT if drugtx==1, by(BC31)
histogram sf12_SF if drugtx==1, by(BC31)
histogram sf12_RE if drugtx==1, by(BC31)
histogram sf12_MH if drugtx==1, by(BC31)

ttest sf12_GH if drugtx==1, by(BC31) unequal
ttest sf12_PF if drugtx==1, by(BC31) unequal
ttest sf12_RP if drugtx==1, by(BC31) unequal
ttest sf12_BP if drugtx==1, by(BC31) unequal
ttest sf12_VT if drugtx==1, by(BC31) unequal
ttest sf12_SF if drugtx==1, by(BC31) unequal
ttest sf12_RE if drugtx==1, by(BC31) unequal
ttest sf12_MH if drugtx==1, by(BC31) unequal

*Brief symptom inventory - anxiety

histogram BCIAnx if drugtx==1, by(BC31)
by BC31, sort : summarize BCIAnx if drugtx==1, detail
ranksum BCIAnx if drugtx==1, by(BC31)

*CES-D

histogram CESD if drugtx==1, by(BC31)
summarize CESD, detail
ttest CESD if drugtx==1, by(BC31)

*Ever diagnosed with mental illness

clonevar diagmentalill = BC91
recode diagmentalill (0=0) (1=1) (.=.) (8=.)
by BC31, sort: fre diagmentalill if drugtx==1
prtest diagmentalill if drugtx==1, by(BC31)

*Ever hospitalized for mental health issue

clonevar psychhosp = BC95
recode psychhosp (0=0) (1=1) (.=.) (8=.)
by BC31, sort: fre psychhosp if drugtx==1
prtest psychhosp if drugtx==1, by(BC31)

*Ready to make a change in opioid use, index

histogram readychange if drugtx==1, by(BC31)
median readychange if drugtx==1, by(BC31) exact medianties(split)
ranksum readychange if drugtx==1, by(BC31)
by BC31, sort : summarize readychange if drugtx==1, detail

*Number of times overdosed on drugs

histogram BC115 if drugtx==1, by(BC31)
by BC31, sort : summarize BC115 if drugtx==1, detail
ranksum BC115 if drugtx==1, by(BC31)

