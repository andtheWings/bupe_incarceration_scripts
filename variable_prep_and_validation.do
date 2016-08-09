*Dependency:
**ssc install fre

label define no_yes 0 "no" 1 "yes" .a "don't know" .b "refused"

*Drug treatment:

label define drugtx 1 "bupe" 2 "methadone" 3 "other tx" 4 "unknown"
label values drugtx drugtx

recode drugtx .=4

label define dtxq 1 "bupe" 2 "methadone" 3 "other tx" 4 "unknown" 6 "died" 7 "jailed" 8 "lost to f/u" 9 "DNA - withdrew from study" 10 "moved" 11 "no tx"
label values dtxq1 dtxq
label values dtxq2 dtxq
label values dtxq3 dtxq
label values dtxq4 dtxq

gen bupe_qu1 = dtxq1
gen bupe_qu2 = dtxq2
gen bupe_qu3 = dtxq3
gen bupe_qu4 = dtxq4

label variable bupe_qu1 "Received bupe in Q1"
label variable bupe_qu2 "Received bupe in Q2"
label variable bupe_qu3 "Received bupe in Q3"
label variable bupe_qu4 "Received bupe in Q4"

label values bupe_qu1 no_yes
label values bupe_qu2 no_yes
label values bupe_qu3 no_yes
label values bupe_qu4 no_yes

recode bupe_qu1 2/max=0
recode bupe_qu2 2/max=0
recode bupe_qu3 2/max=0
recode bupe_qu4 2/max=0

*Visit quarter coding:

rename visitdate visitbasedate
rename visitdate_1 visit1date
rename visitdate_2 visit2date
rename visitdate_3 visit3date
rename visitdate_4 visit4date
rename visitdate_5 visit5date
rename visitdate_6 visit6date

label variable visitbasedate "Date of baseline visit"
label variable visit1date "Date of follow-up visit 1"
label variable visit2date "Date of follow-up visit 2"
label variable visit3date "Date of follow-up visit 3"
label variable visit4date "Date of follow-up visit 4"
label variable visit5date "Date of follow-up visit 5"
label variable visit6date "Date of follow-up visit 6"

gen visit1since = visit1date - visitbasedate
gen visit2since = visit2date - visitbasedate
gen visit3since = visit3date - visitbasedate
gen visit4since = visit4date - visitbasedate
gen visit5since = visit5date - visitbasedate
gen visit6since = visit6date - visitbasedate

label variable visit1since "Days between follow-up visit 1 and baseline"
label variable visit2since "Days between follow-up visit 2 and baseline"
label variable visit3since "Days between follow-up visit 3 and baseline"
label variable visit4since "Days between follow-up visit 4 and baseline"
label variable visit5since "Days between follow-up visit 5 and baseline"
label variable visit6since "Days between follow-up visit 6 and baseline"

fre visit1since
fre visit2since
fre visit3since
fre visit4since
fre visit5since
fre visit6since
**Cannot use a visit if it supposedly took place before the baseline
replace visit1since=. if visit1since<0

generate visit1_qu = .
generate visit2_qu = .
generate visit3_qu = .
generate visit4_qu = .
generate visit5_qu = .
generate visit6_qu = .

label variable visit1_qu "quarter assignment for first follow-up visit"
label variable visit2_qu "quarter assignment for second follow-up visit"
label variable visit3_qu "quarter assignment for third follow-up visit"
label variable visit4_qu "quarter assignment for fourth follow-up visit"
label variable visit5_qu "quarter assignment for fifth follow-up visit"
label variable visit6_qu "quarter assignment for sixth follow-up visit"

replace visit1_qu = 1 if visit1since>59 & visit1since<136
replace visit1_qu = 2 if visit1since>135 & visit1since<226
replace visit1_qu = 3 if visit1since>225 & visit1since<316
replace visit1_qu = 4 if visit1since>315 & visit1since<406

replace visit2_qu = 1 if visit2since>59 & visit2since<136
replace visit2_qu = 2 if visit2since>135 & visit2since<226
replace visit2_qu = 3 if visit2since>225 & visit2since<316
replace visit2_qu = 4 if visit2since>315 & visit2since<406

replace visit3_qu = 1 if visit3since>59 & visit3since<136
replace visit3_qu = 2 if visit3since>135 & visit3since<226
replace visit3_qu = 3 if visit3since>225 & visit3since<316
replace visit3_qu = 4 if visit3since>315 & visit3since<406

replace visit4_qu = 2 if visit4since>135 & visit4since<226
replace visit4_qu = 3 if visit4since>225 & visit4since<316
replace visit4_qu = 4 if visit4since>315 & visit4since<406

replace visit5_qu = 4 if visit5since>315 & visit5since<406

replace visit6_qu = 4 if visit6since>315 & visit6since<406 

**Checking for duplicates of coded visit quarters: 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit1_qu==visit2_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit1_qu==visit3_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit1_qu==visit4_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit1_qu==visit5_qu
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit1_qu==visit6_qu
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit2_qu==visit3_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit2_qu==visit4_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit2_qu==visit5_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit2_qu==visit6_qu
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit3_qu==visit4_qu
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit3_qu==visit5_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit3_qu==visit6_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit4_qu==visit5_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit4_qu==visit6_qu 
**list pid visit1_qu visit2_qu visit3_qu visit4_qu visit5_qu visit6_qu if visit5_qu==visit6_qu
**There are lots of duplicates, but I am choosing to keep all these duplicates as they are

*Criminal justice status per visit:

**Ever incarcerated at baseline:

clonevar everincar_base = bc31
label variable everincar_base "Subject reported at baseline having ever been incarcerated for more than 3 days"
label values everincar_base no_yes

fre everincar_base

**Recently incarcerated per visit

clonevar recentincar_base=bc32
clonevar recentincar_v1=qc17_1
clonevar recentincar_v2=qc17_2
clonevar recentincar_v3=qc17_3
clonevar recentincar_v4=qc17_4
clonevar recentincar_v5=qc17_5
clonevar recentincar_v6=qc17_6

label variable recentincar_base "Subject reported at baseline having been incarcerated in the past 30 days"
label variable recentincar_v1 "Subject reported at visit 1 having been incarcerated in the past 3 months"
label variable recentincar_v2 "Subject reported at visit 2 having been incarcerated in the past 3 months"
label variable recentincar_v3 "Subject reported at visit 3 having been incarcerated in the past 3 months"
label variable recentincar_v4 "Subject reported at visit 4 having been incarcerated in the past 3 months"
label variable recentincar_v5 "Subject reported at visit 5 having been incarcerated in the past 3 months"
label variable recentincar_v6 "Subject reported at visit 6 having been incarcerated in the past 3 months"

label values recentincar_base no_yes
label values recentincar_v1 no_yes
label values recentincar_v2 no_yes
label values recentincar_v3 no_yes
label values recentincar_v4 no_yes
label values recentincar_v5 no_yes
label values recentincar_v6 no_yes

recode recentincar_base 2/30=1
recode recentincar_v1 2/120=1
recode recentincar_v2 2/120=1
recode recentincar_v3 2/120=1
recode recentincar_v4 2/120=1
recode recentincar_v5 2/120=1
recode recentincar_v6 2/120=1

fre recentincar_base
fre recentincar_v1
fre recentincar_v2
fre recentincar_v3
fre recentincar_v4
fre recentincar_v5
fre recentincar_v6

**Probation/parole status per visit:

clonevar parole_base = bc29
clonevar parole_v1 = qc14_1
clonevar parole_v2 = qc14_2
clonevar parole_v3 = qc14_3
clonevar parole_v4 = qc14_4
clonevar parole_v5 = qc14_5
clonevar parole_v6 = qc14_6

label variable parole_base "Subject reported at baseline he/she was currently on parole or probation"
label variable parole_v1 "Subject reported at visit 1 he/she was currently on parole or probation"
label variable parole_v2 "Subject reported at visit 2 he/she was currently on parole or probation"
label variable parole_v3 "Subject reported at visit 3 he/she was currently on parole or probation"
label variable parole_v4 "Subject reported at visit 4 he/she was currently on parole or probation"
label variable parole_v5 "Subject reported at visit 5 he/she was currently on parole or probation"
label variable parole_v6 "Subject reported at visit 6 he/she was currently on parole or probation"

