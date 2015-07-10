*''Employed''
*	1 of 103 people who reported they were employed (bc11) was listed as "does not apply"
*	under variable for type of paid work (bc12). Individual kept in.

label define bc12 1 "full-time (35 hours/week or more)" 2 "part-time (less than 35 hours/week, on regular basis)" 3 "occasional work" 7 "does not apply" 9 "refused"
label values bc12 bc12

tab bc11 bc12
list pid if bc12==7 & bc11==1

tabulate bc11, generate(employed)
drop employed1 
rename employed2 employed

by bc31, sort: fre employed if everbupe>0
prtest employed if everbupe>0, by(bc31)

*''Self-reported homelessness''
*	9 of 112 people who reported they were homeless (bc14) also reported that they
*	rented an apartment or house. Individuals kept in homeless category.

by bc31, sort: fre bc14 if everbupe>0
prtest bc14 if everbupe>0, by(bc31)





*Short form health survey

histogram sf12_GH if everbupe>0, by(bc31)
histogram sf12_PF if everbupe>0, by(bc31)
histogram sf12_RP if everbupe>0, by(bc31)
histogram sf12_BP if everbupe>0, by(bc31)
histogram sf12_VT if everbupe>0, by(bc31)
histogram sf12_SF if everbupe>0, by(bc31)
histogram sf12_RE if everbupe>0, by(bc31)
histogram sf12_MH if everbupe>0, by(bc31)

ttest sf12_GH if everbupe>0, by(bc31) unequal
ttest sf12_PF if everbupe>0, by(bc31) unequal
ttest sf12_RP if everbupe>0, by(bc31) unequal
ttest sf12_BP if everbupe>0, by(bc31) unequal
ttest sf12_VT if everbupe>0, by(bc31) unequal
ttest sf12_SF if everbupe>0, by(bc31) unequal
ttest sf12_RE if everbupe>0, by(bc31) unequal
ttest sf12_MH if everbupe>0, by(bc31) unequal

*Self-reported current health status 

histogram bc74 if everbupe>0, by(bc31)
ttest bc74 if everbupe>0, by(bc31) unequal


*''Recent drug use:''
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

replace recentalcintox = 0 if bc102d == 0
replace recentalcintox = 1 if bc102d > 0

replace recentheroin = 0 if bc103d == 0
replace recentheroin = 1 if bc103d > 0

replace recentmethadone = 0 if bc104d == 0
replace recentmethadone = 1 if bc104d > 0

replace recentotherpk = 0 if bc105d == 0
replace recentotherpk = 1 if bc105d > 0

replace recentsedative = 0 if bc107d == 0
replace recentsedative = 1 if bc107d > 0

replace recentcocaine = 0 if bc108d == 0
replace recentcocaine = 1 if bc108d > 0

replace recentmarijuana = 0 if bc110d == 0
replace recentmarijuana = 1 if bc110d > 0

tab recentalcintox everalcintox, column
tab recentheroin everheroin, column
tab recentmethadone evermethadone, column
tab recentotherpk everotherpk, column
tab recentsedative eversedative, column
tab recentcocaine evercocaine, column
tab recentmarijuana evermarijuana, column

by bc31, sort: fre recentalcintox if everbupe>0
by bc31, sort: fre recentheroin if everbupe>0
by bc31, sort: fre recentmethad if everbupe>0
by bc31, sort: fre otheranal if everbupe>0
by bc31, sort: fre recentseda if everbupe>0
by bc31, sort: fre recentcocaine if everbupe>0
by bc31, sort: fre recentmarij if everbupe>0

prtest recentalcintox if everbupe>0, by(bc31)
prtest recentheroin if everbupe>0, by(bc31)
prtest recentmethad if everbupe>0, by(bc31)
prtest otheranal if everbupe>0, by(bc31)
prtest recentseda if everbupe>0, by(bc31)
prtest recentcocaine if everbupe>0, by(bc31)
prtest recentmarij if everbupe>0, by(bc31)



*Social support index

histogram bsupport if everbupe>0, by(bc31)
ranksum bsupport if everbupe>0, by(bc31)
median bsupport if everbupe>0, by(bc31) exact medianties(split)
by bc31, sort : summarize bsupport if everbupe>0, detail




*Brief symptom inventory - anxiety

histogram bcIAnx if everbupe>0, by(bc31)
by bc31, sort : summarize bcIAnx if everbupe>0, detail
ranksum bcIAnx if everbupe>0, by(bc31)

*CES-D

histogram CESD if everbupe>0, by(bc31)
summarize CESD, detail
ttest CESD if everbupe>0, by(bc31)



*Ever hospitalized for mental health issue

clonevar psychhosp = bc95
recode psychhosp (0=0) (1=1) (.=.) (8=.)
by bc31, sort: fre psychhosp if everbupe>0
prtest psychhosp if everbupe>0, by(bc31)



