*Drug treatment

label define drugtx 1 "Bupe" 2 "Methadone" 3 "Other Tx" 4 "Unknown"
label values drugtx drugtx

*Criminal justice status

label define no_yes 0 "no" 1 "yes" 8 "don't know" .a "don't know"
label values bc29 no_yes
label values bc31 no_yes
label values qc16_1 no_yes
label values qc16_2 no_yes
label values qc16_3 no_yes
label values qc16_4 no_yes

clonevar everincar_base = bc31

generate recentincar_base=.
replace recentincar_base=0 if bc32==0
replace recentincar_base = 1 if bc32>0

clonevar parole_base = bc29
replace parole_base=.a if bc29==8

*Treatment retention

generate retention4q = .
replace retention4q=1 if dtxq1==1 & dtxq2==1 & dtxq3==1 & dtxq4==1
replace retention4q=0 if dtxq1!=1 | dtxq2!=1 | dtxq3!=1 | dtxq4!=1
replace retention4q=. if dtxq1==. | dtxq2==. | dtxq3==. | dtxq4==.

*Visit quarter coding

label variable visit_1 "Number of months since baseline for follow-up 1"
label variable visit_2 "Number of months since baseline for follow-up 2"
label variable visit_3 "Number of months since baseline for follow-up 3"
label variable visit_4 "Number of months since baseline for follow-up 4"
label variable visit_5 "Number of months since baseline for follow-up 5"
label variable visit_6 "Number of months since baseline for follow-up 6"

*Age

clonevar age = bc2
fre age
replace bc2=. if bc2==99

*Race/ethnicity

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

generate asian_and_other = .
replace asian_and_other = 1 if asian==1 | otherrace==1
replace asian_and_other = 0 if asian==0 & otherrace==0

*Primary language
* About half of latinos claim Spanish as primary language and other half claim English.

label define bc6 1 "english" 2 "spanish"
label values bc6 bc6

fre bc6
tab bc6 bc3

tab bc6, generate(english)
drop english2 
rename english1 english
tab english bc6

*Gender

label define bc8 1 "male" 2 "female" 3 "transgender"
label values bc8 bc8

fre bc8
tab bc8, generate(gender)
rename gender1 male
tab bc8 male

*Sexual Orientation
* Majority of heterosexual men said they did not get HIV from sex with men (5/254 said they did)
* Majority of heterosexual women said they did not get HIV from sex with women (3/113 said they did)

label define bc9 1 "straight/heterosexual" 2 "gay/lesbian/homosexual" 3 "bisexual" 8 "don't know"
label values bc9 bc9

fre bc9
tab bc9 bc40a if male==1
tab bc9 bc40b if gender2==1

tabulate bc9, generate(heterosexual)
drop heterosexual2 heterosexual3 heterosexual4 
rename heterosexual1 heterosexual
tab heterosexual bc9

*Married
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

*Lives alone
* 	2 of 109 people who reported living alone (bc18) said they stayed with family/friends
*	These individuals kept in alone category.
*	3 of 113 people who reported living alone (bc18) said they were responsible
*	for daily care of children. Individuals kept in alone category.

tab bc15 bc18a
tab bc20 bc18a

clonevar alone = bc18a
recode alone 8=.
tab alone bc15

*Homelessness
*	9 of 112 people who reported they were homeless (bc14) also reported that they
*	rented an apartment or house. Individuals kept in homeless category.

label values bc14 no_yes
clonevar homeless = bc14
replace homeless=.a if bc14==8

label define bc15 1 "homeless (living on the street, in a park, in a bus station, etc)" 2 "in a shelter" 3 "transitional (time-limited) single-room occupancy hotel" 4 "permanent single-room occupancy hotel" 5 "HIV/AIDS housing/group home" 6 "drug treatment facility" 7 "other residential facility or institution (e.g. healthcare facility or halfway house)" 8 "staying with family/friends" 9 "rent and apartment/house (alone or with others)" 10 "own my home" 11 "other" 88 "don't know" 99 "refused" .a "don't know" .b "refused"
label values bc15 bc15
replace bc15=.a if bc15==88
replace bc15=.b if bc15==99

