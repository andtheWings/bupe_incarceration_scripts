*How criminal justice at baseline affects treatment retention

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

*How criminal justice at baseline affects any quarterly opioid use

tab everincar_base anyrecentopioids_base, row chi2
tab everincar_base anyrecentopioids_q1, row chi2
tab everincar_base anyrecentopioids_qu1, row chi2
tab everincar_base anyrecentopioids_q2, row chi2
tab everincar_base anyrecentopioids_qu2, row chi2
tab everincar_base anyrecentopioids_q3, row chi2
tab everincar_base anyrecentopioids_qu3, row chi2
tab everincar_base anyrecentopioids_q4, row chi2
tab everincar_base anyrecentopioids_qu4, row chi2

tab recentincar_base anyrecentopioids_base, row chi2
tab recentincar_base anyrecentopioids_q1, row chi2
tab recentincar_base anyrecentopioids_qu1, row chi2
tab recentincar_base anyrecentopioids_q2, row chi2
tab recentincar_base anyrecentopioids_qu2, row chi2
tab recentincar_base anyrecentopioids_q3, row chi2
tab recentincar_base anyrecentopioids_qu3, row chi2
tab recentincar_base anyrecentopioids_q4, row chi2
tab recentincar_base anyrecentopioids_qu4, row chi2

tab parole_base anyrecentopioids_base, row chi2
tab parole_base anyrecentopioids_q1, row chi2
tab parole_base anyrecentopioids_qu1, row chi2
tab parole_base anyrecentopioids_q2, row chi2
tab parole_base anyrecentopioids_qu2, row chi2
tab parole_base anyrecentopioids_q3, row chi2
tab parole_base anyrecentopioids_qu3, row chi2
tab parole_base anyrecentopioids_q4, row chi2
tab parole_base anyrecentopioids_qu4, row chi2

*How baseline criminal justice affects amount of quarterly opioid use 

ranksum recentopioids_base, by(everincar_base)
*p-vale = 0.05
ranksum recentopioids_q1, by(everincar_base)
ranksum recentopioids_qu1, by(everincar_base)
ranksum recentopioids_q2, by(everincar_base)
ranksum recentopioids_qu2, by(everincar_base)
ranksum recentopioids_q3, by(everincar_base)
ranksum recentopioids_qu3, by(everincar_base)
ranksum recentopioids_q4, by(everincar_base)
ranksum recentopioids_qu4, by(everincar_base)
*No other significant results

ranksum recentopioids_base, by(recentincar_base)
*p-value = 0.01
ranksum recentopioids_q1, by(recentincar_base)
ranksum recentopioids_qu1, by(recentincar_base)
ranksum recentopioids_q2, by(recentincar_base)
ranksum recentopioids_qu2, by(recentincar_base)
ranksum recentopioids_q3, by(recentincar_base)
ranksum recentopioids_qu3, by(recentincar_base)
ranksum recentopioids_q4, by(recentincar_base)
ranksum recentopioids_qu4, by(recentincar_base)
*No other significant results

ranksum recentopioids_base, by(parole_base)
ranksum recentopioids_q1, by(parole_base)
ranksum recentopioids_qu1, by(parole_base)
ranksum recentopioids_q2, by(parole_base)
ranksum recentopioids_qu2, by(parole_base)
ranksum recentopioids_q3, by(parole_base)
ranksum recentopioids_qu3, by(parole_base)
ranksum recentopioids_q4, by(parole_base)
ranksum recentopioids_qu4, by(parole_base)
*p-value = 0.03

*How retention for 3 or 4 quarters correlates with quarterly recent incarceration

tab retention1q recentincar_base, row chi2
tab retention1q recentincar_q1, row chi2
tab retention1q recentincar_q2, row chi2
tab retention1q recentincar_q3, row chi2
tab retention1q recentincar_q4, row chi2

tab retention2q recentincar_base, row chi2
tab retention2q recentincar_q1, row chi2
tab retention2q recentincar_q2, row chi2
tab retention2q recentincar_q3, row chi2
tab retention2q recentincar_q4, row chi2

tab retention3q recentincar_base, row chi2
tab retention3q recentincar_q1, row chi2
tab retention3q recentincar_q2, row chi2
tab retention3q recentincar_q3, row chi2
tab retention3q recentincar_q4, row chi2

tab retention4q recentincar_base, row chi2
tab retention4q recentincar_q1, row chi2
tab retention4q recentincar_q2, row chi2
tab retention4q recentincar_q3, row chi2
tab retention4q recentincar_q4, row chi2

tab retention1q recentincar_base, row chi2
tab retention1q recentincar_qu1, row chi2
tab retention1q recentincar_qu2, row chi2
tab retention1q recentincar_qu3, row chi2
tab retention1q recentincar_qu4, row chi2

tab retention2q recentincar_base, row chi2
tab retention2q recentincar_qu1, row chi2
tab retention2q recentincar_qu2, row chi2
tab retention2q recentincar_qu3, row chi2
tab retention2q recentincar_qu4, row chi2

tab retention3q recentincar_base, row chi2
tab retention3q recentincar_qu1, row chi2
tab retention3q recentincar_qu2, row chi2
tab retention3q recentincar_qu3, row chi2
tab retention3q recentincar_qu4, row chi2

tab retention4q recentincar_base, row chi2
tab retention4q recentincar_qu1, row chi2
tab retention4q recentincar_qu2, row chi2
tab retention4q recentincar_qu3, row chi2
tab retention4q recentincar_qu4, row chi2
