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

*Simple logistic regressions of 1 quarter treatment retention
logistic retention1q age
logistic retention1q white
logistic retention1q black
logistic retention1q latino
logistic retention1q asian_and_other
logistic retention1q english
logistic retention1q male
logistic retention1q heterosexual
logistic retention1q married
logistic retention1q alone
logistic retention1q homeless
logistic retention1q hsdiploma
logistic retention1q employed
logistic retention1q mentaldiag
logistic retention1q injectdrugs
logistic retention1q everalcintox
logistic retention1q everheroin
logistic retention1q evermethadone 
logistic retention1q everotherpk 
logistic retention1q eversedative 
logistic retention1q evercocaine
logistic retention1q evermarijuana
logistic retention1q everanyopioid
logistic retention1q recentalcintox
logistic retention1q recentheroin
logistic retention1q recentmethadone
logistic retention1q recentotherpk
logistic retention1q recentsedative
logistic retention1q recentcocaine
logistic retention1q recentmarijuana
logistic retention1q years_any_opioid
logistic retention1q overdosed
logistic retention1q treatedfordrugs
logistic retention1q recentmethadonetx
logistic retention1q everincar_base
logistic retention1q recentincar_base
logistic retention1q recentincar_qu1
**recentcocaine

**By quarterly criminal justice status:
tab recentincar_qu1 retention1q, row chi2
tab recentincar_qu2 retention2q, row chi2
tab recentincar_qu3 retention3q, row chi2
tab recentincar_qu4 retention4q, row chi2


*Simple logistic regressions of 2 quarter treatment retention
logistic retention2q age
logistic retention2q white
logistic retention2q black
logistic retention2q latino
logistic retention2q asian_and_other
logistic retention2q english
logistic retention2q male
logistic retention2q heterosexual
logistic retention2q married
logistic retention2q alone
logistic retention2q homeless
logistic retention2q hsdiploma
logistic retention2q employed
logistic retention2q mentaldiag
logistic retention2q injectdrugs
logistic retention2q everalcintox
logistic retention2q everheroin
logistic retention2q evermethadone 
logistic retention2q everotherpk 
logistic retention2q eversedative 
logistic retention2q evercocaine
logistic retention2q evermarijuana
logistic retention2q everanyopioid
logistic retention2q recentalcintox
logistic retention2q recentheroin
logistic retention2q recentmethadone
logistic retention2q recentotherpk
logistic retention2q recentsedative
logistic retention2q recentcocaine
logistic retention2q recentmarijuana
logistic retention2q years_any_opioid
logistic retention2q overdosed
logistic retention2q treatedfordrugs
logistic retention2q recentmethadonetx
logistic retention2q everincar_base
logistic retention2q recentincar_base
logistic retention2q recentincar_qu1
logistic retention2q recentincar_qu2
**recentcocaine, recentmethadone, recentincar_qu2

*Simple logistic regressions of 3 quarter treatment retention
logistic retention3q age
logistic retention3q white
logistic retention3q black
logistic retention3q latino
logistic retention3q asian_and_other
logistic retention3q english
logistic retention3q male
logistic retention3q heterosexual
logistic retention3q married
logistic retention3q alone
logistic retention3q homeless
logistic retention3q hsdiploma
logistic retention3q employed
logistic retention3q mentaldiag
logistic retention3q injectdrugs
logistic retention3q everalcintox
logistic retention3q everheroin
logistic retention3q evermethadone 
logistic retention3q everotherpk 
logistic retention3q eversedative 
logistic retention3q evercocaine
logistic retention3q evermarijuana
logistic retention3q everanyopioid
logistic retention3q recentalcintox
logistic retention3q recentheroin
logistic retention3q recentmethadone
logistic retention3q recentotherpk
logistic retention3q recentsedative
logistic retention3q recentcocaine
logistic retention3q recentmarijuana
logistic retention3q years_any_opioid
logistic retention3q overdosed
logistic retention3q treatedfordrugs
logistic retention3q recentmethadonetx
logistic retention3q everincar_base
logistic retention3q recentincar_base
logistic retention3q recentincar_qu1
logistic retention3q recentincar_qu2
logistic retention3q recentincar_qu3
**recentalcintox, black, white, age, recentincar_qu2

*Simple logistic regressions of 4 quarter treatment retention
logistic retention4q age
logistic retention4q white
logistic retention4q black
logistic retention4q latino
logistic retention4q asian_and_other
logistic retention4q english
logistic retention4q male
logistic retention4q heterosexual
logistic retention4q married
logistic retention4q alone
logistic retention4q homeless
logistic retention4q hsdiploma
logistic retention4q employed
logistic retention4q mentaldiag
logistic retention4q injectdrugs
logistic retention4q everalcintox
logistic retention4q everheroin
logistic retention4q evermethadone 
logistic retention4q everotherpk 
logistic retention4q eversedative 
logistic retention4q evercocaine
logistic retention4q evermarijuana
logistic retention4q everanyopioid
logistic retention4q recentalcintox
logistic retention4q recentheroin
logistic retention4q recentmethadone
logistic retention4q recentotherpk
logistic retention4q recentsedative
logistic retention4q recentcocaine
logistic retention4q recentmarijuana
logistic retention4q years_any_opioid
logistic retention4q overdosed
logistic retention4q treatedfordrugs
logistic retention4q recentmethadonetx
logistic retention4q everincar_base
logistic retention4q recentincar_base
logistic retention4q recentincar_qu1
logistic retention4q recentincar_qu2
logistic retention4q recentincar_qu3
logistic retention4q recentincar_qu4
**male, black, white, age, recentincar_qu2, recentincar_qu4

*Multiple Logistic Regression of treatment retention from baseline criminal justice status

**4 quarters retention from ever incarcerated at baseline

logistic retention4q everincar_base
listcoef, percent
nestreg: logistic retention4q (sincediagnosis years_any_opioid male injectdrugs asidrugscore recentotherpk) everincar_base
listcoef, percent

**2 and 4 quarters retention from baseline recent incarceration

***Simple model:
logistic retention2q recentincar_base
logistic retention4q recentincar_base

***Full model:
nestreg: logistic retention2q (age white male homeless mentaldiag asidrugscore injectdrugs everheroin) recentincar_base
nestreg: logistic retention4q (age white male homeless mentaldiag asidrugscore injectdrugs everheroin) recentincar_base

***Parsimonious model:
nestreg: logistic retention2q (male homeless mentaldiag asidrugscore injectdrugs everheroin) recentincar_base
nestreg: logistic retention4q (male homeless mentaldiag asidrugscore injectdrugs everheroin) recentincar_base

***Restricted model:
nestreg: logistic retention2q (asidrugscore injectdrugs everheroin) recentincar_base
nestreg: logistic retention4q (asidrugscore injectdrugs everheroin) recentincar_base

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

*Make graphs reporting quarterly retention from quarterly criminal justice
use "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\bupe_incarceration_scripts\Treatment_Retention_Outcome\retention_from_quarterly_criminal_justice.dta", clear

**Quarterly retention grouped by quarterly incarceration
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained in BMT if recently incarcerated", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Incarcerated in 3 months before each visit:", size(medsmall) color(black)))