label values parole_base no_yes
label values parole_v1 no_yes
label values parole_v2 no_yes
label values parole_v3 no_yes
label values parole_v4 no_yes
label values parole_v5 no_yes
label values parole_v6 no_yes

fre parole_base
fre parole_v1
fre parole_v2
fre parole_v3
fre parole_v4
fre parole_v5
fre parole_v6
***One person at baseline stated they "didn't know" if they were on parole or probation
replace parole_base=.a if bc29==8

**Charges, trial, or sentencing status per visit:

clonevar charges_base = bc30
clonevar charges_v1 = qc15_1
clonevar charges_v2 = qc15_2
clonevar charges_v3 = qc15_3
clonevar charges_v4 = qc15_4
clonevar charges_v5 = qc15_5
clonevar charges_v6 = qc15_6

label variable charges_base "Subject reported at baseline he/she was awaiting charges, trial, or sentencing"
label variable charges_v1 "Subject reported at visit 1 he/she was awaiting charges, trial, or sentencing"
label variable charges_v2 "Subject reported at visit 2 he/she was awaiting charges, trial, or sentencing"
label variable charges_v3 "Subject reported at visit 3 he/she was awaiting charges, trial, or sentencing"
label variable charges_v4 "Subject reported at visit 4 he/she was awaiting charges, trial, or sentencing"
label variable charges_v5 "Subject reported at visit 5 he/she was awaiting charges, trial, or sentencing"
label variable charges_v6 "Subject reported at visit 6 he/she was awaiting charges, trial, or sentencing"

label values charges_base no_yes
label values charges_v1 no_yes
label values charges_v2 no_yes
label values charges_v3 no_yes
label values charges_v4 no_yes
label values charges_v5 no_yes
label values charges_v6 no_yes

fre charges_base
fre charges_v1
fre charges_v2
fre charges_v3
fre charges_v4
fre charges_v5
fre charges_v6

*Criminal justice status per quarter:

**Recent incarceration per quarter:

gen recentincar_qu1=.
gen recentincar_qu2=.
gen recentincar_qu3=.
gen recentincar_qu4=.
gen recentincar_allqu = .

label variable recentincar_qu1 "Subject reported being incarcerated in 3 months before quarter one visit"
label variable recentincar_qu2 "Subject reported being incarcerated in 3 months before quarter two visit"
label variable recentincar_qu3 "Subject reported being incarcerated in 3 months before quarter three visit"
label variable recentincar_qu4 "Subject reported being incarcerated in 3 months before quarter four visit"
label variable recentincar_allqu "Subject reported being incarcerated in 3 months before any of the quarterly visits"

label values recentincar_qu1 no_yes
label values recentincar_qu2 no_yes
label values recentincar_qu3 no_yes
label values recentincar_qu4 no_yes
label values recentincar_allqu no_yes

replace recentincar_qu1=0 if visit1_qu==1 & recentincar_v1==0
replace recentincar_qu1=0 if visit2_qu==1 & recentincar_v2==0
replace recentincar_qu1=0 if visit3_qu==1 & recentincar_v3==0
replace recentincar_qu1=0 if visit4_qu==1 & recentincar_v4==0
replace recentincar_qu1=0 if visit5_qu==1 & recentincar_v5==0
replace recentincar_qu1=0 if visit6_qu==1 & recentincar_v6==0

replace recentincar_qu1=1 if visit1_qu==1 & recentincar_v1==1
replace recentincar_qu1=1 if visit2_qu==1 & recentincar_v2==1
replace recentincar_qu1=1 if visit3_qu==1 & recentincar_v3==1
replace recentincar_qu1=1 if visit4_qu==1 & recentincar_v4==1
replace recentincar_qu1=1 if visit5_qu==1 & recentincar_v5==1
replace recentincar_qu1=1 if visit6_qu==1 & recentincar_v6==1

list recentincar_qu1 recentincar_v1 visit1_qu recentincar_v2 visit2_qu recentincar_v3 visit3_qu recentincar_v4 visit4_qu recentincar_v5 visit5_qu recentincar_v6 visit6_qu

replace recentincar_qu2=0 if visit1_qu==2 & recentincar_v1==0
replace recentincar_qu2=0 if visit2_qu==2 & recentincar_v2==0
replace recentincar_qu2=0 if visit3_qu==2 & recentincar_v3==0
replace recentincar_qu2=0 if visit4_qu==2 & recentincar_v4==0
replace recentincar_qu2=0 if visit5_qu==2 & recentincar_v5==0
replace recentincar_qu2=0 if visit6_qu==2 & recentincar_v6==0

replace recentincar_qu2=1 if visit1_qu==2 & recentincar_v1==1
replace recentincar_qu2=1 if visit2_qu==2 & recentincar_v2==1
replace recentincar_qu2=1 if visit3_qu==2 & recentincar_v3==1
replace recentincar_qu2=1 if visit4_qu==2 & recentincar_v4==1
replace recentincar_qu2=1 if visit5_qu==2 & recentincar_v5==1
replace recentincar_qu2=1 if visit6_qu==2 & recentincar_v6==1

list recentincar_qu2 recentincar_v1 visit1_qu recentincar_v2 visit2_qu recentincar_v3 visit3_qu recentincar_v4 visit4_qu recentincar_v5 visit5_qu recentincar_v6 visit6_qu

replace recentincar_qu3=0 if visit1_qu==3 & recentincar_v1==0
replace recentincar_qu3=0 if visit2_qu==3 & recentincar_v2==0
replace recentincar_qu3=0 if visit3_qu==3 & recentincar_v3==0
replace recentincar_qu3=0 if visit4_qu==3 & recentincar_v4==0
replace recentincar_qu3=0 if visit5_qu==3 & recentincar_v5==0
replace recentincar_qu3=0 if visit6_qu==3 & recentincar_v6==0

replace recentincar_qu3=1 if visit1_qu==3 & recentincar_v1==1
replace recentincar_qu3=1 if visit2_qu==3 & recentincar_v2==1
replace recentincar_qu3=1 if visit3_qu==3 & recentincar_v3==1
replace recentincar_qu3=1 if visit4_qu==3 & recentincar_v4==1
replace recentincar_qu3=1 if visit5_qu==3 & recentincar_v5==1
replace recentincar_qu3=1 if visit6_qu==3 & recentincar_v6==1

list recentincar_qu3 recentincar_v1 visit1_qu recentincar_v2 visit2_qu recentincar_v3 visit3_qu recentincar_v4 visit4_qu recentincar_v5 visit5_qu recentincar_v6 visit6_qu

replace recentincar_qu4=0 if visit1_qu==4 & recentincar_v1==0
replace recentincar_qu4=0 if visit2_qu==4 & recentincar_v2==0
replace recentincar_qu4=0 if visit3_qu==4 & recentincar_v3==0
replace recentincar_qu4=0 if visit4_qu==4 & recentincar_v4==0
replace recentincar_qu4=0 if visit5_qu==4 & recentincar_v5==0
replace recentincar_qu4=0 if visit6_qu==4 & recentincar_v6==0

replace recentincar_qu4=1 if visit1_qu==4 & recentincar_v1==1
replace recentincar_qu4=1 if visit2_qu==4 & recentincar_v2==1
replace recentincar_qu4=1 if visit3_qu==4 & recentincar_v3==1
replace recentincar_qu4=1 if visit4_qu==4 & recentincar_v4==1
replace recentincar_qu4=1 if visit5_qu==4 & recentincar_v5==1
replace recentincar_qu4=1 if visit6_qu==4 & recentincar_v6==1

list recentincar_qu4 recentincar_v1 visit1_qu recentincar_v2 visit2_qu recentincar_v3 visit3_qu recentincar_v4 visit4_qu recentincar_v5 visit5_qu recentincar_v6 visit6_qu

replace recentincar_allqu = 0 if recentincar_qu1==0 & recentincar_qu2==0 & recentincar_qu3==0 & recentincar_qu4==0
replace recentincar_allqu = 1 if recentincar_qu1==1 | recentincar_qu2==1 | recentincar_qu3==1 | recentincar_qu4==1

list recentincar_allqu recentincar_qu1 recentincar_qu2 recentincar_qu3 recentincar_qu4

gen newrecentincar_qu1 = recentincar_qu1
gen newrecentincar_qu2 = recentincar_qu2
gen newrecentincar_qu3 = recentincar_qu3
gen newrecentincar_qu4 = recentincar_qu4
gen newrecentincar_allqu = recentincar_allqu

