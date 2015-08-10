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

*How criminal justice at quarters affects retention

tab recentincar_q1 retention1q, row chi2
tab recentincar_qu1 retention1q, row exact
tab recentincar_q2 retention2q, row chi2
tab recentincar_qu2 retention2q, row chi2
tab recentincar_q3 retention3q, row chi2
tab recentincar_qu3 retention3q, row chi2
tab recentincar_q4 retention4q, row chi2
tab recentincar_qu4 retention4q, row chi2
tab parole_q1 retention1q, row chi2
tab parole_qu1 retention1q, row chi2
tab parole_q2 retention2q, row chi2
tab parole_qu2 retention2q, row chi2
tab parole_q3 retention3q, row chi2
tab parole_qu3 retention3q, row chi2
tab parole_q4 retention4q, row chi2
tab parole_qu4 retention4q, row chi2

*How criminal justice at baseline affects any quarterly opioid use

tab everincar_base anyrecentopioids_q1, row chi2
tab everincar_base anyrecentopioids_qu1, row chi2
tab everincar_base anyrecentopioids_q2, row chi2
tab everincar_base anyrecentopioids_qu2, row chi2
tab everincar_base anyrecentopioids_q3, row chi2
tab everincar_base anyrecentopioids_qu3, row chi2
tab everincar_base anyrecentopioids_q4, row chi2
tab everincar_base anyrecentopioids_qu4, row chi2

tab recentincar_base anyrecentopioids_q1, row chi2
tab recentincar_base anyrecentopioids_qu1, row chi2
tab recentincar_base anyrecentopioids_q2, row chi2
tab recentincar_base anyrecentopioids_qu2, row chi2
tab recentincar_base anyrecentopioids_q3, row chi2
tab recentincar_base anyrecentopioids_qu3, row chi2
tab recentincar_base anyrecentopioids_q4, row chi2
tab recentincar_base anyrecentopioids_qu4, row chi2

tab parole_base anyrecentopioids_q1, row chi2
tab parole_base anyrecentopioids_qu1, row chi2
tab parole_base anyrecentopioids_q2, row chi2
tab parole_base anyrecentopioids_qu2, row chi2
tab parole_base anyrecentopioids_q3, row chi2
tab parole_base anyrecentopioids_qu3, row chi2
tab parole_base anyrecentopioids_q4, row chi2
tab parole_base anyrecentopioids_qu4, row chi2

*How criminal justice at baseline affects any opioid use in retained quarters

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

*How baseline criminal justice affects amount of quarterly opioid use 

by everincar_base, sort: summarize recentopioids_q1, detail
by everincar_base, sort: summarize recentopioids_qu1, detail
by everincar_base, sort: summarize recentopioids_q2, detail
by everincar_base, sort: summarize recentopioids_qu2, detail
by everincar_base, sort: summarize recentopioids_q3, detail
by everincar_base, sort: summarize recentopioids_qu3, detail
by everincar_base, sort: summarize recentopioids_q4, detail
by everincar_base, sort: summarize recentopioids_qu4, detail

by recentincar_base, sort: summarize recentopioids_q1, detail
by recentincar_base, sort: summarize recentopioids_qu1, detail
by recentincar_base, sort: summarize recentopioids_q2, detail
by recentincar_base, sort: summarize recentopioids_qu2, detail
by recentincar_base, sort: summarize recentopioids_q3, detail
by recentincar_base, sort: summarize recentopioids_qu3, detail
by recentincar_base, sort: summarize recentopioids_q4, detail
by recentincar_base, sort: summarize recentopioids_qu4, detail

by parole_base, sort: summarize recentopioids_q1, detail
by parole_base, sort: summarize recentopioids_qu1, detail
by parole_base, sort: summarize recentopioids_q2, detail
by parole_base, sort: summarize recentopioids_qu2, detail
by parole_base, sort: summarize recentopioids_q3, detail
by parole_base, sort: summarize recentopioids_qu3, detail
by parole_base, sort: summarize recentopioids_q4, detail
by parole_base, sort: summarize recentopioids_qu4, detail

