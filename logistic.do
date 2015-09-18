drop if drugtx!=1

tab recentincar_base retention4q, chi2 row

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
nestreg: logit retention4q (alone injectdrugs) recentincar_base
nestreg: logit retention4q (alone homeless) recentincar_base
nestreg: logit retention4q (alone employed) recentincar_base
nestreg: logit retention4q (alone mentaldiag) recentincar_base
nestreg: logit retention4q (alone asialcscore) recentincar_base
nestreg: logit retention4q (alone asidrugscore) recentincar_base
nestreg: logit retention4q (alone injectdrugs) recentincar_base
nestreg: logit retention4q (alone everheroin) recentincar_base
nestreg: logit retention4q (alone treatedfordrugs) recentincar_base
nestreg: logit retention4q (alone injectdrugs homeless) recentincar_base
nestreg: logit retention4q (alone injectdrugs employed) recentincar_base
nestreg: logit retention4q (alone injectdrugs mentaldiag) recentincar_base
nestreg: logit retention4q (alone injectdrugs asialcscore) recentincar_base
nestreg: logit retention4q (alone injectdrugs asidrugscore) recentincar_base
nestreg: logit retention4q (alone injectdrugs everheroin) recentincar_base
nestreg: logit retention4q (alone injectdrugs treatedfordrugs) recentincar_base

logistic retention4q recentincar_base
listcoef, percent
nestreg: logistic retention4q (alone injectdrugs) recentincar_base
listcoef, percent

***

tab parole_base retention3q if drugtx==1, chi2 row

logit retention3q parole_base
nestreg: logit retention3q english parole_base
nestreg: logit retention3q male parole_base
nestreg: logit retention3q asidrugscore parole_base
nestreg: logit retention3q injectdrugs parole_base
nestreg: logit retention3q everheroin parole_base
nestreg: logit retention3q evermethadone parole_base
nestreg: logit retention3q years_any_opioid parole_base
nestreg: logit retention3q overdosed parole_base
nestreg: logit retention3q treatedfordrugs parole_base
nestreg: logit retention3q recentmethadonetx parole_base
nestreg: logit retention3q (asidrugscore injectdrugs) parole_base
nestreg: logit retention3q (asidrugscore injectdrugs english) parole_base
nestreg: logit retention3q (asidrugscore injectdrugs male) parole_base
nestreg: logit retention3q (asidrugscore injectdrugs everheroin) parole_base
nestreg: logit retention3q (asidrugscore injectdrugs evermethadone) parole_base
nestreg: logit retention3q (asidrugscore injectdrugs years_any_opioid) parole_base
nestreg: logit retention3q (asidrugscore injectdrugs overdosed) parole_base
nestreg: logit retention3q (asidrugscore injectdrugs treatedfordrugs) parole_base
nestreg: logit retention3q (asidrugscore injectdrugs recentmethadone) parole_base
nestreg: logit retention3q (asidrugscore injectdrugs evermethadone recentmethadone) parole_base

logistic retention3q parole_base
listcoef, percent
nestreg: logistic retention3q (asidrugscore injectdrugs) parole_base
listcoef, percent

***

tab parole_base retention4q if drugtx==1, chi2 row

logit retention4q parole_base
nestreg: logit retention4q parole_base
nestreg: logit retention4q english parole_base
nestreg: logit retention4q male parole_base
nestreg: logit retention4q asidrugscore parole_base
nestreg: logit retention4q injectdrugs parole_base
nestreg: logit retention4q everheroin parole_base
nestreg: logit retention4q evermethadone parole_base
nestreg: logit retention4q years_any_opioid parole_base
nestreg: logit retention4q overdosed parole_base
nestreg: logit retention4q treatedfordrugs parole_base
nestreg: logit retention4q recentmethadonetx parole_base
nestreg: logit retention4q (male english) parole_base
nestreg: logit retention4q (male asidrugscore) parole_base
nestreg: logit retention4q (male injectdrugs) parole_base
nestreg: logit retention4q (male everheroin) parole_base
nestreg: logit retention4q (male evermethadone) parole_base
nestreg: logit retention4q (male years_any_opioid) parole_base
nestreg: logit retention4q (male overdosed) parole_base
nestreg: logit retention4q (male treatedfordrugs) parole_base
nestreg: logit retention4q (male recentmethadonetx) parole_base
nestreg: logit retention4q (male asidrugscore english) parole_base
nestreg: logit retention4q (male asidrugscore injectdrugs) parole_base
nestreg: logit retention4q (male asidrugscore everheroin) parole_base
nestreg: logit retention4q (male asidrugscore evermethadone) parole_base
nestreg: logit retention4q (male asidrugscore years_any_opioid) parole_base
nestreg: logit retention4q (male asidrugscore overdosed) parole_base
nestreg: logit retention4q (male asidrugscore treatedfordrugs) parole_base
nestreg: logit retention4q (male asidrugscore recentmethadonetx) parole_base

logistic retention4q parole_base
listcoef, percent
nestreg: logistic retention4q (male asidrugscore) parole_base
listcoef, percent

*Redo!!!
***

tab recentincar_base abstinentopioids, chi2 row

logit abstinentopioids recentincar_base
nestreg: logit abstinentopioids alone recentincar_base
nestreg: logit abstinentopioids homeless recentincar_base
nestreg: logit abstinentopioids employed recentincar_base
nestreg: logit abstinentopioids mentaldiag recentincar_base
nestreg: logit abstinentopioids asialcscore recentincar_base
nestreg: logit abstinentopioids asidrugscore recentincar_base
nestreg: logit abstinentopioids injectdrugs recentincar_base
nestreg: logit abstinentopioids everheroin recentincar_base
nestreg: logit abstinentopioids treatedfordrugs recentincar_base
nestreg: logit abstinentopioids (mentaldiag alone) recentincar_base
nestreg: logit abstinentopioids (mentaldiag homeless) recentincar_base
nestreg: logit abstinentopioids (mentaldiag employed) recentincar_base
nestreg: logit abstinentopioids (mentaldiag asialcscore) recentincar_base
nestreg: logit abstinentopioids (mentaldiag asidrugscore) recentincar_base
nestreg: logit abstinentopioids (mentaldiag injectdrugs) recentincar_base
nestreg: logit abstinentopioids (mentaldiag everheroin) recentincar_base
nestreg: logit abstinentopioids (mentaldiag treatedfordrugs) recentincar_base
nestreg: logit abstinentopioids (mentaldiag alone homeless) recentincar_base
nestreg: logit abstinentopioids (mentaldiag alone employed) recentincar_base
nestreg: logit abstinentopioids (mentaldiag alone asialcscore) recentincar_base
nestreg: logit abstinentopioids (mentaldiag alone asidrugscore) recentincar_base
nestreg: logit abstinentopioids (mentaldiag alone injectdrugs) recentincar_base
nestreg: logit abstinentopioids (mentaldiag alone everheroin) recentincar_base
nestreg: logit abstinentopioids (mentaldiag alone treatedfordrugs) recentincar_base

logistic abstinentopioids recentincar_base
listcoef, percent
nestreg: logistic abstinentopioids (mentaldiag alone) recentincar_base
listcoef, percent