label variable newrecentincar_qu1 "Reported incarceration before quarter one visit or missed tx b/c incarcerated"
label variable newrecentincar_qu2 "Reported incarceration before quarter two visit or missed tx b/c incarcerated"
label variable newrecentincar_qu3 "Reported incarceration before quarter three visit or missed tx b/c incarcerated"
label variable newrecentincar_qu4 "Reported incarceration before quarter four visit or missed tx b/c incarcerated"
label variable newrecentincar_allqu "Reported incarceration at any visit or missed tx b/c incarcerated"

label values newrecentincar_qu1 no_yes
label values newrecentincar_qu2 no_yes
label values newrecentincar_qu3 no_yes
label values newrecentincar_qu4 no_yes
label values newrecentincar_allqu no_yes

replace newrecentincar_qu1 = 1 if dtxq1==7
replace newrecentincar_qu2 = 1 if dtxq2==7
replace newrecentincar_qu3 = 1 if dtxq2==7
replace newrecentincar_qu4 = 1 if dtxq4==7
replace newrecentincar_allqu = 1 if dtxq1==7 | dtxq2==7 | dtxq3==7 | dtxq4==7

**Parole/probation per quarter:

gen parole_qu1=.
gen parole_qu2=.
gen parole_qu3=.
gen parole_qu4=.
gen parole_allqu=.

label variable parole_qu1 "Subject reported being on parole/probation at quarter one visit"
label variable parole_qu2 "Subject reported being on parole/probation at quarter two visit"
label variable parole_qu3 "Subject reported being on parole/probation at quarter three visit"
label variable parole_qu4 "Subject reported being on parole/probation at quarter four visit"
label variable parole_allqu "Subject reported being on parole/probation at any of the quarterly visits"

label values parole_qu1 no_yes
label values parole_qu2 no_yes
label values parole_qu3 no_yes
label values parole_qu4 no_yes
label values parole_allqu no_yes

replace parole_qu1=0 if visit1_qu==1 & parole_v1==0
replace parole_qu1=0 if visit2_qu==1 & parole_v2==0
replace parole_qu1=0 if visit3_qu==1 & parole_v3==0
replace parole_qu1=0 if visit4_qu==1 & parole_v4==0
replace parole_qu1=0 if visit5_qu==1 & parole_v5==0
replace parole_qu1=0 if visit6_qu==1 & parole_v6==0

replace parole_qu1=1 if visit1_qu==1 & parole_v1==1
replace parole_qu1=1 if visit2_qu==1 & parole_v2==1
replace parole_qu1=1 if visit3_qu==1 & parole_v3==1
replace parole_qu1=1 if visit4_qu==1 & parole_v4==1
replace parole_qu1=1 if visit5_qu==1 & parole_v5==1
replace parole_qu1=1 if visit6_qu==1 & parole_v6==1

list parole_qu1 parole_v1 visit1_qu parole_v2 visit2_qu parole_v3 visit3_qu parole_v4 visit4_qu parole_v5 visit5_qu parole_v6 visit6_qu

replace parole_qu2=0 if visit1_qu==2 & parole_v1==0
replace parole_qu2=0 if visit2_qu==2 & parole_v2==0
replace parole_qu2=0 if visit3_qu==2 & parole_v3==0
replace parole_qu2=0 if visit4_qu==2 & parole_v4==0
replace parole_qu2=0 if visit5_qu==2 & parole_v5==0
replace parole_qu2=0 if visit6_qu==2 & parole_v6==0

replace parole_qu2=1 if visit1_qu==2 & parole_v1==1
replace parole_qu2=1 if visit2_qu==2 & parole_v2==1
replace parole_qu2=1 if visit3_qu==2 & parole_v3==1
replace parole_qu2=1 if visit4_qu==2 & parole_v4==1
replace parole_qu2=1 if visit5_qu==2 & parole_v5==1
replace parole_qu2=1 if visit6_qu==2 & parole_v6==1

list parole_qu2 parole_v1 visit1_qu parole_v2 visit2_qu parole_v3 visit3_qu parole_v4 visit4_qu parole_v5 visit5_qu parole_v6 visit6_qu

replace parole_qu3=0 if visit1_qu==3 & parole_v1==0
replace parole_qu3=0 if visit2_qu==3 & parole_v2==0
replace parole_qu3=0 if visit3_qu==3 & parole_v3==0
replace parole_qu3=0 if visit4_qu==3 & parole_v4==0
replace parole_qu3=0 if visit5_qu==3 & parole_v5==0
replace parole_qu3=0 if visit6_qu==3 & parole_v6==0

replace parole_qu3=1 if visit1_qu==3 & parole_v1==1
replace parole_qu3=1 if visit2_qu==3 & parole_v2==1
replace parole_qu3=1 if visit3_qu==3 & parole_v3==1
replace parole_qu3=1 if visit4_qu==3 & parole_v4==1
replace parole_qu3=1 if visit5_qu==3 & parole_v5==1
replace parole_qu3=1 if visit6_qu==3 & parole_v6==1

list parole_qu3 parole_v1 visit1_qu parole_v2 visit2_qu parole_v3 visit3_qu parole_v4 visit4_qu parole_v5 visit5_qu parole_v6 visit6_qu

replace parole_qu4=0 if visit1_qu==4 & parole_v1==0
replace parole_qu4=0 if visit2_qu==4 & parole_v2==0
replace parole_qu4=0 if visit3_qu==4 & parole_v3==0
replace parole_qu4=0 if visit4_qu==4 & parole_v4==0
replace parole_qu4=0 if visit5_qu==4 & parole_v5==0
replace parole_qu4=0 if visit6_qu==4 & parole_v6==0

replace parole_qu4=1 if visit1_qu==4 & parole_v1==1
replace parole_qu4=1 if visit2_qu==4 & parole_v2==1
replace parole_qu4=1 if visit3_qu==4 & parole_v3==1
replace parole_qu4=1 if visit4_qu==4 & parole_v4==1
replace parole_qu4=1 if visit5_qu==4 & parole_v5==1
replace parole_qu4=1 if visit6_qu==4 & parole_v6==1

list parole_qu4 parole_v1 visit1_qu parole_v2 visit2_qu parole_v3 visit3_qu parole_v4 visit4_qu parole_v5 visit5_qu parole_v6 visit6_qu

**Criminal charges, trial, or sentencing per quarter:

gen charges_qu1=.
gen charges_qu2=.
gen charges_qu3=.
gen charges_qu4=.
gen charges_allqu=.

label variable charges_qu1 "Subject reported awaiting charges, trial, or sentencing at quarter one visit"
label variable charges_qu2 "Subject reported awaiting charges, trial, or sentencing at quarter two visit"
label variable charges_qu3 "Subject reported awaiting charges, trial, or sentencing at quarter three visit"
label variable charges_qu4 "Subject reported awaiting charges, trial, or sentencing at quarter four visit"
label variable charges_allqu "Subject reported awaiting charges, trial, or sentencing at any of the quarterly visits"

label values charges_qu1 no_yes
label values charges_qu2 no_yes
label values charges_qu3 no_yes
label values charges_qu4 no_yes
label values charges_allqu no_yes

replace charges_qu1=0 if visit1_qu==1 & charges_v1==0
replace charges_qu1=0 if visit2_qu==1 & charges_v2==0
replace charges_qu1=0 if visit3_qu==1 & charges_v3==0
replace charges_qu1=0 if visit4_qu==1 & charges_v4==0
replace charges_qu1=0 if visit5_qu==1 & charges_v5==0
replace charges_qu1=0 if visit6_qu==1 & charges_v6==0

replace charges_qu1=1 if visit1_qu==1 & charges_v1==1
replace charges_qu1=1 if visit2_qu==1 & charges_v2==1
replace charges_qu1=1 if visit3_qu==1 & charges_v3==1
replace charges_qu1=1 if visit4_qu==1 & charges_v4==1
replace charges_qu1=1 if visit5_qu==1 & charges_v5==1
replace charges_qu1=1 if visit6_qu==1 & charges_v6==1

*list charges_qu1 charges_v1 visit1_qu charges_v2 visit2_qu charges_v3 visit3_qu charges_v4 visit4_qu charges_v5 visit5_qu charges_v6 visit6_qu

