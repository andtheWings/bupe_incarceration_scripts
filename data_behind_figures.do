*How criminal justice at baseline afect treatment retention

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

*How criminal justice at quarter affects retention

tab recentincar_q1 retention1q, row chi2
tab recentincar_q2 retention2q, row chi2
tab recentincar_q3 retention3q, row chi2
tab recentincar_q4 retention4q, row chi2
tab parole_q1 retention1q, row chi2
tab parole_q2 retention2q, row chi2
tab parole_q3 retention3q, row chi2
tab parole_q4 retention4q, row chi2

*How criminal justice at baseline affects opioid use in retained quarters

tab everincar_base anyrecentopioids_q1 if retention1q==1, row chi2
tab everincar_base anyrecentopioids_qu1 if retention1q==1, row chi2
tab everincar_base anyrecentopioids_q2 if retention2q==1, row chi2
tab everincar_base anyrecentopioids_qu2 if retention2q==1, row chi2
tab everincar_base anyrecentopioids_q3 if retention3q==1, row chi2
tab everincar_base anyrecentopioids_qu3 if retention3q==1, row chi2
tab everincar_base anyrecentopioids_q4 if retention4q==1, row chi2
tab everincar_base anyrecentopioids_qu4 if retention4q==1, row chi2

tab recentincar_base anyrecentopioids_q1 if retention1q==1, row chi2
tab recentincar_base anyrecentopioids_qu1 if retention1q==1, row chi2
tab recentincar_base anyrecentopioids_q2 if retention2q==1, row chi2
tab recentincar_base anyrecentopioids_qu2 if retention2q==1, row chi2
tab recentincar_base anyrecentopioids_q3 if retention3q==1, row chi2
tab recentincar_base anyrecentopioids_qu3 if retention3q==1, row chi2
tab recentincar_base anyrecentopioids_q4 if retention4q==1, row chi2
tab recentincar_base anyrecentopioids_qu4 if retention4q==1, row chi2

tab parole_base anyrecentopioids_q1 if retention1q==1, row chi2
tab parole_base anyrecentopioids_qu1 if retention1q==1, row chi2
tab parole_base anyrecentopioids_q2 if retention2q==1, row chi2
tab parole_base anyrecentopioids_qu2 if retention2q==1, row chi2
tab parole_base anyrecentopioids_q3 if retention3q==1, row chi2
tab parole_base anyrecentopioids_qu3 if retention3q==1, row chi2
tab parole_base anyrecentopioids_q4 if retention4q==1, row chi2
tab parole_base anyrecentopioids_qu4 if retention4q==1, row chi2