ranksum recentopioids_q1, by(everincar_base)
ranksum recentopioids_qu1, by(everincar_base)
ranksum recentopioids_q2, by(everincar_base)
ranksum recentopioids_qu2, by(everincar_base)
ranksum recentopioids_q3, by(everincar_base)
ranksum recentopioids_qu3, by(everincar_base)
ranksum recentopioids_q4, by(everincar_base)
ranksum recentopioids_qu4, by(everincar_base)

ranksum recentopioids_q1, by(recentincar_base)
ranksum recentopioids_qu1, by(recentincar_base)
ranksum recentopioids_q2, by(recentincar_base)
ranksum recentopioids_qu2, by(recentincar_base)
ranksum recentopioids_q3, by(recentincar_base)
ranksum recentopioids_qu3, by(recentincar_base)
ranksum recentopioids_q4, by(recentincar_base)
ranksum recentopioids_qu4, by(recentincar_base)

ranksum recentopioids_q1, by(parole_base)
ranksum recentopioids_qu1, by(parole_base)
ranksum recentopioids_q2, by(parole_base)
ranksum recentopioids_qu2, by(parole_base)
ranksum recentopioids_q3, by(parole_base)
ranksum recentopioids_qu3, by(parole_base)
ranksum recentopioids_q4, by(parole_base)
ranksum recentopioids_qu4, by(parole_base)

*How baseline criminal justice affects amount of opioid use in retained quarters 

ranksum recentopioids_q1 if retention1q==1, by(everincar_base)
ranksum recentopioids_qu1 if retention1q==1, by(everincar_base)
ranksum recentopioids_q2 if retention2q==1, by(everincar_base)
ranksum recentopioids_qu2 if retention2q==1, by(everincar_base)
ranksum recentopioids_q3 if retention3q==1, by(everincar_base)
ranksum recentopioids_qu3 if retention3q==1, by(everincar_base)
ranksum recentopioids_q4 if retention4q==1, by(everincar_base)
ranksum recentopioids_qu4 if retention4q==1, by(everincar_base)

ranksum recentopioids_q1 if retention1q==1, by(recentincar_base)
ranksum recentopioids_qu1 if retention1q==1, by(recentincar_base)
ranksum recentopioids_q2 if retention2q==1, by(recentincar_base)
ranksum recentopioids_qu2 if retention2q==1, by(recentincar_base)
ranksum recentopioids_q3 if retention3q==1, by(recentincar_base)
ranksum recentopioids_qu3 if retention3q==1, by(recentincar_base)
ranksum recentopioids_q4 if retention4q==1, by(recentincar_base)
ranksum recentopioids_qu4 if retention4q==1, by(recentincar_base)

ranksum recentopioids_q1 if retention1q==1, by(parole_base)
ranksum recentopioids_qu1 if retention1q==1, by(parole_base)
ranksum recentopioids_q2 if retention2q==1, by(parole_base)
ranksum recentopioids_qu2 if retention2q==1, by(parole_base)
ranksum recentopioids_q3 if retention3q==1, by(parole_base)
ranksum recentopioids_qu3 if retention3q==1, by(parole_base)
ranksum recentopioids_q4 if retention4q==1, by(parole_base)
ranksum recentopioids_qu4 if retention4q==1, by(parole_base)

*How criminal justice at quarters affects amount of quarterly opioid use 

ranksum recentopioids_base, by(recentincar_base)
ranksum recentopioids_q1, by(recentincar_q1)
ranksum recentopioids_qu1, by(recentincar_qu1)
ranksum recentopioids_q2, by(recentincar_q2)
ranksum recentopioids_qu2, by(recentincar_qu2)
ranksum recentopioids_q3, by(recentincar_q3)
ranksum recentopioids_qu3, by(recentincar_qu3)
ranksum recentopioids_q4, by(recentincar_q4)
ranksum recentopioids_qu4, by(recentincar_qu4)

ranksum recentopioids_base, by(parole_base)
ranksum recentopioids_q1, by(parole_q1)
ranksum recentopioids_qu1, by(parole_qu1)
ranksum recentopioids_q2, by(parole_q2)
ranksum recentopioids_qu2, by(parole_qu2)
ranksum recentopioids_q3, by(parole_q3)
ranksum recentopioids_qu3, by(parole_qu3)
ranksum recentopioids_q4, by(parole_q4)
ranksum recentopioids_qu4, by(parole_qu4)

*How criminal justice at quarters affects amount of quarterly opioid use 