replace charges_qu2=0 if visit1_qu==2 & charges_v1==0
replace charges_qu2=0 if visit2_qu==2 & charges_v2==0
replace charges_qu2=0 if visit3_qu==2 & charges_v3==0
replace charges_qu2=0 if visit4_qu==2 & charges_v4==0
replace charges_qu2=0 if visit5_qu==2 & charges_v5==0
replace charges_qu2=0 if visit6_qu==2 & charges_v6==0

replace charges_qu2=1 if visit1_qu==2 & charges_v1==1
replace charges_qu2=1 if visit2_qu==2 & charges_v2==1
replace charges_qu2=1 if visit3_qu==2 & charges_v3==1
replace charges_qu2=1 if visit4_qu==2 & charges_v4==1
replace charges_qu2=1 if visit5_qu==2 & charges_v5==1
replace charges_qu2=1 if visit6_qu==2 & charges_v6==1

*list charges_qu2 charges_v1 visit1_qu charges_v2 visit2_qu charges_v3 visit3_qu charges_v4 visit4_qu charges_v5 visit5_qu charges_v6 visit6_qu

replace charges_qu3=0 if visit1_qu==3 & charges_v1==0
replace charges_qu3=0 if visit2_qu==3 & charges_v2==0
replace charges_qu3=0 if visit3_qu==3 & charges_v3==0
replace charges_qu3=0 if visit4_qu==3 & charges_v4==0
replace charges_qu3=0 if visit5_qu==3 & charges_v5==0
replace charges_qu3=0 if visit6_qu==3 & charges_v6==0

replace charges_qu3=1 if visit1_qu==3 & charges_v1==1
replace charges_qu3=1 if visit2_qu==3 & charges_v2==1
replace charges_qu3=1 if visit3_qu==3 & charges_v3==1
replace charges_qu3=1 if visit4_qu==3 & charges_v4==1
replace charges_qu3=1 if visit5_qu==3 & charges_v5==1
replace charges_qu3=1 if visit6_qu==3 & charges_v6==1

*list charges_qu3 charges_v1 visit1_qu charges_v2 visit2_qu charges_v3 visit3_qu charges_v4 visit4_qu charges_v5 visit5_qu charges_v6 visit6_qu

replace charges_qu4=0 if visit1_qu==4 & charges_v1==0
replace charges_qu4=0 if visit2_qu==4 & charges_v2==0
replace charges_qu4=0 if visit3_qu==4 & charges_v3==0
replace charges_qu4=0 if visit4_qu==4 & charges_v4==0
replace charges_qu4=0 if visit5_qu==4 & charges_v5==0
replace charges_qu4=0 if visit6_qu==4 & charges_v6==0

replace charges_qu4=1 if visit1_qu==4 & charges_v1==1
replace charges_qu4=1 if visit2_qu==4 & charges_v2==1
replace charges_qu4=1 if visit3_qu==4 & charges_v3==1
replace charges_qu4=1 if visit4_qu==4 & charges_v4==1
replace charges_qu4=1 if visit5_qu==4 & charges_v5==1
replace charges_qu4=1 if visit6_qu==4 & charges_v6==1

*list charges_qu4 charges_v1 visit1_qu charges_v2 visit2_qu charges_v3 visit3_qu charges_v4 visit4_qu charges_v5 visit5_qu charges_v6 visit6_qu


*Recent criminal justice involvement

gen recentcj_base=.
label variable recentcj_base "Patient reported incarceration in past 30 days or current parole/probation status at baseline"
label values recentcj_base no_yes

replace recentcj_base=1 if recentincar_base==1 | parole_base==1
replace recentcj_base=0 if recentincar_base==0 & parole_base==0

*fre recentcj_base
*tab recentcj_base recentincar_base
*tab recentcj_base parole_base

*Treatment retention:

gen retention = 0
label variable retention "Number of quarters in a row that subject was retained on bup/nx treatment"
replace retention=1 if dtxq1==1 & dtxq2!=1 
replace retention=2 if dtxq1==1 & dtxq2==1 & dtxq3!=1
replace retention=3 if dtxq1==1 & dtxq2==1 & dtxq3==1 & dtxq4!=1
replace retention=4 if dtxq1==1 & dtxq2==1 & dtxq3==1 & dtxq4==1

list retention dtxq1 dtxq2 dtxq3 dtxq4

clonevar retention1q=retention
recode retention1q 2/4=1
label variable retention1q "Subject was retained on bup/nx treatment for one or more consecutive quarters"
label values retention1q no_yes

clonevar retention2q=retention
recode retention2q 1=0 2/4=1
label variable retention2q "Subject was retained on bup/nx treatment for two or more consecutive quarters"
label values retention2q no_yes

clonevar retention3q=retention
recode retention3q 1/2=0 3/4=1
label variable retention3q "Subject was retained on bup/nx treatment for three or more consecutive quarters"
label values retention3q no_yes

clonevar retention4q=retention
recode retention4q 1/3=0 4=1
label variable retention4q "Subject was retained on bup/nx treatment for four consecutive quarters"
label values retention4q no_yes

list retention retention1q retention2q retention3q retention4q

*Opioid Use per Visit:

egen float recentopioids_base = rowmax(bc103d bc104d bc105d)
egen float recentopioids_v1 = rowmax(qc83d_1 qc84d_1 qc85d_1)
egen float recentopioids_v2 = rowmax(qc83d_2 qc84d_2 qc85d_2)
egen float recentopioids_v3 = rowmax(qc83d_3 qc84d_3 qc85d_3)
egen float recentopioids_v4 = rowmax(qc83d_4 qc84d_4 qc85d_4)
egen float recentopioids_v5 = rowmax(qc83d_5 qc84d_5 qc85d_5)
egen float recentopioids_v6 = rowmax(qc83d_6 qc84d_6 qc85d_6)

label variable recentopioids_base "Days of heroin, methadone, or analgesic use in 30 days before baseline"
label variable recentopioids_v1 "Days of heroin, methadone, or analgesic use in 30 days before followup visit 1"
label variable recentopioids_v2 "Days of heroin, methadone, or analgesic use in 30 days before followup visit 2"
label variable recentopioids_v3 "Days of heroin, methadone, or analgesic use in 30 days before followup visit 3"
label variable recentopioids_v4 "Days of heroin, methadone, or analgesic use in 30 days before followup visit 4"
label variable recentopioids_v5 "Days of heroin, methadone, or analgesic use in 30 days before followup visit 5"
label variable recentopioids_v6 "Days of heroin, methadone, or analgesic use in 30 days before followup visit 6"

fre recentopioids_base
fre recentopioids_v1
fre recentopioids_v2
fre recentopioids_v3
fre recentopioids_v4
fre recentopioids_v5
fre recentopioids_v6
**Maximum value possible is 30 days
replace recentopioids_base=. if recentopioids_base==92

*list recentopioids_base bc103d bc104d bc105d
*list recentopioids_v1 qc83d_1 qc84d_1 qc85d_1
*list recentopioids_v2 qc83d_2 qc84d_2 qc85d_2
*list recentopioids_v3 qc83d_3 qc84d_3 qc85d_3
*list recentopioids_v4 qc83d_4 qc84d_4 qc85d_4
*list recentopioids_v5 qc83d_5 qc84d_5 qc85d_5
*list recentopioids_v6 qc83d_6 qc84d_6 qc85d_6

clonevar anyrecentopioids_base = recentopioids_base
gen anyrecentopioids_v1 = recentopioids_v1
gen anyrecentopioids_v2 = recentopioids_v2
gen anyrecentopioids_v3 = recentopioids_v3
gen anyrecentopioids_v4 = recentopioids_v4
gen anyrecentopioids_v5 = recentopioids_v5
gen anyrecentopioids_v6 = recentopioids_v6

label variable anyrecentopioids_base "Any heroin, methadone, or analgesic use in 30 days before baseline"
label variable anyrecentopioids_v1 "Any heroin, methadone, or analgesic use in 30 days before followup visit 1"
label variable anyrecentopioids_v2 "Any heroin, methadone, or analgesic use in 30 days before followup visit 2"
label variable anyrecentopioids_v3 "Any heroin, methadone, or analgesic use in 30 days before followup visit 3"
label variable anyrecentopioids_v4 "Any heroin, methadone, or analgesic use in 30 days before followup visit 4"
label variable anyrecentopioids_v5 "Any heroin, methadone, or analgesic use in 30 days before followup visit 5"
label variable anyrecentopioids_v6 "Any heroin, methadone, or analgesic use in 30 days before followup visit 6"

