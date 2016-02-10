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

*Building step-wise addition logistic model of 4-quarter retention by ever incarcerated
nestreg: logit retention4q male everincar_base
nestreg: logit retention4q hsdiploma everincar_base
nestreg: logit retention4q sincediagnosis everincar_base
nestreg: logit retention4q asidrugscore everincar_base
nestreg: logit retention4q injectdrugs everincar_base
nestreg: logit retention4q everalcintox everincar_base
nestreg: logit retention4q evermethadone everincar_base
nestreg: logit retention4q recentotherpk everincar_base
nestreg: logit retention4q recentmarijuana everincar_base
nestreg: logit retention4q years_any_opioid everincar_base
nestreg: logit retention4q overdosed everincar_base
nestreg: logit retention4q treatedfordrugs everincar_base
nestreg: logit retention4q site everincar_base

nestreg: logit retention4q (sincediagnosis male) everincar_base
nestreg: logit retention4q (sincediagnosis asidrugscore) everincar_base
nestreg: logit retention4q (sincediagnosis injectdrugs) everincar_base
nestreg: logit retention4q (sincediagnosis evermethadone) everincar_base
nestreg: logit retention4q (sincediagnosis recentotherpk) everincar_base
nestreg: logit retention4q (sincediagnosis recentmarijuana) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid) everincar_base

nestreg: logit retention4q (sincediagnosis years_any_opioid male) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid asidrugscore) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid injectdrugs) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid recentotherpk) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid recentmarijuana) everincar_base

nestreg: logit retention4q (sincediagnosis years_any_opioid male asidrugscore) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid male injectdrugs) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid male recentotherpk) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid male recentmarijuana) everincar_base

nestreg: logit retention4q (sincediagnosis years_any_opioid male injectdrugs asidrugscore) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid male injectdrugs recentotherpk) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid male injectdrugs recentmarijuana) everincar_base

nestreg: logit retention4q (sincediagnosis years_any_opioid male injectdrugs asidrugscore recentotherpk) everincar_base
nestreg: logit retention4q (sincediagnosis years_any_opioid male injectdrugs asidrugscore recentmarijuana) everincar_base

nestreg: logit retention4q (sincediagnosis years_any_opioid male injectdrugs asidrugscore recentotherpk recentmarijuana) everincar_base

**Evaluating for collinearity 
***collin sincediagnosis years_any_opioid male injectdrugs asidrugscore recentotherpk everincar_base

**Evaluating with step-wise subtraction
***nestreg: logistic retention4q (years_any_opioid male injectdrugs asidrugscore recentotherpk) everincar_base
***nestreg: logistic retention4q (sincediagnosis years_any_opioid male injectdrugs recentotherpk) everincar_base
***nestreg: logistic retention4q (years_any_opioid male injectdrugs recentotherpk) everincar_base


*Building step-wise addition logistic model of 4-quarter retention by baseline recent incarceration
logit retention4q recentincar_base
nestreg: logit retention4q alone recentincar_base
nestreg: logit retention4q homeless recentincar_base
nestreg: logit retention4q employed recentincar_base
nestreg: logit retention4q mentaldiag recentincar_base
nestreg: logit retention4q asialcscore recentincar_base
nestreg: logit retention4q asidrugscore recentincar_base
nestreg: logit retention4q injectdrugs recentincar_base
nestreg: logit retention4q everheroin recentincar_base
nestreg: logit retention4q treatedfordrugs recentincar_base
nestreg: logit retention4q site recentincar_base

nestreg: logit retention4q (alone injectdrugs) recentincar_base
nestreg: logit retention4q (alone homeless) recentincar_base
nestreg: logit retention4q (alone employed) recentincar_base
nestreg: logit retention4q (alone mentaldiag) recentincar_base
nestreg: logit retention4q (alone asialcscore) recentincar_base
nestreg: logit retention4q (alone asidrugscore) recentincar_base
nestreg: logit retention4q (alone injectdrugs) recentincar_base
nestreg: logit retention4q (alone everheroin) recentincar_base
nestreg: logit retention4q (alone treatedfordrugs) recentincar_base
nestreg: logit retention4q (alone site) recentincar_base

nestreg: logit retention4q (alone injectdrugs homeless) recentincar_base
nestreg: logit retention4q (alone injectdrugs employed) recentincar_base
nestreg: logit retention4q (alone injectdrugs mentaldiag) recentincar_base
nestreg: logit retention4q (alone injectdrugs asialcscore) recentincar_base
nestreg: logit retention4q (alone injectdrugs asidrugscore) recentincar_base
nestreg: logit retention4q (alone injectdrugs everheroin) recentincar_base
nestreg: logit retention4q (alone injectdrugs treatedfordrugs) recentincar_base
nestreg: logit retention4q (alone injectdrugs site) recentincar_base

nestreg: logit retention4q (alone injectdrugs mentaldiag homeless) recentincar_base
nestreg: logit retention4q (alone injectdrugs mentaldiag employed) recentincar_base
nestreg: logit retention4q (alone injectdrugs mentaldiag asialcscore) recentincar_base
nestreg: logit retention4q (alone injectdrugs mentaldiag asidrugscore) recentincar_base
nestreg: logit retention4q (alone injectdrugs mentaldiag everheroin) recentincar_base
nestreg: logit retention4q (alone injectdrugs mentaldiag treatedfordrugs) recentincar_base
nestreg: logit retention4q (alone injectdrugs mentaldiag site) recentincar_base
