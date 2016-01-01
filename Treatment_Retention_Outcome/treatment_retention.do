*Dependency:
**net install collin.pkg

*Percent retained per quarter
fre retention1q
fre retention2q
fre retention3q
fre retention4q

*Chi-squared tests of treament retention from baseline criminal justice status

tab everincar_base retention1q, row chi2
tab everincar_base retention2q, row chi2
tab everincar_base retention3q, row chi2
tab everincar_base retention4q, row chi2
tab recentincar_base retention1q, row chi2
tab recentincar_base retention2q, row chi2
tab recentincar_base retention3q, row chi2
tab recentincar_base retention4q, row chi2
tab parole_base retention1q, row chi2
tab parole_base retention2q, row chi2
tab parole_base retention3q, row chi2
tab parole_base retention4q, row chi2

*Simple logistic regressions of 1 quarter treatment retention
logit retention1q age
logit retention1q white
logit retention1q black
logit retention1q latino
logit retention1q asian_and_other
logit retention1q english
logit retention1q male
logit retention1q heterosexual
logit retention1q married
logit retention1q alone
logit retention1q homeless
logit retention1q hsdiploma
logit retention1q employed
logit retention1q mentaldiag
logit retention1q injectdrugs
logit retention1q everalcintox
logit retention1q everheroin
logit retention1q evermethadone 
logit retention1q everotherpk 
logit retention1q eversedative 
logit retention1q evercocaine
logit retention1q evermarijuana
logit retention1q everanyopioid
logit retention1q recentalcintox
logit retention1q recentheroin
logit retention1q recentmethadone
logit retention1q recentotherpk
logit retention1q recentsedative
logit retention1q recentcocaine
logit retention1q recentmarijuana
logit retention1q years_any_opioid
logit retention1q overdosed
logit retention1q treatedfordrugs
logit retention1q recentmethadonetx
logit retention1q everincar_base
logit retention1q recentincar_base
**recentcocaine

*Simple logistic regressions of 2 quarter treatment retention
logit retention2q age
logit retention2q white
logit retention2q black
logit retention2q latino
logit retention2q asian_and_other
logit retention2q english
logit retention2q male
logit retention2q heterosexual
logit retention2q married
logit retention2q alone
logit retention2q homeless
logit retention2q hsdiploma
logit retention2q employed
logit retention2q mentaldiag
logit retention2q injectdrugs
logit retention2q everalcintox
logit retention2q everheroin
logit retention2q evermethadone 
logit retention2q everotherpk 
logit retention2q eversedative 
logit retention2q evercocaine
logit retention2q evermarijuana
logit retention2q everanyopioid
logit retention2q recentalcintox
logit retention2q recentheroin
logit retention2q recentmethadone
logit retention2q recentotherpk
logit retention2q recentsedative
logit retention2q recentcocaine
logit retention2q recentmarijuana
logit retention2q years_any_opioid
logit retention2q overdosed
logit retention2q treatedfordrugs
logit retention2q recentmethadonetx
logit retention2q everincar_base
logit retention2q recentincar_base
**recentcocaine, recentmethadone

*Simple logistic regressions of 3 quarter treatment retention
logit retention3q age
logit retention3q white
logit retention3q black
logit retention3q latino
logit retention3q asian_and_other
logit retention3q english
logit retention3q male
logit retention3q heterosexual
logit retention3q married
logit retention3q alone
logit retention3q homeless
logit retention3q hsdiploma
logit retention3q employed
logit retention3q mentaldiag
logit retention3q injectdrugs
logit retention3q everalcintox
logit retention3q everheroin
logit retention3q evermethadone 
logit retention3q everotherpk 
logit retention3q eversedative 
logit retention3q evercocaine
logit retention3q evermarijuana
logit retention3q everanyopioid
logit retention3q recentalcintox
logit retention3q recentheroin
logit retention3q recentmethadone
logit retention3q recentotherpk
logit retention3q recentsedative
logit retention3q recentcocaine
logit retention3q recentmarijuana
logit retention3q years_any_opioid
logit retention3q overdosed
logit retention3q treatedfordrugs
logit retention3q recentmethadonetx
logit retention3q everincar_base
logit retention3q recentincar_base
**recentalcintox, black, white, age

*Simple logistic regressions of 4 quarter treatment retention
logit retention4q age
logit retention4q white
logit retention4q black
logit retention4q latino
logit retention4q asian_and_other
logit retention4q english
logit retention4q male
logit retention4q heterosexual
logit retention4q married
logit retention4q alone
logit retention4q homeless
logit retention4q hsdiploma
logit retention4q employed
logit retention4q mentaldiag
logit retention4q injectdrugs
logit retention4q everalcintox
logit retention4q everheroin
logit retention4q evermethadone 
logit retention4q everotherpk 
logit retention4q eversedative 
logit retention4q evercocaine
logit retention4q evermarijuana
logit retention4q everanyopioid
logit retention4q recentalcintox
logit retention4q recentheroin
logit retention4q recentmethadone
logit retention4q recentotherpk
logit retention4q recentsedative
logit retention4q recentcocaine
logit retention4q recentmarijuana
logit retention4q years_any_opioid
logit retention4q overdosed
logit retention4q treatedfordrugs
logit retention4q recentmethadonetx
logit retention4q everincar_base
logit retention4q recentincar_base
**male, black, white, age

*Multiple Logistic Regression of treatment retention from baseline criminal justice status

**4 quarters retention from ever incarcerated at baseline
logit retention4q everincar_base

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

logistic retention4q everincar_base
listcoef, percent
nestreg: logistic retention4q (sincediagnosis years_any_opioid male injectdrugs asidrugscore recentotherpk) everincar_base
listcoef, percent

*Evaluating for collinearity 
**collin sincediagnosis years_any_opioid male injectdrugs asidrugscore recentotherpk everincar_base

*Evaluating with step-wise subtraction
**nestreg: logistic retention4q (years_any_opioid male injectdrugs asidrugscore recentotherpk) everincar_base
**nestreg: logistic retention4q (sincediagnosis years_any_opioid male injectdrugs recentotherpk) everincar_base
**nestreg: logistic retention4q (years_any_opioid male injectdrugs recentotherpk) everincar_base


**4 quarters retention from recent incarceration at baseline
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


logistic retention4q recentincar_base
listcoef, percent
nestreg: logistic retention4q (alone injectdrugs mentaldiag) recentincar_base
listcoef, percent

*Make graphs reporting quarterly retention from baseline criminal justice
use "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\bupe_incarceration_scripts\Treatment Retention Outcome\retention_from_baseline_criminal_justice.dta", clear

**Quarterly rentention grouped by ever incarcerated at baseline
graph bar (asis) everincar  neverincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Ever been incarcerated > 3 days", size(medsmall) color(black)))


**Quarterly retention grouped by recent incarceration at baseline
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Incarcerated in 30 days before baseline", size(medsmall) color(black)))

**Quarterly retention grouped by baseline parole status
graph bar (asis) parole noparole, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("On parole or probation at baseline", size(medsmall) color(black)))

