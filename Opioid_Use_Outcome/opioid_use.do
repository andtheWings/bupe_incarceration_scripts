*Quarterly days opioid use by baseline criminal justice

ranksum recentopioids_qu1, by(everincar_base)
ranksum recentopioids_qu2, by(everincar_base)
ranksum recentopioids_qu3, by(everincar_base)
ranksum recentopioids_qu4, by(everincar_base)

ranksum recentopioids_qu1, by(recentincar_base)
ranksum recentopioids_qu2, by(recentincar_base)
ranksum recentopioids_qu3, by(recentincar_base)
ranksum recentopioids_qu4, by(recentincar_base)

ranksum recentopioids_qu1, by(parole_base)
ranksum recentopioids_qu2, by(parole_base)
ranksum recentopioids_qu3, by(parole_base)
ranksum recentopioids_qu4, by(parole_base)

*Quarterly any opioid use by baseline criminal justice

tab everincar_base anyrecentopioids_qu1, row chi2
tab everincar_base anyrecentopioids_qu2, row chi2
tab everincar_base anyrecentopioids_qu3, row chi2
tab everincar_base anyrecentopioids_qu4, row chi2

tab recentincar_base anyrecentopioids_qu1, row chi2
tab recentincar_base anyrecentopioids_qu2, row chi2
tab recentincar_base anyrecentopioids_qu3, row chi2
tab recentincar_base anyrecentopioids_qu4, row chi2

tab parole_base anyrecentopioids_qu1, row chi2
tab parole_base anyrecentopioids_qu2, row chi2
tab parole_base anyrecentopioids_qu3, row chi2
tab parole_base anyrecentopioids_qu4, row chi2

*Quarterly abstinence from opioids by baseline criminal justice

tab everincar_base abstinentopioids_qu1, row chi2
tab everincar_base abstinentopioids_qu2, row chi2
tab everincar_base abstinentopioids_qu3, row chi2
tab everincar_base abstinentopioids_qu4, row chi2

tab recentincar_base abstinentopioids_qu1, row chi2
tab recentincar_base abstinentopioids_qu2, row chi2
tab recentincar_base abstinentopioids_qu3, row chi2
tab recentincar_base abstinentopioids_qu4, row chi2

tab parole_base abstinentopioids_qu1, row chi2
tab parole_base abstinentopioids_qu2, row chi2
tab parole_base abstinentopioids_qu3, row chi2
tab parole_base abstinentopioids_qu4, row chi2



