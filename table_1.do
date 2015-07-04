*This table reports variables only investigated in the baseline interview 
*or variables with "ever" in the baseline interview's question stem. The table only includes
*subjects who were treated with buprenorphine at any point in the study. It sorts
*by whether individuals had ever been incarcerated greater than 3 days 
*before or during the study.

label define no_yes 0 "no" 1 "yes"
label values bc31 no_yes

*''Age''
* Person who refused to answer was coded as 99, value was recoded to .

fre bc2
list pid if bc2==99
replace bc2 = . in 322

histogram bc2 if everbupe>0, by(everincarall)
ttest bc2 if everbupe>0, by(everincarall) unequal

*''Race/Ethnicity''

fre racemd
tab racemd bc3
tab racemd, generate(ethrace)
tab racemd ethrace1
tab racemd ethrace2
tab racemd ethrace3
tab racemd ethrace4
tab racemd ethrace5

rename ethrace1 white
rename ethrace2 black
rename ethrace3 latino
rename ethrace4 asian
rename ethrace5 otherrace

by everincarall, sort: fre white if everbupe>0
by everincarall, sort: fre black if everbupe>0
by everincarall, sort: fre latino if everbupe>0
by everincarall, sort: fre asian if everbupe>0
by everincarall, sort: fre otherrace if everbupe>0

prtest white if everbupe>0, by(everincarall)
prtest black if everbupe>0, by(everincarall)
prtest latino if everbupe>0, by(everincarall)
prtest asian if everbupe>0, by(everincarall)
prtest otherrace if everbupe>0, by(everincarall)

*''English as primary language''
* About half of latinos claim Spanish as primary language and other half claim English.

label define bc6 1 "english" 2 "spanish"
label values bc6 bc6

fre bc6
tab bc6 bc3

tab bc6, generate(english)
drop english2 
rename english1 english
tab english bc6

by everincarall, sort: fre english if everbupe>0
prtest english if everbupe>0, by(everincarall)

*''Male''

label define bc8 1 "male" 2 "female" 3 "transgender"
label values bc8 bc8

fre bc8
tab bc8, generate(gender)
tab bc8 gender1

by everincarall, sort: fre gender1 if everbupe>0
prtest gender1 if everbupe>0, by(everincarall)

*''Heterosexual''
* Majority of heterosexual men said they did not get HIV from sex with men (5/254 said they did)
* Majority of heterosexual women said they did not get HIV from sex with women (3/113 said they did)

label define bc9 1 "straight/heterosexual" 2 "gay/lesbian/homosexual" 3 "bisexual" 8 "don't know"
label values bc9 bc9

fre bc9
tab bc9 bc40a if gender1==1
tab bc9 bc40b if gender2==1

tabulate bc9, generate(heterosexual)
drop heterosexual2 heterosexual3 heterosexual4 
rename heterosexual1 heterosexual
tab heterosexual bc9

by everincarall, sort: fre heterosexual if everbupe>0
prtest heterosexual if everbupe>0, by(everincarall)

*''Married''
* Interesting results:
*  Some people "married or living with partner" say they are not living with partner
*  Small amount of people "separate" or "divorced" say they are living with partner

label define bc7 1 "never married" 2 "married or living with partner" 3 "separated" 4 "divorced" 5 "widowed"
label values bc7 bc7

fre bc7
tab bc7 bc18b

tab bc7, generate(married)
drop married1 married3 married4 married5 
rename married2 married
tab married bc7

by everincarall, sort: fre married if everbupe>0
prtest married if everbupe>0, by(everincarall)

*''Lives alone''
* 	2 of 109 people who reported living alone (bc18) said they stayed with family/friends
*	These individuals kept in alone category.
*	3 of 113 people who reported living alone (bc18) said they were responsible
*	for daily care of children. Individuals kept in alone category.

tab bc15 bc18a
tab bc20 bc18a

clonevar alone = bc18a
recode alone (0=0) (1=1) (8=.)
tab alone bc15

by everincarall, sort: fre alone if everbupe>0
prtest alone if everbupe>0, by(everincarall)

*''High school diploma or equivalency''

label define bc10 1 "8th grade or less" 2 "some high school" 3 "GED" 4 "high school graduate" 5 "some college" 6 "college graduate"
label values bc10 bc10

fre bc10
recode bc10 (1 = 0) (2 =0) (3=1) (4=1) (5=1) (6=1), generate(hsdiploma)
label variable hsdiploma "Does person have at a least a high school diploma or equivalent?"
tab bc10 hsdiploma

by everincarall, sort: fre hsdiploma if everbupe>0
prtest hsdiploma if everbupe>0, by(everincarall)

*Ever diagnosed with mental illness

clonevar diagmentalillbase = bc91

recode diagmentalillbase (0=0) (1=1) (.=0) (8=0)

by everincarall, sort: fre diagmentalillbase if everbupe>0
prtest diagmentalillbase if everbupe>0, by(everincarall)