tab homeless bc15

*High school diploma or more

label define bc10 1 "8th grade or less" 2 "some high school" 3 "GED" 4 "high school graduate" 5 "some college" 6 "college graduate"
label values bc10 bc10

fre bc10
recode bc10 1/2=0 3/6=1, generate(hsdiploma)
label variable hsdiploma "Does person have at a least a high school diploma or equivalent?"
tab bc10 hsdiploma

*Employed
*	1 of 103 people who reported they were employed (bc11) was listed as "does not apply"
*	under variable for type of paid work (bc12). Individual kept in.

label define bc12 1 "full-time (35 hours/week or more)" 2 "part-time (less than 35 hours/week, on regular basis)" 3 "occasional work" 7 "does not apply" 9 "refused"
label values bc12 bc12

tab bc11 bc12
list pid if bc12==7 & bc11==1

tabulate bc11, generate(employed)
drop employed1 
rename employed2 employed

*Years since HIV diagnosis

generate sincediagnosis=bcidy-bc39y
replace sincediagnosis=.a if sincediagnosis<0
label define sincediagnosis .a "don't know"
label values sincediagnosis sincediagnosis

*Lowest CD4 count
*  **Note** this must be evaluated in the master baseline dataset

*clonevar lowestcd4 = BC41
*fre lowestcd4
*recode lowestcd4 8=.a 9=.b

*Ever diagnosed with mental illness

clonevar mentaldiag = bc91
fre mentaldiag
recode mentaldiag 8=.a

*Depression Scale
*  Adjusted scale to values ranging from 0-3 as with CES-D and reversed questions 5 and 8.
*  Counted number of missing answers in order to exclude those that had more than 20% missing.
*  Took average of depression question responses and standardized to a 0-100 scale.

clonevar depression1 = bc81
clonevar depression2 = bc82
clonevar depression3 = bc83
clonevar depression4 = bc84
clonevar depression5 = bc85
clonevar depression6 = bc86
clonevar depression7 = bc87
clonevar depression8 = bc88
clonevar depression9 = bc89
clonevar depression10 = bc90

recode depression1 depression2 depression3 depression4 depression6 depression7 depression9 depression10 (1=0)(2=1)(3=2)(4=3)
tab depression1 bc81
recode depression5 depression8 (4=0)(3=1)(2=2)(1=3)
tab depression5 bc85

egen float cesdmissing = rowmiss(depression1 depression2 depression3 depression4 depression5 depression6 depression7 depression8 depression9 depression10)
egen float cesdmean = rowmean(depression1 depression2 depression3 depression4 depression5 depression6 depression7 depression8 depression9 depression10) if cesdmissing < 3
generate cesdstandardmean = cesdmean/3*100
label variable cesdstandardmean "Standardized depression score, 0 = minimally depressed and 100 = very depressed"

*Ready to make change in heroin use

*clonevar readytochange = bc100
*replace readytochange = . if bc100==88 | bc100==80 | bc100==65

*Alcohol use composite score
*  Cloned questions pertaining to the ASI composite score for alcohol use
*  Divided question scores by their highest possible answers
*  Counted number of missing answers for each subject in order to exclude those that had more than 40% answers missing
*  Took average of alcohol question scores and standardized to a 0-100 scale

clonevar asialc1 = bc101d
fre asialc1
replace asialc1 = asialc1/30

clonevar asialc2 = bc102d
fre asialc2
replace asialc2 = . if asialc2==98 | asialc2==99
replace asialc2 = asialc2/30

clonevar asialc3 = bc123
fre asialc3
replace asialc3 = asialc3/30

clonevar asialc4 = bc124
fre asialc4
recode asialc4 (1=0)(2=1)(3=2)(4=3)(5=4)(7=.)(9=.)(.=.)
replace asialc4 = asialc4/4