ranksum recentopioids_base, by(recentincar_base)
ranksum recentopioids_q1 if retention1q==1, by(recentincar_q1)
ranksum recentopioids_qu1 if retention1q==1, by(recentincar_qu1)
ranksum recentopioids_q2 if retention2q==1, by(recentincar_q2)
ranksum recentopioids_qu2 if retention2q==1, by(recentincar_qu2)
ranksum recentopioids_q3 if retention3q==1, by(recentincar_q3)
ranksum recentopioids_qu3 if retention3q==1, by(recentincar_qu3)
ranksum recentopioids_q4 if retention4q==1, by(recentincar_q4)
ranksum recentopioids_qu4 if retention4q==1, by(recentincar_qu4)

ranksum recentopioids_base, by(parole_base)
ranksum recentopioids_q1 if retention1q==1, by(parole_q1)
ranksum recentopioids_qu1 if retention1q==1, by(parole_qu1)
ranksum recentopioids_q2 if retention2q==1, by(parole_q2)
ranksum recentopioids_qu2 if retention2q==1, by(parole_qu2)
ranksum recentopioids_q3 if retention3q==1, by(parole_q3)
ranksum recentopioids_qu3 if retention3q==1, by(parole_qu3)
ranksum recentopioids_q4 if retention4q==1, by(parole_q4)
ranksum recentopioids_qu4 if retention4q==1, by(parole_qu4)

*How criminal justice at quarters affects any quarterly opioid use

tab recentincar_base anyrecentopioids_base, row chi2
tab recentincar_q1 anyrecentopioids_q1, row chi2
tab recentincar_qu1 anyrecentopioids_qu1, row exact
tab recentincar_q2 anyrecentopioids_q2, row chi2
tab recentincar_qu2 anyrecentopioids_qu2, row chi2
tab recentincar_q3 anyrecentopioids_q3, row chi2
tab recentincar_qu3 anyrecentopioids_qu3, row chi2
tab recentincar_q4 anyrecentopioids_q4, row chi2
tab recentincar_qu4 anyrecentopioids_qu4, row chi2

tab parole_base anyrecentopioids_base, row chi2
tab parole_q1 anyrecentopioids_q1, row chi2
tab parole_qu1 anyrecentopioids_qu1, row chi2
tab parole_q2 anyrecentopioids_q2, row chi2
tab parole_qu2 anyrecentopioids_qu2, row chi2
tab parole_q3 anyrecentopioids_q3, row chi2
tab parole_qu3 anyrecentopioids_qu3, row chi2
tab parole_q4 anyrecentopioids_q4, row chi2
tab parole_qu4 anyrecentopioids_qu4, row chi2

*How criminal justice at quarters affects any opioid use in retained quarters

tab recentincar_base anyrecentopioids_base, row chi2
tab recentincar_q1 anyrecentopioids_q1 if retention1q==1, row chi2
tab recentincar_qu1 anyrecentopioids_qu1 if retention1q==1, row exact
tab recentincar_q2 anyrecentopioids_q2 if retention2q==1, row chi2
tab recentincar_qu2 anyrecentopioids_qu2 if retention2q==1, row chi2
tab recentincar_q3 anyrecentopioids_q3 if retention3q==1, row chi2
tab recentincar_qu3 anyrecentopioids_qu3 if retention3q==1, row chi2
tab recentincar_q4 anyrecentopioids_q4 if retention4q==1, row chi2
tab recentincar_qu4 anyrecentopioids_qu4 if retention4q==1, row chi2

tab parole_base anyrecentopioids_base, row chi2
tab parole_q1 anyrecentopioids_q1 if retention1q==1, row chi2
tab parole_qu1 anyrecentopioids_qu1 if retention1q==1, row chi2
tab parole_q2 anyrecentopioids_q2 if retention2q==1, row chi2
tab parole_qu2 anyrecentopioids_qu2 if retention2q==1, row chi2
tab parole_q3 anyrecentopioids_q3 if retention3q==1, row chi2
tab parole_qu3 anyrecentopioids_qu3 if retention3q==1, row chi2
tab parole_q4 anyrecentopioids_q4 if retention4q==1, row chi2
tab parole_qu4 anyrecentopioids_qu4 if retention4q==1, row chi2
