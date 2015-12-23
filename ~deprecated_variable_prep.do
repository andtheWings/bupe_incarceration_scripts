*Deprecated methods of defining time
rename visit_1 visit1
rename visit_2 visit2
rename visit_3 visit3
rename visit_4 visit4
rename visit_5 visit5
rename visit_6 visit6

label variable visit1 "Number of months since baseline for first follow-up visit"
label variable visit2 "Number of months since baseline for second follow-up visit"
label variable visit3 "Number of months since baseline for third follow-up visit"
label variable visit4 "Number of months since baseline for fourth follow-up visit"
label variable visit5 "Number of months since baseline for fifth follow-up visit"
label variable visit6 "Number of months since baseline for sixth follow-up visit"

fre visit1
fre visit2
fre visit3
fre visit4
fre visit5
fre visit6

replace visit1=.a if visit1<0

generate visit1_q = .
generate visit2_q = .
generate visit3_q = .
generate visit4_q = .
generate visit5_q = .
generate visit6_q = .

generate visit1_qu = .
generate visit2_qu = .
generate visit3_qu = .
generate visit4_qu = .
generate visit5_qu = .
generate visit6_qu = .

label variable visit1_q "Loose quarter assignment for first follow-up visit"
label variable visit2_q "Loose quarter assignment for second follow-up visit"
label variable visit3_q "Loose quarter assignment for third follow-up visit"
label variable visit4_q "Loose quarter assignment for fourth follow-up visit"
label variable visit5_q "Loose quarter assignment for fifth follow-up visit"
label variable visit6_q "Loose quarter assignment for sixth follow-up visit"

label variable visit1_qu "Stricter quarter assignment for first follow-up visit"
label variable visit2_qu "Stricter quarter assignment for second follow-up visit"
label variable visit3_qu "Stricter quarter assignment for third follow-up visit"
label variable visit4_qu "Stricter quarter assignment for fourth follow-up visit"
label variable visit5_qu "Stricter quarter assignment for fifth follow-up visit"
label variable visit6_qu "Stricter quarter assignment for sixth follow-up visit"

replace visit1_q = 1 if visit1<4
replace visit1_q = 2 if visit1==4
replace visit1_q = 1 if visit1==4 & visit1<visit2 & visit2<7
replace visit1_q = 1 if visit1==4 & visit1<visit2 & visit2<8 & visit2<visit3 & visit3<10
replace visit1_q = 1 if visit1==4 & visit1<visit2 & visit2<8 & visit2<visit3 & visit3<11 & visit3<visit4 & visit4<14
replace visit1_q = 2 if visit1>4 & visit1<7
replace visit1_q = 2 if visit1==7 & visit2>visit1 & visit2<10
replace visit1_q = 3 if visit1==7 & visit2>visit1 & visit2>9
replace visit1_q = 3 if visit1>7 & visit1<10
replace visit1_q = 3 if visit1==10 & visit1<visit2 & visit2<14
replace visit1_q = 4 if visit1>10 & visit1<14

replace visit1_qu = 1 if visit1<4
replace visit1_qu = 2 if visit1>3 & visit1<7
replace visit1_qu = 3 if visit1>6 & visit1<10
replace visit1_qu = 4 if visit1>9 & visit1<13

replace visit2_q = 1 if visit2<4
replace visit2_q = 2 if visit2==4 & visit1==.
replace visit2_q = 2 if visit2==4 & visit1<visit2
replace visit2_q = 2 if visit2>4 & visit2<7 & visit3>6
replace visit2_q = 2 if visit2>4 & visit2<7 & visit3==.
replace visit2_q = 3 if visit2==7
replace visit2_q = 2 if visit2==7 & visit2<visit3 & visit3<10
replace visit2_q = 2 if visit2==7 & visit2<visit3 & visit3<11 & visit3<visit4 & visit4<14
replace visit2_q = 3 if visit2>7 & visit2<10
replace visit2_q = 3 if visit2>7 & visit2<10 & visit3==.
replace visit2_q = 4 if visit2==10 & visit3>12
replace visit2_q = 3 if visit2==10 & visit2<visit3 & visit3<14
replace visit2_q = 4 if visit2>10 & visit2<14

replace visit2_qu = 1 if visit2<4
replace visit2_qu = 2 if visit2>3 & visit2<7
replace visit2_qu = 3 if visit2>6 & visit2<10
replace visit2_qu = 4 if visit2>9 & visit2<13

replace visit3_q = 1 if visit3<4
replace visit3_q = 2 if visit3==4 
replace visit3_q = 2 if visit3>3 & visit3<7 & visit2==.
replace visit3_q = 2 if visit3>4 & visit3<7
replace visit3_q = 3 if visit3==7
replace visit3_q = 2 if visit3==7 & visit3<visit4 & visit4<10
replace visit3_q = 3 if visit3>7 & visit3<10
replace visit3_q = 4 if visit3==10
replace visit3_q = 3 if visit3==10 & visit3<visit4 & visit4<14 & visit2!=8
replace visit3_q = 4 if visit3>10 & visit3<13
replace visit3_q = 4 if visit3>10 & visit3<14 & visit2<11
replace visit3_q = 4 if visit3>10 & visit3<14 & visit2==.