clonevar asialc5 = bc125
fre asialc5
recode asialc5 (1=0)(2=1)(3=2)(4=3)(5=4)(7=.)(9=.)(.=.)
replace asialc5 = asialc5/4

egen float asialcmissing = rowmiss(asialc1 asialc2 asialc3 asialc4 asialc5)
egen float asialcscore = rowmean(asialc1 asialc2 asialc3 asialc4 asialc5) if asialcmissing<3 
replace asialcscore = asialcscore*100

*Drug use composite score
*  Cloned questions pertaining to the ASI composite score for drug use
*  Divided question scores by their highest possible answers
*  Counted number of missing answers for each subject in order to exclude those that had more than 20% answers missing
*  Took average of drug question scores and standardized to a 0-100 scale

clonevar asidrug1 = bc103d
fre asidrug1 
replace asidrug1 = . if bc103d==92
replace asidrug1 = asidrug1/30

clonevar asidrug2 = bc104d
fre asidrug2
replace asidrug2 = asidrug2/30

clonevar asidrug3 = bc105d
fre asidrug3 
replace asidrug3 = asidrug3/30

clonevar asidrug4 = bc106d
fre asidrug4
replace asidrug4 = asidrug4/30

clonevar asidrug5 = bc107d
fre asidrug5
replace asidrug5 = . if bc107d==98
replace asidrug5 = asidrug5/30

clonevar asidrug6 = bc108d
fre asidrug6
replace asidrug6 = asidrug6/30

clonevar asidrug7 = bc109d
fre asidrug7
replace asidrug7 = asidrug7/30

clonevar asidrug8 = bc110d
fre asidrug8
replace asidrug8 = asidrug8/30

clonevar asidrug9 = bc111d
fre asidrug9
replace asidrug9 = . if bc111d==98
replace asidrug9 = asidrug9/30

clonevar asidrug10 = bc112d
fre asidrug10
replace asidrug10 = . if bc112d==98
replace asidrug10 = asidrug10/30

clonevar asidrug11 = bc113d
fre asidrug11
replace asidrug11 = . if bc113d==98
replace asidrug11 = asidrug11/30

clonevar asidrug12 = bc126
fre asidrug12
replace asidrug12 = . if bc126==99
replace asidrug12 = asidrug12/30

clonevar asidrug13 = bc127
fre asidrug13
recode asidrug13 (1=0)(2=1)(3=2)(4=3)(5=4)(7=.)(9=.)(.=.)
replace asidrug13 = asidrug13/4

clonevar asidrug14 = bc128
fre asidrug14
recode asidrug14 (1=0)(2=1)(3=2)(4=3)(5=4)(7=.)(9=.)(.=.)
replace asidrug14 = asidrug14/4

egen float asidrugmissing = rowmiss(asidrug1 asidrug2 asidrug3 asidrug4 asidrug5 asidrug6 asidrug7 asidrug8 asidrug9 asidrug10 asidrug11 asidrug12 asidrug13 asidrug14)
egen float asidrugscore = rowmean(asidrug1 asidrug2 asidrug3 asidrug4 asidrug5 asidrug6 asidrug7 asidrug8 asidrug9 asidrug10 asidrug11 asidrug12 asidrug13 asidrug14) if asidrugmissing<3
replace asidrugscore = asidrugscore*100
label variable asidrugscore "Composite score for drug use"

*Inject drugs ever
*	37 of 152 people who did not report injection as typical route of administration for drug
*	use reported that injecting drugs was likely reason for acquiring HIV (bc40C). These people were
*	added to the "injectdrugs" variable.
*		27 of 115 people who did not report injection as typical route of administration
*		and did not report injecting drugs as likely means of acquiring HIV,
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
replace injectdrugs=1 if bc40c==1

tab injectdrugs sharend
replace injectdrugs=1 if sharend==1

*Ever use specific drugs

