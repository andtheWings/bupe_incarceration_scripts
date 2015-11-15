gen retention = 0
replace retention=1 if dtxq1==1 & dtxq2!=1 & dtxq3!=1 & dtxq4!=1
replace retention=2 if dtxq1==1 & dtxq2==1 & dtxq3!=1 & dtxq4!=1
replace retention=3 if dtxq1==1 & dtxq2==1 & dtxq3==1 & dtxq4!=1
replace retention=4 if dtxq1==1 & dtxq2==1 & dtxq3==1 & dtxq4==1
replace retention=. if dtxq1==. | dtxq2==. | dtxq3==. | dtxq4==.

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

drop if drugtx!=1

tab everincar_base retention, chi2 row
tab recentincar_base retention, chi2 row
tab parole_base retention, chi2 row