replace visit3_qu = 1 if visit3<4
replace visit3_qu = 2 if visit3>3 & visit3<7
replace visit3_qu = 3 if visit3>6 & visit3<10
replace visit3_qu = 4 if visit3>9 & visit3<13

replace visit4_q = 3 if visit4>7 & visit4<10 
replace visit4_q = 4 if visit4==10 & visit3<visit4
replace visit4_q = 4 if visit4==10 & visit3==.
replace visit4_q = 4 if visit4>10 & visit4<14
replace visit4_q = . if visit3>10 & visit3<13 & visit4==13

replace visit4_qu = 1 if visit4<4
replace visit4_qu = 2 if visit4>3 & visit4<7
replace visit4_qu = 3 if visit4>6 & visit4<10
replace visit4_qu = 4 if visit4>9 & visit4<13

replace visit5_q = 4 if visit5==12 | visit5==13

replace visit5_qu = 4 if visit5>9 & visit5<13

replace visit6_q = 4 if visit6==12

replace visit6_qu = 4 if visit6>9 & visit6<13

**list pid visit1 visit1_q visit2 visit2_q visit3 visit3_q visit4 visit4_q visit5 visit5_q visit6 visit6_q if drugtx==1

**Quarter assignments were manually inspected for accuracy
**Spot-checking:
replace visit1_q=1 if pid=="CC-010906027B"
replace visit2_q=2 if pid=="CC-021407073B"
replace visit3_q=3 if pid=="CC-021407073B"
replace visit2_q=2 if pid=="CC-061906052B"
replace visit1_q=1 if pid=="CC-090507084B"
replace visit2_q=2 if pid=="CC-090507084B"
replace visit3_q=3 if pid=="CC-090507084B"
replace visit2_q=2 if pid=="ERIIAY006"
replace visit2_q=2 if pid=="ERIIHN008"
replace visit1_q=1 if pid=="ERINAY012"
replace visit2_q=2 if pid=="ERINAY012"
replace visit3_q=3 if pid=="ERINAY012"
replace visit4_q=4 if pid=="ERINAY012"
replace visit1_q=1 if pid=="JH-0358"
replace visit1_q=1 if pid=="MH-IAUC25"
replace visit2_q=2 if pid=="MH-IAUC25"
replace visit1_q=1 if pid=="MH-IDAJ03"
replace visit2_q=2 if pid=="MH-IDAJ03"
replace visit3_q=3 if pid=="MH-IDAJ03"
replace visit4_q=4 if pid=="MH-IDAJ03"
replace visit1_q=1 if pid=="MH-IOUR21"
replace visit2_q=2 if pid=="MH-IOUR21"
replace visit3_q=3 if pid=="MH-IOUR21"
replace visit4_q=4 if pid=="MH-IOUR21"
replace visit2_q=. if pid=="MH-IRSG13"
replace visit1_q=. if pid=="OH.PT002.2"
replace visit1_q=1 if pid=="OH.PT003.4"
replace visit2_q=2 if pid=="OH.PT003.4"
replace visit2_q=3 if pid=="OH.PT011.3"
replace visit2_q=3 if pid=="OH.PT013.2"
replace visit3_q=4 if pid=="OH.PT013.2"
replace visit2_q=2 if pid=="SF004"
replace visit3_q=3 if pid=="SF004"
replace visit3_q=1 if pid=="YA-AAD04"
replace visit3_q=2 if pid=="YA-IOR21"
replace visit4_q=3 if pid=="YA-IOR21"
replace visit1_q=1 if pid=="YS-22022"

clonevar everincar_base = bc31
label variable everincar_base "Subject reported at baseline having ever been incarcerated for more than 3 days"
label values everincar_base no_yes

clonevar recentincar_base=bc32
clonevar recentincar_v1=qc17_1
clonevar recentincar_v2=qc17_2
clonevar recentincar_v3=qc17_3
clonevar recentincar_v4=qc17_4
clonevar recentincar_v5=qc17_5
clonevar recentincar_v6=qc17_6

recode recentincar_base 2/30=1
recode recentincar_v1 2/120=1
recode recentincar_v2 2/120=1
recode recentincar_v3 2/120=1
recode recentincar_v4 2/120=1
recode recentincar_v5 2/120=1
recode recentincar_v6 2/120=1

label variable recentincar_base "Subject reported at baseline having been incarcerated in the past 30 days"
label variable recentincar_v1 "Subject reported at visit 1 having been incarcerated since baseline"
label variable recentincar_v2 "Subject reported at visit 2 having been incarcerated since visit 1"
label variable recentincar_v3 "Subject reported at visit 3 having been incarcerated since visit 2"
label variable recentincar_v4 "Subject reported at visit 4 having been incarcerated since visit 3"
label variable recentincar_v5 "Subject reported at visit 5 having been incarcerated since visit 4"
label variable recentincar_v6 "Subject reported at visit 6 having been incarcerated since visit 5"

