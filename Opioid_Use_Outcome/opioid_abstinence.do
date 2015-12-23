gen recentopioid_q1 = 0
gen recentopioid_q2 = 0
gen recentopioid_q3 = 0
gen recentopioid_q4 = 0
gen abstinentopioids = 0

replace recentopioid_q1=1 if visit_1q==1 & qc83d_1>0
replace recentopioid_q1=1 if visit_1q==1 & qc84d_1>0
replace recentopioid_q1=1 if visit_1q==1 & qc85d_1>0
replace recentopioid_q1=1 if visit_2q==1 & qc83d_2>0
replace recentopioid_q1=1 if visit_2q==1 & qc84d_2>0
replace recentopioid_q1=1 if visit_2q==1 & qc85d_2>0
replace recentopioid_q1=1 if visit_3q==1 & qc83d_3>0
replace recentopioid_q1=1 if visit_3q==1 & qc84d_3>0
replace recentopioid_q1=1 if visit_3q==1 & qc85d_3>0
replace recentopioid_q1=1 if visit_4q==1 & qc83d_4>0
replace recentopioid_q1=1 if visit_4q==1 & qc84d_4>0
replace recentopioid_q1=1 if visit_4q==1 & qc85d_4>0
replace recentopioid_q1=1 if visit_5q==1 & qc83d_5>0
replace recentopioid_q1=1 if visit_5q==1 & qc84d_5>0
replace recentopioid_q1=1 if visit_5q==1 & qc85d_5>0
replace recentopioid_q1=1 if visit_6q==1 & qc83d_6>0
replace recentopioid_q1=1 if visit_6q==1 & qc84d_6>0
replace recentopioid_q1=1 if visit_6q==1 & qc85d_6>0
replace recentopioid_q1=. if visit_1q!=1 & visit_2q!=1 & visit_3q!=1 & visit_4q!=1 & visit_5q!=1 & visit_6q!=1

replace recentopioid_q2=1 if visit_1q==2 & qc83d_1>0
replace recentopioid_q2=1 if visit_1q==2 & qc84d_1>0
replace recentopioid_q2=1 if visit_1q==2 & qc85d_1>0
replace recentopioid_q2=1 if visit_2q==2 & qc83d_2>0
replace recentopioid_q2=1 if visit_2q==2 & qc84d_2>0
replace recentopioid_q2=1 if visit_2q==2 & qc85d_2>0
replace recentopioid_q2=1 if visit_3q==2 & qc83d_3>0
replace recentopioid_q2=1 if visit_3q==2 & qc84d_3>0
replace recentopioid_q2=1 if visit_3q==2 & qc85d_3>0
replace recentopioid_q2=1 if visit_4q==2 & qc83d_4>0
replace recentopioid_q2=1 if visit_4q==2 & qc84d_4>0
replace recentopioid_q2=1 if visit_4q==2 & qc85d_4>0
replace recentopioid_q2=1 if visit_5q==2 & qc83d_5>0
replace recentopioid_q2=1 if visit_5q==2 & qc84d_5>0
replace recentopioid_q2=1 if visit_5q==2 & qc85d_5>0
replace recentopioid_q2=1 if visit_6q==2 & qc83d_6>0
replace recentopioid_q2=1 if visit_6q==2 & qc84d_6>0
replace recentopioid_q2=1 if visit_6q==2 & qc85d_6>0
replace recentopioid_q2=. if visit_1q!=2 & visit_2q!=2 & visit_3q!=2 & visit_4q!=2 & visit_5q!=2 & visit_6q!=2

replace recentopioid_q3=1 if visit_1q==3 & qc83d_1>0
replace recentopioid_q3=1 if visit_1q==3 & qc84d_1>0
replace recentopioid_q3=1 if visit_1q==3 & qc85d_1>0
replace recentopioid_q3=1 if visit_2q==3 & qc83d_2>0
replace recentopioid_q3=1 if visit_2q==3 & qc84d_2>0
replace recentopioid_q3=1 if visit_2q==3 & qc85d_2>0
replace recentopioid_q3=1 if visit_3q==3 & qc83d_3>0
replace recentopioid_q3=1 if visit_3q==3 & qc84d_3>0
replace recentopioid_q3=1 if visit_3q==3 & qc85d_3>0
replace recentopioid_q3=1 if visit_4q==3 & qc83d_4>0
replace recentopioid_q3=1 if visit_4q==3 & qc84d_4>0
replace recentopioid_q3=1 if visit_4q==3 & qc85d_4>0
replace recentopioid_q3=1 if visit_5q==3 & qc83d_5>0
replace recentopioid_q3=1 if visit_5q==3 & qc84d_5>0
replace recentopioid_q3=1 if visit_5q==3 & qc85d_5>0
replace recentopioid_q3=1 if visit_6q==3 & qc83d_6>0
replace recentopioid_q3=1 if visit_6q==3 & qc84d_6>0
replace recentopioid_q3=1 if visit_6q==3 & qc85d_6>0
replace recentopioid_q3=. if visit_1q!=3 & visit_2q!=3 & visit_3q!=3 & visit_4q!=3 & visit_5q!=3 & visit_6q!=3

replace recentopioid_q4=1 if visit_1q==4 & qc83d_1>0
replace recentopioid_q4=1 if visit_1q==4 & qc84d_1>0
replace recentopioid_q4=1 if visit_1q==4 & qc85d_1>0
replace recentopioid_q4=1 if visit_2q==4 & qc83d_2>0
replace recentopioid_q4=1 if visit_2q==4 & qc84d_2>0
replace recentopioid_q4=1 if visit_2q==4 & qc85d_2>0
replace recentopioid_q4=1 if visit_3q==4 & qc83d_3>0
replace recentopioid_q4=1 if visit_3q==4 & qc84d_3>0
replace recentopioid_q4=1 if visit_3q==4 & qc85d_3>0
replace recentopioid_q4=1 if visit_4q==4 & qc83d_4>0
replace recentopioid_q4=1 if visit_4q==4 & qc84d_4>0
replace recentopioid_q4=1 if visit_4q==4 & qc85d_4>0
replace recentopioid_q4=1 if visit_5q==4 & qc83d_5>0
replace recentopioid_q4=1 if visit_5q==4 & qc84d_5>0
replace recentopioid_q4=1 if visit_5q==4 & qc85d_5>0
replace recentopioid_q4=1 if visit_6q==4 & qc83d_6>0
replace recentopioid_q4=1 if visit_6q==4 & qc84d_6>0
replace recentopioid_q4=1 if visit_6q==4 & qc85d_6>0
replace recentopioid_q4=. if visit_1q!=4 & visit_2q!=4 & visit_3q!=4 & visit_4q!=4 & visit_5q!=4 & visit_6q!=4

replace abstinentopioids=1 if recentopioid_q1==0 & recentopioid_q2==0 & recentopioid_q3==0 & recentopioid_q4==0
replace abstinentopioids=. if recentopioid_q1==. | recentopioid_q2==. | recentopioid_q3==. | recentopioid_q4==.

tab everincar_base abstinentopioids, chi2 row
tab recentincar_base abstinentopioids, chi2 row
tab parole_base abstinentopioids, chi2 row