label values anyrecentopioids_base no_yes
label values anyrecentopioids_v1 no_yes
label values anyrecentopioids_v2 no_yes
label values anyrecentopioids_v3 no_yes
label values anyrecentopioids_v4 no_yes
label values anyrecentopioids_v5 no_yes
label values anyrecentopioids_v6 no_yes

recode anyrecentopioids_base 1/30=1
recode anyrecentopioids_v1 1/30=1
recode anyrecentopioids_v2 1/30=1
recode anyrecentopioids_v3 1/30=1
recode anyrecentopioids_v4 1/30=1
recode anyrecentopioids_v5 1/30=1
recode anyrecentopioids_v6 1/30=1

list anyrecentopioids_base recentopioids_base
list anyrecentopioids_v1 recentopioids_v1
list anyrecentopioids_v2 recentopioids_v2
list anyrecentopioids_v3 recentopioids_v3
list anyrecentopioids_v4 recentopioids_v4
list anyrecentopioids_v5 recentopioids_v5
list anyrecentopioids_v6 recentopioids_v6

*Quarterly Opioid Use:

gen recentopioids_qu1=.
gen recentopioids_qu2=.
gen recentopioids_qu3=.
gen recentopioids_qu4=.

label variable recentopioids_qu1 "Days of heroin, methadone or analgesic use in 30 days before followup in quarter 1"
label variable recentopioids_qu2 "Days of heroin, methadone or analgesic use in 30 days before followup in quarter 2"
label variable recentopioids_qu3 "Days of heroin, methadone or analgesic use in 30 days before followup in quarter 3"
label variable recentopioids_qu4 "Days of heroin, methadone or analgesic use in 30 days before followup in quarter 4"

replace recentopioids_qu1=recentopioids_v1 if visit1_qu==1 & recentopioids_v1!=.
replace recentopioids_qu1=recentopioids_v2 if visit2_qu==1 & recentopioids_v2!=. & recentopioids_qu1==.
replace recentopioids_qu1=recentopioids_v2 if visit2_qu==1 & recentopioids_v2>recentopioids_qu1 & recentopioids_v2!=.
replace recentopioids_qu1=recentopioids_v3 if visit3_qu==1 & recentopioids_v3!=. & recentopioids_qu1==.
replace recentopioids_qu1=recentopioids_v3 if visit3_qu==1 & recentopioids_v3>recentopioids_qu1 & recentopioids_v3!=.
replace recentopioids_qu1=recentopioids_v4 if visit4_qu==1 & recentopioids_v4!=. & recentopioids_qu1==.
replace recentopioids_qu1=recentopioids_v4 if visit4_qu==1 & recentopioids_v4>recentopioids_qu1 & recentopioids_v4!=.
replace recentopioids_qu1=recentopioids_v5 if visit5_qu==1 & recentopioids_v5!=. & recentopioids_qu1==.
replace recentopioids_qu1=recentopioids_v5 if visit5_qu==1 & recentopioids_v5>recentopioids_qu1 & recentopioids_v5!=.
replace recentopioids_qu1=recentopioids_v6 if visit6_qu==1 & recentopioids_v6!=. & recentopioids_qu1==.
replace recentopioids_qu1=recentopioids_v6 if visit6_qu==1 & recentopioids_v6>recentopioids_qu1 & recentopioids_v6!=.

replace recentopioids_qu2=recentopioids_v1 if visit1_qu==2 & recentopioids_v1!=.
replace recentopioids_qu2=recentopioids_v2 if visit2_qu==2 & recentopioids_v2!=. & recentopioids_qu2==.
replace recentopioids_qu2=recentopioids_v2 if visit2_qu==2 & recentopioids_v2>recentopioids_qu2 & recentopioids_v2!=.
replace recentopioids_qu2=recentopioids_v3 if visit3_qu==2 & recentopioids_v3!=. & recentopioids_qu2==.
replace recentopioids_qu2=recentopioids_v3 if visit3_qu==2 & recentopioids_v3>recentopioids_qu2 & recentopioids_v3!=.
replace recentopioids_qu2=recentopioids_v4 if visit4_qu==2 & recentopioids_v4!=. & recentopioids_qu2==.
replace recentopioids_qu2=recentopioids_v4 if visit4_qu==2 & recentopioids_v4>recentopioids_qu2 & recentopioids_v4!=.
replace recentopioids_qu2=recentopioids_v5 if visit5_qu==2 & recentopioids_v5!=. & recentopioids_qu2==.
replace recentopioids_qu2=recentopioids_v5 if visit5_qu==2 & recentopioids_v5>recentopioids_qu2 & recentopioids_v5!=.
replace recentopioids_qu2=recentopioids_v6 if visit6_qu==2 & recentopioids_v6!=. & recentopioids_qu2==.
replace recentopioids_qu2=recentopioids_v6 if visit6_qu==2 & recentopioids_v6>recentopioids_qu2 & recentopioids_v6!=.

replace recentopioids_qu3=recentopioids_v1 if visit1_qu==3 & recentopioids_v1!=.
replace recentopioids_qu3=recentopioids_v2 if visit2_qu==3 & recentopioids_v2!=. & recentopioids_qu3==.
replace recentopioids_qu3=recentopioids_v2 if visit2_qu==3 & recentopioids_v2>recentopioids_qu3 & recentopioids_v2!=.
replace recentopioids_qu3=recentopioids_v3 if visit3_qu==3 & recentopioids_v3!=. & recentopioids_qu3==.
replace recentopioids_qu3=recentopioids_v3 if visit3_qu==3 & recentopioids_v3>recentopioids_qu3 & recentopioids_v3!=.
replace recentopioids_qu3=recentopioids_v4 if visit4_qu==3 & recentopioids_v4!=. & recentopioids_qu3==.
replace recentopioids_qu3=recentopioids_v4 if visit4_qu==3 & recentopioids_v4>recentopioids_qu3 & recentopioids_v4!=.
replace recentopioids_qu3=recentopioids_v5 if visit5_qu==3 & recentopioids_v5!=. & recentopioids_qu3==.
replace recentopioids_qu3=recentopioids_v5 if visit5_qu==3 & recentopioids_v5>recentopioids_qu3 & recentopioids_v5!=.
replace recentopioids_qu3=recentopioids_v6 if visit6_qu==3 & recentopioids_v6!=. & recentopioids_qu3==.
replace recentopioids_qu3=recentopioids_v6 if visit6_qu==3 & recentopioids_v6>recentopioids_qu3 & recentopioids_v6!=.

replace recentopioids_qu4=recentopioids_v1 if visit1_qu==4 & recentopioids_v1!=.
replace recentopioids_qu4=recentopioids_v2 if visit2_qu==4 & recentopioids_v2!=. & recentopioids_qu4==.
replace recentopioids_qu4=recentopioids_v2 if visit2_qu==4 & recentopioids_v2>recentopioids_qu4 & recentopioids_v2!=.
replace recentopioids_qu4=recentopioids_v3 if visit3_qu==4 & recentopioids_v3!=. & recentopioids_qu4==.
replace recentopioids_qu4=recentopioids_v3 if visit3_qu==4 & recentopioids_v3>recentopioids_qu4 & recentopioids_v3!=.
replace recentopioids_qu4=recentopioids_v4 if visit4_qu==4 & recentopioids_v4!=. & recentopioids_qu4==.
replace recentopioids_qu4=recentopioids_v4 if visit4_qu==4 & recentopioids_v4>recentopioids_qu4 & recentopioids_v4!=.
replace recentopioids_qu4=recentopioids_v5 if visit5_qu==4 & recentopioids_v5!=. & recentopioids_qu4==.
replace recentopioids_qu4=recentopioids_v5 if visit5_qu==4 & recentopioids_v5>recentopioids_qu4 & recentopioids_v5!=.
replace recentopioids_qu4=recentopioids_v6 if visit6_qu==4 & recentopioids_v6!=. & recentopioids_qu4==.
replace recentopioids_qu4=recentopioids_v6 if visit6_qu==4 & recentopioids_v6>recentopioids_qu4 & recentopioids_v6!=.

gen anyrecentopioids_qu1=.
gen anyrecentopioids_qu2=.
gen anyrecentopioids_qu3=.
gen anyrecentopioids_qu4=.