generate everalcintox = .
generate everheroin = .
generate evermethadone = .
generate everotherpk = .
generate eversedative = .
generate evercocaine = .
generate evermarijuana = .
generate everanyopioid = .

replace everalcintox = 0 if bc102y == 0
replace everalcintox = 1 if bc102y > 0

replace everheroin = 0 if bc103y == 0
replace everheroin = 1 if bc103y > 0

replace evermethadone = 0 if bc104y == 0
replace evermethadone = 1 if bc104y > 0

replace everotherpk = 0 if bc105y == 0
replace everotherpk = 1 if bc105y > 0

replace everanyopioid=0 if everheroin==0 & evermethadone==0 & everotherpk==0
replace everanyopioid=1 if everheroin==1 | evermethadone==1 | everotherpk==1

replace eversedative = 0 if bc107y == 0
replace eversedative = 1 if bc107y > 0

replace evercocaine = 0 if bc108y == 0
replace evercocaine = 1 if bc108y > 0

replace evermarijuana = 0 if bc110y == 0
replace evermarijuana = 1 if bc110y > 0

*Recent drug use
*	12.5% of those who reported zero years of regular alcohol use to intoxication, reported recent alcohol use to intoxication
*	15% of those who reported zero years of regular heroin use, reported recent heroin use
*	13.5% of those who reported zero years of regular methadone use, reported recent methadone use
*	11.0% of those who reported zero years of regular other painkiller use, reported recent other painkiller use
*	6.5% of those who reported zero years of regular sedative use, reported recent sedative use
*	12.1% of those who reported zero years of regular cocaine use, reported recent cocaine use
*	7.0% of those who reported zero years of regular marijuana use, reported recent marijuana use

generate recentalcintox = .
generate recentheroin = .
generate recentmethadone = .
generate recentotherpk = .
generate recentsedative = .
generate recentcocaine = .
generate recentmarijuana = .

replace recentalcintox = .a if bc102d==98
replace recentalcintox = .b if bc102d==99
replace recentalcintox = 0 if bc102d == 0
replace recentalcintox = 1 if bc102d > 0

replace recentheroin = .a if bc103d == 92
replace recentheroin = 0 if bc103d == 0
replace recentheroin = 1 if bc103d > 0

replace recentmethadone = 0 if bc104d == 0
replace recentmethadone = 0 if bc104d == 0
replace recentmethadone = 1 if bc104d > 0

replace recentotherpk = 0 if bc105d == 0
replace recentotherpk = 1 if bc105d > 0

replace recentsedative = .a if bc107d == 98
replace recentsedative = 0 if bc107d == 0
replace recentsedative = 1 if bc107d > 0

replace recentcocaine = 0 if bc108d == 0
replace recentcocaine = 1 if bc108d > 0

replace recentmarijuana = 0 if bc110d == 0
replace recentmarijuana = 1 if bc110d > 0

*Years of regular drug use
*    One subject is coded to have used heroin regularly for 55 years. However, the oldest subject in the study is 60. The
*    oldest subject would have needed to start using at age 5 in order to be regularly using for 55 years. Recoding the 55
*    observation as missing.

clonevar yearsheroin = bc103y
clonevar yearsmethadone = bc104y
clonevar yearsotherpk = bc105y

fre yearsheroin
fre yearsmethadone
fre yearsotherpk

recode yearsheroin 55=.a 99=.b
recode yearsmethadone 88=.a
recode yearsotherpk 88=.a

egen float years_any_opioid = rowmax(yearsheroin yearsmethadone yearsotherpk)
list yearsheroin yearsmethadone yearsotherpk years_any_opioid recentincar_base
label variable years_any_opioid "Longest number of years using either heroin, methadone, or other opioids"

*Number of times overdosed on drugs

clonevar overdosed = bc115
fre overdosed

*Number of times treated for drug use

fre bc118
clonevar treatedfordrugs = bc118
recode treatedfordrugs 999=.a

*Methadone treatment in previous three months

fre bc144
clonevar recentmethadonetx = bc144
recode recentmethadonetx 8=.a
