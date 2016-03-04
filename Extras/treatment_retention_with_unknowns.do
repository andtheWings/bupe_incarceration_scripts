*Treatment retention with unknowns accounted for:

gen retention = 0
label variable retention "Number of quarters in a row that subject was retained on bup/nx treatment"
replace retention=1 if dtxq1==1 & dtxq2!=1 & dtxq2!=4
replace retention=2 if dtxq1==1 & dtxq2==1 & dtxq3!=1 & dtxq3!=4
replace retention=3 if dtxq1==1 & dtxq2==1 & dtxq3==1 & dtxq4!=1 & dtxq4!=4
replace retention=4 if dtxq1==1 & dtxq2==1 & dtxq3==1 & dtxq4==1

list retention dtxq1 dtxq2 dtxq3 dtxq4

clonevar retention1q=retention
recode retention1q 2/4=1
replace retention1q=. if dtxq1==4
label variable retention1q "Subject was retained on bup/nx treatment for one or more consecutive quarters"
label values retention1q no_yes

clonevar retention2q=retention
recode retention2q 1=0 2/4=1
replace retention2q=. if dtxq1==4 | dtxq2==4
label variable retention2q "Subject was retained on bup/nx treatment for two or more consecutive quarters"
label values retention2q no_yes

clonevar retention3q=retention
recode retention3q 1/2=0 3/4=1
replace retention3q=. if dtxq1==4 | dtxq2==4 | dtxq3==4
label variable retention3q "Subject was retained on bup/nx treatment for three or more consecutive quarters"
label values retention3q no_yes

clonevar retention4q=retention
recode retention4q 1/3=0 4=1
replace retention4q=. if dtxq1==4 | dtxq2==4 | dtxq3==4 | dtxq4==4
label variable retention4q "Subject was retained on bup/nx treatment for four consecutive quarters"
label values retention4q no_yes

list retention retention1q retention2q retention3q retention4q