label values recentincar_base no_yes
label values recentincar_v1 no_yes
label values recentincar_v2 no_yes
label values recentincar_v3 no_yes
label values recentincar_v4 no_yes
label values recentincar_v5 no_yes
label values recentincar_v6 no_yes

clonevar parole_base = bc29
clonevar parole_v1 = qc14_1
clonevar parole_v2 = qc14_2
clonevar parole_v3 = qc14_3
clonevar parole_v4 = qc14_4
clonevar parole_v5 = qc14_5
clonevar parole_v6 = qc14_6

replace parole_base=.a if bc29==8

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

*Criminal justice status per quarter 

gen recentincar_q1=.
gen recentincar_q2=.
gen recentincar_q3=.
gen recentincar_q4=.

gen recentincar_qu1=.
gen recentincar_qu2=.
gen recentincar_qu3=.
gen recentincar_qu4=.

replace recentincar_q1=recentincar_v1 if visit1_q==1
replace recentincar_q1=recentincar_v2 if visit2_q==1
replace recentincar_q1=recentincar_v3 if visit3_q==1
replace recentincar_q1=recentincar_v4 if visit4_q==1
replace recentincar_q1=recentincar_v5 if visit5_q==1
replace recentincar_q1=recentincar_v6 if visit6_q==1

replace recentincar_qu1=recentincar_v1 if visit1_qu==1
replace recentincar_qu1=recentincar_v2 if visit2_qu==1
replace recentincar_qu1=recentincar_v3 if visit3_qu==1
replace recentincar_qu1=recentincar_v4 if visit4_qu==1
replace recentincar_qu1=recentincar_v5 if visit5_qu==1
replace recentincar_qu1=recentincar_v6 if visit6_qu==1

fre recentincar_q1
*no=169, yes=11
fre recentincar_v1 if visit1_q==1
fre recentincar_v2 if visit2_q==1
fre recentincar_v3 if visit3_q==1
fre recentincar_v4 if visit4_q==1
fre recentincar_v5 if visit5_q==1
fre recentincar_v6 if visit6_q==1
*no=169, yes=11

replace recentincar_q2=recentincar_v1 if visit1_q==2
replace recentincar_q2=recentincar_v2 if visit2_q==2
replace recentincar_q2=recentincar_v3 if visit3_q==2
replace recentincar_q2=recentincar_v4 if visit4_q==2
replace recentincar_q2=recentincar_v5 if visit5_q==2
replace recentincar_q2=recentincar_v6 if visit6_q==2

replace recentincar_qu2=recentincar_v1 if visit1_qu==2
replace recentincar_qu2=recentincar_v2 if visit2_qu==2
replace recentincar_qu2=recentincar_v3 if visit3_qu==2
replace recentincar_qu2=recentincar_v4 if visit4_qu==2
replace recentincar_qu2=recentincar_v5 if visit5_qu==2
replace recentincar_qu2=recentincar_v6 if visit6_qu==2

fre recentincar_q2
*no=148, yes=27
fre recentincar_v1 if visit1_q==2
fre recentincar_v2 if visit2_q==2
fre recentincar_v3 if visit3_q==2
fre recentincar_v4 if visit4_q==2
fre recentincar_v5 if visit5_q==2
fre recentincar_v6 if visit6_q==2
*no=148, yes=27

replace recentincar_q3=recentincar_v1 if visit1_q==3
replace recentincar_q3=recentincar_v2 if visit2_q==3
replace recentincar_q3=recentincar_v3 if visit3_q==3
replace recentincar_q3=recentincar_v4 if visit4_q==3
replace recentincar_q3=recentincar_v5 if visit5_q==3
replace recentincar_q3=recentincar_v6 if visit6_q==3

replace recentincar_qu3=recentincar_v1 if visit1_qu==3
replace recentincar_qu3=recentincar_v2 if visit2_qu==3
replace recentincar_qu3=recentincar_v3 if visit3_qu==3
replace recentincar_qu3=recentincar_v4 if visit4_qu==3
replace recentincar_qu3=recentincar_v5 if visit5_qu==3
replace recentincar_qu3=recentincar_v6 if visit6_qu==3

fre recentincar_q3
*no=153, yes=14
fre recentincar_v1 if visit1_q==3
fre recentincar_v2 if visit2_q==3
fre recentincar_v3 if visit3_q==3
fre recentincar_v4 if visit4_q==3
fre recentincar_v5 if visit5_q==3
fre recentincar_v6 if visit6_q==3
*no=153, yes=14

replace recentincar_q4=recentincar_v1 if visit1_q==4
replace recentincar_q4=recentincar_v2 if visit2_q==4
replace recentincar_q4=recentincar_v3 if visit3_q==4
replace recentincar_q4=recentincar_v4 if visit4_q==4
replace recentincar_q4=recentincar_v5 if visit5_q==4
replace recentincar_q4=recentincar_v6 if visit6_q==4

