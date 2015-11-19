*Dependency:
**net install collin.pkg

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

*Logistic Regression of treatment retention from baseline criminal justice status

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