label variable anyrecentopioids_qu1 "Any heroin, methadone, or analgesic use in 30 days before followup in quarter 1"
label variable anyrecentopioids_qu2 "Any heroin, methadone, or analgesic use in 30 days before followup in quarter 2"
label variable anyrecentopioids_qu3 "Any heroin, methadone, or analgesic use in 30 days before followup in quarter 3"
label variable anyrecentopioids_qu4 "Any heroin, methadone, or analgesic use in 30 days before followup in quarter 4"

label values anyrecentopioids_qu1 no_yes
label values anyrecentopioids_qu2 no_yes
label values anyrecentopioids_qu3 no_yes
label values anyrecentopioids_qu4 no_yes

replace anyrecentopioids_qu1=0 if visit1_qu==1 & anyrecentopioids_v1==0
replace anyrecentopioids_qu1=0 if visit2_qu==1 & anyrecentopioids_v2==0
replace anyrecentopioids_qu1=0 if visit3_qu==1 & anyrecentopioids_v3==0
replace anyrecentopioids_qu1=0 if visit4_qu==1 & anyrecentopioids_v4==0
replace anyrecentopioids_qu1=0 if visit5_qu==1 & anyrecentopioids_v5==0
replace anyrecentopioids_qu1=0 if visit6_qu==1 & anyrecentopioids_v6==0

replace anyrecentopioids_qu1=1 if visit1_qu==1 & anyrecentopioids_v1==1
replace anyrecentopioids_qu1=1 if visit2_qu==1 & anyrecentopioids_v2==1
replace anyrecentopioids_qu1=1 if visit3_qu==1 & anyrecentopioids_v3==1
replace anyrecentopioids_qu1=1 if visit4_qu==1 & anyrecentopioids_v4==1
replace anyrecentopioids_qu1=1 if visit5_qu==1 & anyrecentopioids_v5==1
replace anyrecentopioids_qu1=1 if visit6_qu==1 & anyrecentopioids_v6==1

list anyrecentopioids_qu1 anyrecentopioids_v1 visit1_qu anyrecentopioids_v2 visit2_qu anyrecentopioids_v3 visit3_qu anyrecentopioids_v4 visit4_qu anyrecentopioids_v5 visit5_qu anyrecentopioids_v6 visit6_qu

replace anyrecentopioids_qu2=0 if visit1_qu==2 & anyrecentopioids_v1==0
replace anyrecentopioids_qu2=0 if visit2_qu==2 & anyrecentopioids_v2==0
replace anyrecentopioids_qu2=0 if visit3_qu==2 & anyrecentopioids_v3==0
replace anyrecentopioids_qu2=0 if visit4_qu==2 & anyrecentopioids_v4==0
replace anyrecentopioids_qu2=0 if visit5_qu==2 & anyrecentopioids_v5==0
replace anyrecentopioids_qu2=0 if visit6_qu==2 & anyrecentopioids_v6==0

replace anyrecentopioids_qu2=1 if visit1_qu==2 & anyrecentopioids_v1==1
replace anyrecentopioids_qu2=1 if visit2_qu==2 & anyrecentopioids_v2==1
replace anyrecentopioids_qu2=1 if visit3_qu==2 & anyrecentopioids_v3==1
replace anyrecentopioids_qu2=1 if visit4_qu==2 & anyrecentopioids_v4==1
replace anyrecentopioids_qu2=1 if visit5_qu==2 & anyrecentopioids_v5==1
replace anyrecentopioids_qu2=1 if visit6_qu==2 & anyrecentopioids_v6==1

list anyrecentopioids_qu2 anyrecentopioids_v1 visit1_qu anyrecentopioids_v2 visit2_qu anyrecentopioids_v3 visit3_qu anyrecentopioids_v4 visit4_qu anyrecentopioids_v5 visit5_qu anyrecentopioids_v6 visit6_qu

replace anyrecentopioids_qu3=0 if visit1_qu==3 & anyrecentopioids_v1==0
replace anyrecentopioids_qu3=0 if visit2_qu==3 & anyrecentopioids_v2==0
replace anyrecentopioids_qu3=0 if visit3_qu==3 & anyrecentopioids_v3==0
replace anyrecentopioids_qu3=0 if visit4_qu==3 & anyrecentopioids_v4==0
replace anyrecentopioids_qu3=0 if visit5_qu==3 & anyrecentopioids_v5==0
replace anyrecentopioids_qu3=0 if visit6_qu==3 & anyrecentopioids_v6==0

replace anyrecentopioids_qu3=1 if visit1_qu==3 & anyrecentopioids_v1==1
replace anyrecentopioids_qu3=1 if visit2_qu==3 & anyrecentopioids_v2==1
replace anyrecentopioids_qu3=1 if visit3_qu==3 & anyrecentopioids_v3==1
replace anyrecentopioids_qu3=1 if visit4_qu==3 & anyrecentopioids_v4==1
replace anyrecentopioids_qu3=1 if visit5_qu==3 & anyrecentopioids_v5==1
replace anyrecentopioids_qu3=1 if visit6_qu==3 & anyrecentopioids_v6==1

list anyrecentopioids_qu3 anyrecentopioids_v1 visit1_qu anyrecentopioids_v2 visit2_qu anyrecentopioids_v3 visit3_qu anyrecentopioids_v4 visit4_qu anyrecentopioids_v5 visit5_qu anyrecentopioids_v6 visit6_qu

replace anyrecentopioids_qu4=0 if visit1_qu==4 & anyrecentopioids_v1==0
replace anyrecentopioids_qu4=0 if visit2_qu==4 & anyrecentopioids_v2==0
replace anyrecentopioids_qu4=0 if visit3_qu==4 & anyrecentopioids_v3==0
replace anyrecentopioids_qu4=0 if visit4_qu==4 & anyrecentopioids_v4==0
replace anyrecentopioids_qu4=0 if visit5_qu==4 & anyrecentopioids_v5==0
replace anyrecentopioids_qu4=0 if visit6_qu==4 & anyrecentopioids_v6==0

replace anyrecentopioids_qu4=1 if visit1_qu==4 & anyrecentopioids_v1==1
replace anyrecentopioids_qu4=1 if visit2_qu==4 & anyrecentopioids_v2==1
replace anyrecentopioids_qu4=1 if visit3_qu==4 & anyrecentopioids_v3==1
replace anyrecentopioids_qu4=1 if visit4_qu==4 & anyrecentopioids_v4==1
replace anyrecentopioids_qu4=1 if visit5_qu==4 & anyrecentopioids_v5==1
replace anyrecentopioids_qu4=1 if visit6_qu==4 & anyrecentopioids_v6==1

list anyrecentopioids_qu4 anyrecentopioids_v1 visit1_qu anyrecentopioids_v2 visit2_qu anyrecentopioids_v3 visit3_qu anyrecentopioids_v4 visit4_qu anyrecentopioids_v5 visit5_qu anyrecentopioids_v6 visit6_qu

gen abstinentopioids_qu1 = .
gen abstinentopioids_qu2 = .
gen abstinentopioids_qu3 = .
gen abstinentopioids_qu4 = .

label variable abstinentopioids_qu1 "Subject reported abstinence from heroin, methadone, and analgesics for one or more quarter"
label variable abstinentopioids_qu2 "Subject reported abstinence from heroin, methadone, and analgesics for two or more consecutive quarters"
label variable abstinentopioids_qu3 "Subject reported abstinence from heroin, methadone, and analgesics for three or more consecutive quarters"
label variable abstinentopioids_qu4 "Subject reported abstinence from heroin, methadone, and analgesics for four consecutive quarters"

label values abstinentopioids_qu1 no_yes
label values abstinentopioids_qu2 no_yes
label values abstinentopioids_qu3 no_yes
label values abstinentopioids_qu4 no_yes

replace abstinentopioids_qu1=0 if anyrecentopioids_qu1==1 
replace abstinentopioids_qu2=0 if anyrecentopioids_qu1==1 | anyrecentopioids_qu2==1
replace abstinentopioids_qu3=0 if anyrecentopioids_qu1==1 | anyrecentopioids_qu2==1 | anyrecentopioids_qu3==1
replace abstinentopioids_qu4=0 if anyrecentopioids_qu1==1 | anyrecentopioids_qu2==1 | anyrecentopioids_qu3==1 | anyrecentopioids_qu4==1