replace recentincar_qu4=recentincar_v1 if visit1_qu==4
replace recentincar_qu4=recentincar_v2 if visit2_qu==4
replace recentincar_qu4=recentincar_v3 if visit3_qu==4
replace recentincar_qu4=recentincar_v4 if visit4_qu==4
replace recentincar_qu4=recentincar_v5 if visit5_qu==4
replace recentincar_qu4=recentincar_v6 if visit6_qu==4

fre recentincar_q4
*no=150, yes=22
fre recentincar_v1 if visit1_q==4
fre recentincar_v2 if visit2_q==4
fre recentincar_v3 if visit3_q==4
fre recentincar_v4 if visit4_q==4
fre recentincar_v5 if visit5_q==4
fre recentincar_v6 if visit6_q==4
*no=150, yes=22

gen recentincar_allq = 0
replace recentincar_allq = 1 if recentincar_q1==1 | recentincar_q2==1 | recentincar_q3==1 | recentincar_q4==1
replace recentincar_allq = . if recentincar_q1==. & recentincar_q2==. & recentincar_q3==. & recentincar_q4==.

gen recentincar_allqu = 0
replace recentincar_allqu = 1 if recentincar_qu1==1 | recentincar_qu2==1 | recentincar_qu3==1 | recentincar_qu4==1
replace recentincar_allqu = . if recentincar_qu1==. & recentincar_qu2==. & recentincar_qu3==. & recentincar_qu4==.

label variable recentincar_q1 "Subject reported being incarcerated in 30 days before (loose) quarter one visit"
label variable recentincar_q2 "Subject reported being incarcerated in 30 days before (loose) quarter two visit"
label variable recentincar_q3 "Subject reported being incarcerated in 30 days before (loose) quarter three visit"
label variable recentincar_q4 "Subject reported being incarcerated in 30 days before (loose) quarter four visit"
label variable recentincar_allq "Subject reported being incarcerated in 30 days before any of the (loose) quarterly visits"

label variable recentincar_qu1 "Subject reported being incarcerated in 30 days before (strict) quarter one visit"
label variable recentincar_qu2 "Subject reported being incarcerated in 30 days before (strict) quarter two visit"
label variable recentincar_qu3 "Subject reported being incarcerated in 30 days before (strict) quarter three visit"
label variable recentincar_qu4 "Subject reported being incarcerated in 30 days before (strict) quarter four visit"
label variable recentincar_allqu "Subject reported being incarcerated in 30 days before any of the (strict) quarterly visits"

label values recentincar_q1 no_yes
label values recentincar_q2 no_yes
label values recentincar_q3 no_yes
label values recentincar_q4 no_yes
label values recentincar_allq no_yes

label values recentincar_qu1 no_yes
label values recentincar_qu2 no_yes
label values recentincar_qu3 no_yes
label values recentincar_qu4 no_yes
label values recentincar_allqu no_yes

gen parole_q1=.
gen parole_q2=.
gen parole_q3=.
gen parole_q4=.

gen parole_qu1=.
gen parole_qu2=.
gen parole_qu3=.
gen parole_qu4=.

replace parole_q1=parole_v1 if visit1_q==1
replace parole_q1=parole_v2 if visit2_q==1
replace parole_q1=parole_v3 if visit3_q==1
replace parole_q1=parole_v4 if visit4_q==1
replace parole_q1=parole_v5 if visit5_q==1
replace parole_q1=parole_v6 if visit6_q==1

replace parole_qu1=parole_v1 if visit1_qu==1
replace parole_qu1=parole_v1 if visit2_qu==1
replace parole_qu1=parole_v1 if visit3_qu==1
replace parole_qu1=parole_v1 if visit4_qu==1
replace parole_qu1=parole_v1 if visit5_qu==1
replace parole_qu1=parole_v1 if visit6_qu==1

replace parole_q2=parole_v1 if visit1_q==2
replace parole_q2=parole_v2 if visit2_q==2
replace parole_q2=parole_v3 if visit3_q==2
replace parole_q2=parole_v4 if visit4_q==2
replace parole_q2=parole_v5 if visit5_q==2
replace parole_q2=parole_v6 if visit6_q==2

replace parole_qu2=parole_v1 if visit1_qu==2
replace parole_qu2=parole_v1 if visit2_qu==2
replace parole_qu2=parole_v1 if visit3_qu==2
replace parole_qu2=parole_v1 if visit4_qu==2
replace parole_qu2=parole_v1 if visit5_qu==2
replace parole_qu2=parole_v1 if visit6_qu==2

replace parole_q3=parole_v1 if visit1_q==3
replace parole_q3=parole_v2 if visit2_q==3
replace parole_q3=parole_v3 if visit3_q==3
replace parole_q3=parole_v4 if visit4_q==3
replace parole_q3=parole_v5 if visit5_q==3
replace parole_q3=parole_v6 if visit6_q==3

replace parole_qu3=parole_v1 if visit1_qu==3
replace parole_qu3=parole_v1 if visit2_qu==3
replace parole_qu3=parole_v1 if visit3_qu==3
replace parole_qu3=parole_v1 if visit4_qu==3
replace parole_qu3=parole_v1 if visit5_qu==3
replace parole_qu3=parole_v1 if visit6_qu==3

