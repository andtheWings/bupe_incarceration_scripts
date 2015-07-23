drop if drugtx!=1

tab everincar_base retention4q if drugtx==1, chi2 row
tab recentincar_base retention4q if drugtx==1, chi2 row
tab everincar_base retention4q if drugtx==1, chi2 row

logistic retention4q recentincar_base alone homeless employed mentaldiag asidrugscore asialcscore injectdrugs everheroin treatedfordrugs
logistic retention4q recentincar_base alone homeless mentaldiag asidrugscore asialcscore injectdrugs everheroin treatedfordrugs
logistic retention4q recentincar_base alone homeless asidrugscore asialcscore injectdrugs everheroin treatedfordrugs
logistic retention4q recentincar_base alone asidrugscore asialcscore injectdrugs everheroin treatedfordrugs
logistic retention4q recentincar_base alone asialcscore injectdrugs everheroin treatedfordrugs
logistic retention4q recentincar_base alone asialcscore injectdrugs treatedfordrugs
logistic retention4q recentincar_base alone asialcscore injectdrugs
logistic retention4q recentincar_base alone asialcscore
logistic retention4q recentincar_base asialcscore
logistic retention4q recentincar_base alone

logistic retention4q parole_base english male asidrugscore injectdrugs everheroin evermethadone years_any_opioid overdosed treatedfordrugs recentmethadonetx
logistic retention4q parole_base english male asidrugscore injectdrugs everheroin evermethadone years_any_opioid overdosed treatedfordrugs
logistic retention4q parole_base english male asidrugscore injectdrugs evermethadone years_any_opioid overdosed treatedfordrugs
logistic retention4q parole_base male asidrugscore injectdrugs evermethadone years_any_opioid overdosed treatedfordrugs
logistic retention4q parole_base male asidrugscore injectdrugs evermethadone years_any_opioid treatedfordrugs
logistic retention4q parole_base male injectdrugs evermethadone years_any_opioid treatedfordrugs
logistic retention4q parole_base male evermethadone years_any_opioid treatedfordrugs
logistic retention4q parole_base male years_any_opioid treatedfordrugs
logistic retention4q parole_base male years_any_opioid