*Inject drugs ever?
*	37 of 152 people who did not report injection as typical route of administration for drug
*	use reported that injecting drugs was likely reason for acquiring HIV (bc40C). These people were
*	added to the "injectdrugs" variable.
*		27 of 115 people who did not report injection as typical route of administration
*		and did not report injecting drugs as likely means of acquiring HIV
*		reported sharing a needle (ShareNd). These people were added to the injectdrugs variable.

tab bc103r, generate(injectheroin)
drop injectheroin1 injectheroin2 injectheroin3 injectheroin6 injectheroin7 injectheroin8
rename injectheroin4 injectheroin1
rename injectheroin5 injectheroin2

tab bc104r, generate(injectmethadone)
drop injectmethadone1 injectmethadone2 injectmethadone4 injectmethadone5
rename injectmethadone3 injectmethadone

tab bc105r, generate(injectotherpk)
drop injectotherpk1 injectotherpk2 injectotherpk3 injectotherpk6 injectotherpk7 injectotherpk8
rename injectotherpk4 injectotherpk1
rename injectotherpk5 injectotherpk2

tab bc108r, generate(injectcocaine)
drop injectcocaine1 injectcocaine2 injectcocaine3 injectcocaine6 injectcocaine7
rename injectcocaine4 injectcocaine1
rename injectcocaine5 injectcocaine2

tab bc109r, generate(injectamph)
drop injectamph1 injectamph2 injectamph3 injectamph6 injectamph7
rename injectamph4 injectamph1
rename injectamph5 injectamph2

tab bc111r, generate(injecthalluc)
drop injecthalluc1 injecthalluc2 injecthalluc4 injecthalluc5
rename injecthalluc3 injecthalluc

tab bc112r, generate(injectinhal)
drop injectinhal1 injectinhal2 injectinhal3 injectinhal5 injectinhal6 injectinhal7
rename injectinhal4 injectinhal

tab bc107r, generate(injectsedative)
drop injectsedative1 injectsedative2 injectsedative5 injectsedative6
rename injectsedative3 injectsedative1
rename injectsedative4 injectsedative2

recode injectsedative2 injectsedative1 injectinhal injecthalluc injectamph2 injectamph1 injectcocaine2 injectcocaine1 injectotherpk2 injectotherpk1 injectmethadone injectheroin2 injectheroin1 (. = 0) (0=0)(1=1)

generate numinjectdrugs =  injectheroin1+ injectheroin2+ injectmethadone+ injectotherpk1+ injectotherpk2+ injectcocaine1+ injectcocaine2+ injectamph1+ injectamph2+ injecthalluc+ injectinhal+ injectsedative1+ injectsedative2
label variable numinjectdrugs "How many drugs does person inject?"

recode numinjectdrugs (0 = 0) (1 =1) (2=1) (3=1) (4=1) (5=1), generate(injectdrugs)
label variable injectdrugs "Does person inject any drugs?"

tab injectdrugs bc40c
recode injectdrugs (0=1) (1=1) (.=.) if bc40c==1

tab injectdrugs sharend
recode injectdrugs (0=1) (1=1) (.=.) if sharend==1

by everincarall, sort: fre injectdrugs if drugtx == 1
prtest injectdrugs if everbupe>0, by(everincarall)

*Ever use drugs?

generate everalcintox = .
generate everheroin = .
generate evermethadone = .
generate everotherpk = .
generate eversedative = .
generate evercocaine = .
generate evermarijuana = .

replace everalcintox = 0 if bc102y == 0
replace everalcintox = 1 if bc102y > 0

replace everheroin = 0 if bc103y == 0
replace everheroin = 1 if bc103y > 0

replace evermethadone = 0 if bc104y == 0
replace evermethadone = 1 if bc104y > 0

replace everotherpk = 0 if bc105y == 0
replace everotherpk = 1 if bc105y > 0

replace eversedative = 0 if bc107y == 0
replace eversedative = 1 if bc107y > 0

replace evercocaine = 0 if bc108y == 0
replace evercocaine = 1 if bc108y > 0

replace evermarijuana = 0 if bc110y == 0
replace evermarijuana = 1 if bc110y > 0

by everincarall, sort: fre everalcintox if everbupe>0
prtest everalcintox if everbupe>0, by(everincarall)

by everincarall, sort: fre everheroin if everbupe>0
prtest everheroin if everbupe>0, by(everincarall)

by everincarall, sort: fre evermethadone if everbupe>0
prtest evermethadone if everbupe>0, by(everincarall)

by everincarall, sort: fre everotherpk if everbupe>0
prtest everotherpk if everbupe>0, by(everincarall)

by everincarall, sort: fre eversedative if everbupe>0
prtest eversedative if everbupe>0, by(everincarall)

by everincarall, sort: fre evercocaine if everbupe>0
prtest evercocaine if everbupe>0, by(everincarall)

by everincarall, sort: fre evermarijuana if everbupe>0
prtest evermarijuana if everbupe>0, by(everincarall)