replace parole_q4=parole_v1 if visit1_q==4
replace parole_q4=parole_v2 if visit2_q==4
replace parole_q4=parole_v3 if visit3_q==4
replace parole_q4=parole_v4 if visit4_q==4
replace parole_q4=parole_v5 if visit5_q==4
replace parole_q4=parole_v6 if visit6_q==4

replace parole_qu4=parole_v1 if visit1_qu==4
replace parole_qu4=parole_v1 if visit2_qu==4
replace parole_qu4=parole_v1 if visit3_qu==4
replace parole_qu4=parole_v1 if visit4_qu==4
replace parole_qu4=parole_v1 if visit5_qu==4
replace parole_qu4=parole_v1 if visit6_qu==4

*Opioid Use per Visit

egen float recentopioids_base = rowmax(bc103d bc104d bc105d)
egen float recentopioids_v1 = rowmax(qc83d_1 qc84d_1 qc85d_1)
egen float recentopioids_v2 = rowmax(qc83d_2 qc84d_2 qc85d_2)
egen float recentopioids_v3 = rowmax(qc83d_3 qc84d_3 qc85d_3)
egen float recentopioids_v4 = rowmax(qc83d_4 qc84d_4 qc85d_4)
egen float recentopioids_v5 = rowmax(qc83d_5 qc84d_5 qc85d_5)
egen float recentopioids_v6 = rowmax(qc83d_6 qc84d_6 qc85d_6)

**fre recentopioids_base
replace recentopioids_base=.a if recentopioids_base==92

label variable recentopioids_base "Days of opioid use in 30 days before baseline"
label variable recentopioids_v1 "Days of opioid use in 30 days before followup visit 1"
label variable recentopioids_v2 "Days of opioid use in 30 days before followup visit 2"
label variable recentopioids_v3 "Days of opioid use in 30 days before followup visit 3"
label variable recentopioids_v4 "Days of opioid use in 30 days before followup visit 4"
label variable recentopioids_v5 "Days of opioid use in 30 days before followup visit 5"
label variable recentopioids_v6 "Days of opioid use in 30 days before followup visit 6"

gen anyrecentopioids_base = 0
gen anyrecentopioids_v1 = 0
gen anyrecentopioids_v2 = 0
gen anyrecentopioids_v3 = 0
gen anyrecentopioids_v4 = 0
gen anyrecentopioids_v5 = 0
gen anyrecentopioids_v6 = 0

replace anyrecentopioids_base=1 if recentopioids_base>0
replace anyrecentopioids_v1=1 if recentopioids_v1>0
replace anyrecentopioids_v2=1 if recentopioids_v2>0
replace anyrecentopioids_v3=1 if recentopioids_v3>0
replace anyrecentopioids_v4=1 if recentopioids_v4>0
replace anyrecentopioids_v5=1 if recentopioids_v5>0
replace anyrecentopioids_v6=1 if recentopioids_v6>0

replace anyrecentopioids_base=. if recentopioids_base==.
replace anyrecentopioids_v1=. if recentopioids_v1==.
replace anyrecentopioids_v2=. if recentopioids_v2==.
replace anyrecentopioids_v3=. if recentopioids_v3==.
replace anyrecentopioids_v4=. if recentopioids_v4==.
replace anyrecentopioids_v5=. if recentopioids_v5==.
replace anyrecentopioids_v6=. if recentopioids_v6==.

label variable anyrecentopioids_base "Any opioid use in 30 days before baseline"
label variable anyrecentopioids_v1 "Any opioid use in 30 days before followup visit 1"
label variable anyrecentopioids_v2 "Any opioid use in 30 days before followup visit 2"
label variable anyrecentopioids_v3 "Any opioid use in 30 days before followup visit 3"
label variable anyrecentopioids_v4 "Any opioid use in 30 days before followup visit 4"
label variable anyrecentopioids_v5 "Any opioid use in 30 days before followup visit 5"
label variable anyrecentopioids_v6 "Any opioid use in 30 days before followup visit 6"

label values anyrecentopioids_base no_yes
label values anyrecentopioids_v1 no_yes
label values anyrecentopioids_v2 no_yes
label values anyrecentopioids_v3 no_yes
label values anyrecentopioids_v4 no_yes
label values anyrecentopioids_v5 no_yes
label values anyrecentopioids_v6 no_yes

*Quarterly Opioid Use

gen recentopioids_q1=.
gen recentopioids_q2=.
gen recentopioids_q3=.
gen recentopioids_q4=.

gen recentopioids_qu1=.
gen recentopioids_qu2=.
gen recentopioids_qu3=.
gen recentopioids_qu4=.

replace recentopioids_q1=recentopioids_v1 if visit1_q==1
replace recentopioids_q1=recentopioids_v2 if visit2_q==1
replace recentopioids_q1=recentopioids_v3 if visit3_q==1
replace recentopioids_q1=recentopioids_v4 if visit4_q==1
replace recentopioids_q1=recentopioids_v5 if visit5_q==1
replace recentopioids_q1=recentopioids_v6 if visit6_q==1
replace recentopioids_q1 = . if visit1_q != 1 & visit2_q != 1 & visit3_q != 1 & visit4_q != 1 & visit5_q != 1 & visit6_q != 1