replace abstinentopioids_qu1=1 if anyrecentopioids_qu1==0 
replace abstinentopioids_qu2=1 if anyrecentopioids_qu1==0 & anyrecentopioids_qu2==0
replace abstinentopioids_qu3=1 if anyrecentopioids_qu1==0 & anyrecentopioids_qu2==0 & anyrecentopioids_qu3==0
replace abstinentopioids_qu4=1 if anyrecentopioids_qu1==0 & anyrecentopioids_qu2==0 & anyrecentopioids_qu3==0 & anyrecentopioids_qu4==0

list abstinentopioids_qu1 anyrecentopioids_qu1
list abstinentopioids_qu2 anyrecentopioids_qu1 anyrecentopioids_qu2
list abstinentopioids_qu3 anyrecentopioids_qu1 anyrecentopioids_qu2 anyrecentopioids_qu3
list abstinentopioids_qu4 anyrecentopioids_qu1 anyrecentopioids_qu2 anyrecentopioids_qu3 anyrecentopioids_qu4

*Age:

clonevar age = bc2

fre age
replace bc2=. if bc2==99

*Race/ethnicity:

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

label variable white "Subject identifies as non-hispanic/non-latino white"
label variable black "Subject identifies as African-American/black"
label variable latino "Subject identifies as hispanic/latino white"
label variable asian_and_other "Subject does not identify as white or African-American/black"

label values white no_yes
label values black no_yes
label values latino no_yes
label values asian_and_other no_yes

*Primary language:

label define bc6 1 "english" 2 "spanish"
label values bc6 bc6

fre bc6
tab bc6 bc3
**About half of latinos claim Spanish as primary language and other half claim English.

tab bc6, generate(english)
drop english2 
rename english1 english
tab english bc6

label variable english "Subject speaks English as primary language"
label values english no_yes

*Gender:

label define bc8 1 "male" 2 "female" 3 "transgender"
label values bc8 bc8

fre bc8
tab bc8, generate(gender)
rename gender1 male
label variable male "Subject is male"
label values male no_yes
tab bc8 male

*Sexual Orientation:

label define bc9 1 "straight/heterosexual" 2 "gay/lesbian/homosexual" 3 "bisexual" 8 "don't know"
label values bc9 bc9

fre bc9
tab bc9 bc40a if male==1
**Majority of heterosexual men said they did not get HIV from sex with men (5/254 said they did)
tab bc9 bc40b if gender2==1
**Majority of heterosexual women said they did not get HIV from sex with women (3/113 said they did)

tabulate bc9, generate(heterosexual)
drop heterosexual2 heterosexual3 heterosexual4 
rename heterosexual1 heterosexual

label variable heterosexual "Subject describes sexual orientation as straight/heterosexual"
label values heterosexual no_yes
tab heterosexual bc9

*Married:

label define bc7 1 "never married" 2 "married or living with partner" 3 "separated" 4 "divorced" 5 "widowed"
label values bc7 bc7

fre bc7
tab bc7 bc18b
**Some people "married or living with partner" say they are not living with partner
**Small amount of people "separate" or "divorced" say they are living with partner


tab bc7, generate(married)
drop married1 married3 married4 married5 
rename married2 married

label variable married "Subject describes current marital status as married or living with partner"
label values married no_yes
tab married bc7

*Lives alone:

tab bc15 bc18a
**2 of 109 people who reported living alone (bc18) said they stayed with family/friends. These individuals kept in alone category.
tab bc20 bc18a
**3 of 113 people who reported living alone (bc18) said they were responsible for daily care of children. Individuals kept in alone category.

clonevar alone = bc18a
recode alone 8=.a

label variable alone "Subject reports living alone"
label values alone no_yes
tab alone bc15

*Homelessness:

label values bc14 no_yes
clonevar homeless = bc14
replace homeless=.a if bc14==8

label define bc15 1 "homeless (living on the street, in a park, in a bus station, etc)" 2 "in a shelter" 3 "transitional (time-limited) single-room occupancy hotel" 4 "permanent single-room occupancy hotel" 5 "HIV/AIDS housing/group home" 6 "drug treatment facility" 7 "other residential facility or institution (e.g. healthcare facility or halfway house)" 8 "staying with family/friends" 9 "rent and apartment/house (alone or with others)" 10 "own my home" 11 "other" 88 "don't know" 99 "refused" .a "don't know" .b "refused"
label values bc15 bc15
replace bc15=.a if bc15==88
replace bc15=.b if bc15==99

tab homeless bc15
**9 of 112 people who reported they were homeless (bc14) also reported that they rented an apartment or house. Individuals kept in homeless category.

*High school diploma or more:

label define bc10 1 "8th grade or less" 2 "some high school" 3 "GED" 4 "high school graduate" 5 "some college" 6 "college graduate"
label values bc10 bc10

fre bc10
recode bc10 1/2=0 3/6=1, generate(hsdiploma)
label variable hsdiploma "Does person have at a least a high school diploma or equivalent?"
label values hsdiploma no_yes
tab bc10 hsdiploma

*Employed:

label define bc12 1 "full-time (35 hours/week or more)" 2 "part-time (less than 35 hours/week, on regular basis)" 3 "occasional work" 7 "does not apply" 9 "refused"
label values bc12 bc12

tab bc11 bc12
list pid if bc12==7 & bc11==1
**1 of 103 people who reported they were employed (bc11) was listed as "does not apply" under variable for type of paid work (bc12). Individual kept in.

tabulate bc11, generate(employed)
drop employed1 
rename employed2 employed
label variable employed "Subject works for pay"
label values employed no_yes
fre employed

*Ever diagnosed with mental illness:

clonevar mentaldiag = bc91
label values mentaldiag no_yes
fre mentaldiag
recode mentaldiag 8=.a
**.a == "don't know"


*Depression Scale:

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

**Adjusted scale to values ranging from 0-3 as with CES-D and reversed questions 5 and 8:
recode depression1 depression2 depression3 depression4 depression6 depression7 depression9 depression10 (1=0)(2=1)(3=2)(4=3)
tab depression1 bc81
recode depression5 depression8 (4=0)(3=1)(2=2)(1=3)
tab depression5 bc85

**Counted number of missing answers in order to exclude those that had more than 20% missing:
egen float cesdmissing = rowmiss(depression1 depression2 depression3 depression4 depression5 depression6 depression7 depression8 depression9 depression10)

**Took average of depression question responses and standardized to a 0-100 scale:
egen float cesdmean = rowmean(depression1 depression2 depression3 depression4 depression5 depression6 depression7 depression8 depression9 depression10) if cesdmissing < 3
generate cesdstandardmean = cesdmean/3*100
label variable cesdstandardmean "Standardized depression score, 0 = minimally depressed and 100 = very depressed"

*Alcohol use composite score:

**Cloned questions pertaining to the ASI composite score for alcohol use:
**Divided question scores by their highest possible answers:
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

**Counted number of missing answers for each subject in order to exclude those that had more than 40% answers missing:
egen float asialcmissing = rowmiss(asialc1 asialc2 asialc3 asialc4 asialc5)

**Took average of alcohol question scores and standardized to a 0-100 scale:
egen float asialcscore = rowmean(asialc1 asialc2 asialc3 asialc4 asialc5) if asialcmissing<3 
replace asialcscore = asialcscore*100
label variable cesdstandardmean "Standardized composite score for alcohol use (out of 100)"
fre asialcscore

*Drug use composite score:

**Cloned questions pertaining to the ASI composite score for drug use:
**Divided question scores by their highest possible answers:
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

**Counted number of missing answers for each subject in order to exclude those that had more than 20% answers missing:
egen float asidrugmissing = rowmiss(asidrug1 asidrug2 asidrug3 asidrug4 asidrug5 asidrug6 asidrug7 asidrug8 asidrug9 asidrug10 asidrug11 asidrug12 asidrug13 asidrug14)

**Took average of drug question scores and standardized to a 0-100 scale:
egen float asidrugscore = rowmean(asidrug1 asidrug2 asidrug3 asidrug4 asidrug5 asidrug6 asidrug7 asidrug8 asidrug9 asidrug10 asidrug11 asidrug12 asidrug13 asidrug14) if asidrugmissing<3
replace asidrugscore = asidrugscore*100
label variable asidrugscore "Standardized composite score for drug use (out of 100)"
fre asidrugscore

*Ever injected drugs:

tab bc103r, generate(injectheroin)
drop injectheroin1 injectheroin2 injectheroin3 injectheroin6 injectheroin7
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
drop injectinhal1 injectinhal2 injectinhal3 injectinhal5 injectinhal6
rename injectinhal4 injectinhal

tab bc107r, generate(injectsedative)
drop injectsedative1 injectsedative4 injectsedative5
rename injectsedative2 injectsedative1
rename injectsedative3 injectsedative2

recode injectsedative2 injectsedative1 injectinhal injecthalluc injectamph2 injectamph1 injectcocaine2 injectcocaine1 injectotherpk2 injectotherpk1 injectmethadone injectheroin2 injectheroin1 (. = 0) (0=0)(1=1)

generate numinjectdrugs =  injectheroin1+ injectheroin2+ injectmethadone+ injectotherpk1+ injectotherpk2+ injectcocaine1+ injectcocaine2+ injectamph1+ injectamph2+ injecthalluc+ injectinhal+ injectsedative1+ injectsedative2
label variable numinjectdrugs "How many drugs does person inject?"

recode numinjectdrugs (0 = 0) (1 =1) (2=1) (3=1) (4=1) (5=1), generate(injectdrugs)
label variable injectdrugs "Has person injected any drugs before?"
label values injectdrugs no_yes

**27 of 115 people who did not report injection as typical route of administration and did not report injecting drugs as likely means of acquiring HIV, reported sharing a needle (ShareNd). These people were added to the injectdrugs variable:
tab injectdrugs bc40c
replace injectdrugs=1 if bc40c==1

tab injectdrugs sharend
replace injectdrugs=1 if sharend==1

*Ever used specific drugs:

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
label variable everalcintox "Subject has ever drunk alcohol to intoxication"
label values everalcintox no_yes

replace everheroin = 0 if bc103y == 0
replace everheroin = 1 if bc103y > 0
label variable everheroin "Subject has ever used heroin"
label values everheroin no_yes

replace evermethadone = 0 if bc104y == 0
replace evermethadone = 1 if bc104y > 0
label variable evermethadone "Subject has ever used methadone"
label values evermethadone no_yes

replace everotherpk = 0 if bc105y == 0
replace everotherpk = 1 if bc105y > 0
label variable everotherpk "Subject has ever used other opioids or analgesics"
label values everotherpk no_yes

replace everanyopioid=0 if everheroin==0 & evermethadone==0 & everotherpk==0
replace everanyopioid=1 if everheroin==1 | evermethadone==1 | everotherpk==1
label variable everanyopioid "Subject has ever used heroin, methadone, analgesics"
label values everanyopioid no_yes

replace eversedative = 0 if bc107y == 0
replace eversedative = 1 if bc107y > 0
label variable eversedative "Subject has ever used sedatives"
label values eversedative no_yes

replace evercocaine = 0 if bc108y == 0
replace evercocaine = 1 if bc108y > 0
label variable evercocaine "Subject has ever used cocaine"
label values evercocaine no_yes

replace evermarijuana = 0 if bc110y == 0
replace evermarijuana = 1 if bc110y > 0
label variable evermarijuana "Subject has ever used marijuana"
label values evermarijuana no_yes


*Recent drug use:

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
label variable recentalcintox "Subject has used alcohol to intoxication in the last 30 days"
label values recentalcintox no_yes
**12.5% of those who reported zero years of regular alcohol use to intoxication, reported recent alcohol use to intoxication

replace recentheroin = .a if bc103d == 92
replace recentheroin = 0 if bc103d == 0
replace recentheroin = 1 if bc103d > 0
label variable recentheroin "Subject has used heroin in the past 30 days"
label values recentheroin no_yes
**15% of those who reported zero years of regular heroin use, reported recent heroin use

replace recentmethadone = 0 if bc104d == 0
replace recentmethadone = 0 if bc104d == 0
replace recentmethadone = 1 if bc104d > 0
label variable recentmethadone "Subject has used methadone in the past 30 days"
label values recentmethadone no_yes
**13.5% of those who reported zero years of regular methadone use, reported recent methadone use

replace recentotherpk = 0 if bc105d == 0
replace recentotherpk = 1 if bc105d > 0
label variable recentotherpk "Subject has used other opioids or analgesics in the past 30 days"
label values recentotherpk no_yes
**11.0% of those who reported zero years of regular other painkiller use, reported recent other painkiller use

replace recentsedative = .a if bc107d == 98
replace recentsedative = 0 if bc107d == 0
replace recentsedative = 1 if bc107d > 0
label variable recentsedative "Subject has used sedatives in the past 30 days"
label values recentsedative no_yes
**6.5% of those who reported zero years of regular sedative use, reported recent sedative use

replace recentcocaine = 0 if bc108d == 0
replace recentcocaine = 1 if bc108d > 0
label variable recentcocaine "Subject has used cocaine in the past 30 days"
label values recentcocaine no_yes
**12.1% of those who reported zero years of regular cocaine use, reported recent cocaine use

replace recentmarijuana = 0 if bc110d == 0
replace recentmarijuana = 1 if bc110d > 0
label variable recentmarijuana "Subject has used marijuana in the past 30 days"
label values recentmarijuana no_yes
**7.0% of those who reported zero years of regular marijuana use, reported recent marijuana use

*Years of regular drug use:

clonevar yearsheroin = bc103y
clonevar yearsmethadone = bc104y

fre yearsheroin
fre yearsmethadone

**One subject is coded to have used heroin regularly for 55 years. However, the oldest subject in the study is 60. The oldest subject would have needed to start using at age 5 in order to be regularly using for 55 years. Recoding the 55 observation as missing:
recode yearsheroin 55=. 99=.b
recode yearsmethadone 88=.

egen float years_any_opioid = rowmax(yearsheroin yearsmethadone)
list yearsheroin yearsmethadone years_any_opioid recentincar_base
label variable years_any_opioid "Longest number of years using either heroin or methadone"

*Number of times overdosed on drugs:

clonevar overdosed = bc115
fre overdosed

*Number of times treated for drug use:

fre bc118
clonevar treatedfordrugs = bc118
recode treatedfordrugs 999=.b
label variable years_any_opioid "Number of times treated for drug abuse"

*Methadone treatment in previous three months:

fre bc144
clonevar recentmethadonetx = bc144
recode recentmethadonetx 8=.a
label values recentmethadonetx no_yes

*export delimited pid everincar_base recentincar_base recentincar_qu1 recentincar_qu2 recentincar_qu3 recentincar_qu4 newrecentincar_qu1 newrecentincar_qu2 newrecentincar_qu3 newrecentincar_qu4 retention1q retention2q retention3q retention4q recentopioids_base recentopioids_qu1 recentopioids_qu2 recentopioids_qu3 recentopioids_qu4 anyrecentopioids_base anyrecentopioids_qu1 anyrecentopioids_qu2 anyrecentopioids_qu3 anyrecentopioids_qu4 age white black latino asian_and_other english male heterosexual married alone homeless hsdiploma employed mentaldiag asialcscore asidrugscore injectdrugs everalcintox everheroin evermethadone everotherpk eversedative evercocaine evermarijuana everanyopioid recentalcintox recentheroin recentmethadone recentotherpk recentsedative recentcocaine recentmarijuana years_any_opioid overdosed treatedfordrugs recentmethadonetx using "C:\Users\riggins\Documents\einstein_materials\bupe\longitudinal_wide3_riggins.csv", replace
*codebook pid everincar_base recentincar_base recentincar_qu1 recentincar_qu2 recentincar_qu3 recentincar_qu4 newrecentincar_qu1 newrecentincar_qu2 newrecentincar_qu3 newrecentincar_qu4 retention1q retention2q retention3q retention4q recentopioids_base recentopioids_qu1 recentopioids_qu2 recentopioids_qu3 recentopioids_qu4 anyrecentopioids_base anyrecentopioids_qu1 anyrecentopioids_qu2 anyrecentopioids_qu3 anyrecentopioids_qu4 age white black latino asian_and_other english male heterosexual married alone homeless hsdiploma employed mentaldiag asialcscore asidrugscore injectdrugs everalcintox everheroin evermethadone everotherpk eversedative evercocaine evermarijuana everanyopioid recentalcintox recentheroin recentmethadone recentotherpk recentsedative recentcocaine recentmarijuana years_any_opioid overdosed treatedfordrugs recentmethadonetx