replace recentopioids_qu1=recentopioids_v1 if visit1_qu==1
replace recentopioids_qu1=recentopioids_v2 if visit2_qu==1
replace recentopioids_qu1=recentopioids_v3 if visit3_qu==1
replace recentopioids_qu1=recentopioids_v4 if visit4_qu==1
replace recentopioids_qu1=recentopioids_v5 if visit5_qu==1
replace recentopioids_qu1=recentopioids_v6 if visit6_qu==1
replace recentopioids_qu1 = . if visit1_qu != 1 & visit2_qu != 1 & visit3_qu != 1 & visit4_qu != 1 & visit5_qu != 1 & visit6_qu != 1

*fre recentopioids_q1 
**0=114, total non-missing=199
*fre recentopioids_v1 if visit1_q==1
*fre recentopioids_v2 if visit2_q==1
*fre recentopioids_v3 if visit3_q==1
*fre recentopioids_v4 if visit4_q==1
*fre recentopioids_v5 if visit5_q==1
*fre recentopioids_v6 if visit6_q==1
**0=114, total non-missing=199

replace recentopioids_q2=recentopioids_v1 if visit1_q==2
replace recentopioids_q2=recentopioids_v2 if visit2_q==2
replace recentopioids_q2=recentopioids_v3 if visit3_q==2
replace recentopioids_q2=recentopioids_v4 if visit4_q==2
replace recentopioids_q2=recentopioids_v5 if visit5_q==2
replace recentopioids_q2=recentopioids_v6 if visit6_q==2
replace recentopioids_q2=. if visit1_q != 2 & visit2_q != 2 & visit3_q != 2 & visit4_q != 2 & visit5_q != 2 & visit6_q != 2

replace recentopioids_qu2=recentopioids_v1 if visit1_qu==2
replace recentopioids_qu2=recentopioids_v2 if visit2_qu==2
replace recentopioids_qu2=recentopioids_v3 if visit3_qu==2
replace recentopioids_qu2=recentopioids_v4 if visit4_qu==2
replace recentopioids_qu2=recentopioids_v5 if visit5_qu==2
replace recentopioids_qu2=recentopioids_v6 if visit6_qu==2
replace recentopioids_qu2 = . if visit1_qu != 2 & visit2_qu != 2 & visit3_qu != 2 & visit4_qu != 2 & visit5_qu != 2 & visit6_qu != 2

*fre recentopioids_q2 
**0=119, total non-missing=193
*fre recentopioids_v1 if visit1_q==2
*fre recentopioids_v2 if visit2_q==2
*fre recentopioids_v3 if visit3_q==2
*fre recentopioids_v4 if visit4_q==2
*fre recentopioids_v5 if visit5_q==2
*fre recentopioids_v6 if visit6_q==2
**0=119, total non-missing=193

replace recentopioids_q3=recentopioids_v1 if visit1_q==3
replace recentopioids_q3=recentopioids_v2 if visit2_q==3
replace recentopioids_q3=recentopioids_v3 if visit3_q==3
replace recentopioids_q3=recentopioids_v4 if visit4_q==3
replace recentopioids_q3=recentopioids_v5 if visit5_q==3
replace recentopioids_q3=recentopioids_v6 if visit6_q==3
replace recentopioids_q3=. if visit1_q != 3 & visit2_q != 3 & visit3_q != 3 & visit4_q != 3 & visit5_q != 3 & visit6_q != 3

replace recentopioids_qu3=recentopioids_v1 if visit1_qu==3
replace recentopioids_qu3=recentopioids_v2 if visit2_qu==3
replace recentopioids_qu3=recentopioids_v3 if visit3_qu==3
replace recentopioids_qu3=recentopioids_v4 if visit4_qu==3
replace recentopioids_qu3=recentopioids_v5 if visit5_qu==3
replace recentopioids_qu3=recentopioids_v6 if visit6_qu==3
replace recentopioids_qu3 = . if visit1_qu != 3 & visit2_qu != 3 & visit3_qu != 3 & visit4_qu != 3 & visit5_qu != 3 & visit6_qu != 3

*fre recentopioids_q3
**0=100, total non-missing=179
*fre recentopioids_v1 if visit1_q==3
*fre recentopioids_v2 if visit2_q==3
*fre recentopioids_v3 if visit3_q==3
*fre recentopioids_v4 if visit4_q==3
*fre recentopioids_v5 if visit5_q==3
*fre recentopioids_v6 if visit6_q==3
**0=100, total non-missing=179

replace recentopioids_q4=recentopioids_v1 if visit1_q==4
replace recentopioids_q4=recentopioids_v2 if visit2_q==4
replace recentopioids_q4=recentopioids_v3 if visit3_q==4
replace recentopioids_q4=recentopioids_v4 if visit4_q==4
replace recentopioids_q4=recentopioids_v5 if visit5_q==4
replace recentopioids_q4=recentopioids_v6 if visit6_q==4
replace recentopioids_q4=. if visit1_q != 4 & visit2_q != 4 & visit3_q != 4 & visit4_q != 4 & visit5_q != 4 & visit6_q != 4

replace recentopioids_qu4=recentopioids_v1 if visit1_qu==4
replace recentopioids_qu4=recentopioids_v2 if visit2_qu==4
replace recentopioids_qu4=recentopioids_v3 if visit3_qu==4
replace recentopioids_qu4=recentopioids_v4 if visit4_qu==4
replace recentopioids_qu4=recentopioids_v5 if visit5_qu==4
replace recentopioids_qu4=recentopioids_v6 if visit6_qu==4
replace recentopioids_qu4 = . if visit1_qu != 4 & visit2_qu != 4 & visit3_qu != 4 & visit4_qu != 4 & visit5_qu != 4 & visit6_qu != 4

*fre recentopioids_q4
**0=106, total non-missing=185
*fre recentopioids_v1 if visit1_q==4
*fre recentopioids_v2 if visit2_q==4
*fre recentopioids_v3 if visit3_q==4
*fre recentopioids_v4 if visit4_q==4
*fre recentopioids_v5 if visit5_q==4
*fre recentopioids_v6 if visit6_q==4
**0=106, total non-missing=185

label variable recentopioids_q1 "Days of opioid use in 30 days before followup in quarter 1"
label variable recentopioids_q2 "Days of opioid use in 30 days before followup in quarter 2"
label variable recentopioids_q3 "Days of opioid use in 30 days before followup in quarter 3"
label variable recentopioids_q4 "Days of opioid use in 30 days before followup in quarter 4"

gen anyrecentopioids_q1 = 0
gen anyrecentopioids_q2 = 0
gen anyrecentopioids_q3 = 0
gen anyrecentopioids_q4 = 0

gen anyrecentopioids_qu1 = 0
gen anyrecentopioids_qu2 = 0
gen anyrecentopioids_qu3 = 0
gen anyrecentopioids_qu4 = 0

replace anyrecentopioids_q1=1 if recentopioids_q1>0
replace anyrecentopioids_q2=1 if recentopioids_q2>0
replace anyrecentopioids_q3=1 if recentopioids_q3>0
replace anyrecentopioids_q4=1 if recentopioids_q4>0

replace anyrecentopioids_qu1=1 if recentopioids_qu1>0
replace anyrecentopioids_qu2=1 if recentopioids_qu2>0
replace anyrecentopioids_qu3=1 if recentopioids_qu3>0
replace anyrecentopioids_qu4=1 if recentopioids_qu4>0

replace anyrecentopioids_qu1=. if recentopioids_qu1==.
replace anyrecentopioids_qu2=. if recentopioids_qu2==.
replace anyrecentopioids_qu3=. if recentopioids_qu3==.
replace anyrecentopioids_qu4=. if recentopioids_qu4==.

label variable anyrecentopioids_q1 "Subject reported using any opioids during quarter 1"
label variable anyrecentopioids_q2 "Subject reported using any opioids during quarter 2"
label variable anyrecentopioids_q3 "Subject reported using any opioids during quarter 3"
label variable anyrecentopioids_q4 "Subject reported using any opioids during quarter 4"

label variable anyrecentopioids_qu1 "Subject reported using any opioids during quarter 1"
label variable anyrecentopioids_qu2 "Subject reported using any opioids during quarter 2"
label variable anyrecentopioids_qu3 "Subject reported using any opioids during quarter 3"
label variable anyrecentopioids_qu4 "Subject reported using any opioids during quarter 4"

label values anyrecentopioids_q1 no_yes
label values anyrecentopioids_q2 no_yes
label values anyrecentopioids_q3 no_yes
label values anyrecentopioids_q4 no_yes

label values anyrecentopioids_qu1 no_yes
label values anyrecentopioids_qu2 no_yes
label values anyrecentopioids_qu3 no_yes
label values anyrecentopioids_qu4 no_yes

*fre anyrecentopioids_q1
**0=114, 1=85
*fre anyrecentopioids_v1 if visit1_q==1
*fre anyrecentopioids_v2 if visit2_q==1
*fre anyrecentopioids_v3 if visit3_q==1
*fre anyrecentopioids_v4 if visit4_q==1
*fre anyrecentopioids_v5 if visit5_q==1
*fre anyrecentopioids_v6 if visit6_q==1
**0=114, 1=85

*fre anyrecentopioids_q2
**0=119, 1=74
*fre anyrecentopioids_v1 if visit1_q==2
*fre anyrecentopioids_v2 if visit2_q==2
*fre anyrecentopioids_v3 if visit3_q==2
*fre anyrecentopioids_v4 if visit4_q==2
*fre anyrecentopioids_v5 if visit5_q==2
*fre anyrecentopioids_v6 if visit6_q==2
**0=119, 1=74

*fre anyrecentopioids_q3
**0=100, 1=79
*fre anyrecentopioids_v1 if visit1_q==3
*fre anyrecentopioids_v2 if visit2_q==3
*fre anyrecentopioids_v3 if visit3_q==3
*fre anyrecentopioids_v4 if visit4_q==3
*fre anyrecentopioids_v5 if visit5_q==3
*fre anyrecentopioids_v6 if visit6_q==3
**0=100, 1=79

*fre anyrecentopioids_q4
**0=106, 1=79
*fre anyrecentopioids_v1 if visit1_q==4
*fre anyrecentopioids_v2 if visit2_q==4
*fre anyrecentopioids_v3 if visit3_q==4
*fre anyrecentopioids_v4 if visit4_q==4
*fre anyrecentopioids_v5 if visit5_q==4
*fre anyrecentopioids_v6 if visit6_q==4
**0=106, 1=79

gen abstinentopioids_q1 = 0
gen abstinentopioids_q2 = 0
gen abstinentopioids_q3 = 0
gen abstinentopioids_q4 = 0

gen abstinentopioids_qu1 = 0
gen abstinentopioids_qu2 = 0
gen abstinentopioids_qu3 = 0
gen abstinentopioids_qu4 = 0

replace abstinentopioids_q1=1 if anyrecentopioids_q1==0 
replace abstinentopioids_q2=1 if anyrecentopioids_q1==0 & anyrecentopioids_q2==0
replace abstinentopioids_q3=1 if anyrecentopioids_q1==0 & anyrecentopioids_q2==0 & anyrecentopioids_q3==0
replace abstinentopioids_q4=1 if anyrecentopioids_q1==0 & anyrecentopioids_q2==0 & anyrecentopioids_q3==0 & anyrecentopioids_q4==0

replace abstinentopioids_qu1=1 if anyrecentopioids_qu1==0 
replace abstinentopioids_qu2=1 if anyrecentopioids_qu1==0 & anyrecentopioids_qu2==0
replace abstinentopioids_qu3=1 if anyrecentopioids_qu1==0 & anyrecentopioids_qu2==0 & anyrecentopioids_qu3==0
replace abstinentopioids_qu4=1 if anyrecentopioids_qu1==0 & anyrecentopioids_qu2==0 & anyrecentopioids_qu3==0 & anyrecentopioids_qu4==0

replace abstinentopioids_q1=. if anyrecentopioids_q1==. 
replace abstinentopioids_q2=. if anyrecentopioids_q1==. | anyrecentopioids_q2==.
replace abstinentopioids_q3=. if anyrecentopioids_q1==. | anyrecentopioids_q2==. | anyrecentopioids_q3==.
replace abstinentopioids_q4=. if anyrecentopioids_q1==. | anyrecentopioids_q2==. | anyrecentopioids_q3==. | anyrecentopioids_q4==.

replace abstinentopioids_qu1=. if anyrecentopioids_qu1==. 
replace abstinentopioids_qu2=. if anyrecentopioids_qu1==. | anyrecentopioids_qu2==.
replace abstinentopioids_qu3=. if anyrecentopioids_qu1==. | anyrecentopioids_qu2==. | anyrecentopioids_qu3==.
replace abstinentopioids_qu4=. if anyrecentopioids_qu1==. | anyrecentopioids_qu2==. | anyrecentopioids_qu3==. | anyrecentopioids_qu4==.

label variable abstinentopioids_q1 "Subject reported abstinence from all opioids for one loose quarter"
label variable abstinentopioids_q2 "Subject reported abstinence from all opioids for two consecutive loose quarters"
label variable abstinentopioids_q3 "Subject reported abstinence from all opioids for three consecutive loose quarters"
label variable abstinentopioids_q4 "Subject reported abstinence from all opioids for four consecutive loose quarters"

label variable abstinentopioids_qu1 "Subject reported abstinence from all opioids for one strict quarter"
label variable abstinentopioids_qu2 "Subject reported abstinence from all opioids for two consecutive strict quarters"
label variable abstinentopioids_qu3 "Subject reported abstinence from all opioids for three consecutive strict quarters"
label variable abstinentopioids_qu4 "Subject reported abstinence from all opioids for four consecutive strict quarters"

label values abstinentopioids_q1 no_yes
label values abstinentopioids_q2 no_yes
label values abstinentopioids_q3 no_yes
label values abstinentopioids_q4 no_yes
label values abstinentopioids_qu1 no_yes
label values abstinentopioids_qu2 no_yes
label values abstinentopioids_qu3 no_yes
label values abstinentopioids_qu4 no_yes

*Years since HIV diagnosis

generate sincediagnosis=bcidy-bc39y
replace sincediagnosis=.a if sincediagnosis<0
label define sincediagnosis .a "don't know"
label values sincediagnosis sincediagnosis
label variable sincediagnosis "Number of years since diagnosis with HIV"

*Lowest CD4 count
*  **Note** this must be evaluated in the master baseline dataset

clonevar lowestcd4 = BC41
fre lowestcd4
recode lowestcd4 8=.a 9=.b

*Ready to make change in heroin use

clonevar readytochange = bc100
replace readytochange = . if bc100==88 | bc100==80 | bc100==65

