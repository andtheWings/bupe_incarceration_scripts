*Modify "don't know" and "refused" missing values to generic missing values
recode alone .a=.
recode mentaldiag .a=.
recode treatedfordrugs .b=.
recode recentmethadonetx .a=.

*Summarize missingness of variables
misstable summarize age white black latino asian_and_other english male heterosexual married alone homeless hsdiploma employed mentaldiag injectdrugs everalcintox everheroin evermethadone everotherpk eversedative evercocaine evermarijuana everanyopioid recentalcintox recentheroin recentmethadone recentotherpk recentsedative recentcocaine recentmarijuana years_any_opioid overdosed treatedfordrugs recentmethadonetx retention1q retention2q retention3q retention4q everincar_base recentincar_base

*Look for patterns
misstable patterns age white black latino asian_and_other english male heterosexual married alone homeless hsdiploma employed mentaldiag injectdrugs everalcintox everheroin evermethadone everotherpk eversedative evercocaine evermarijuana everanyopioid recentalcintox recentheroin recentmethadone recentotherpk recentsedative recentcocaine recentmarijuana years_any_opioid overdosed treatedfordrugs recentmethadonetx retention1q retention2q retention3q retention4q everincar_base recentincar_base 
**No obvious patterns observed

*Identify variables that predict missingness of age

**logit miss_age white
**logit miss_age black
**logit miss_age latino
**logit miss_age asian_and_other
**logit miss_age english
**logit miss_age male
**logit miss_age heterosexual
**logit miss_age married
**logit miss_age alone
**logit miss_age homeless
**logit miss_age hsdiploma
**logit miss_age employed
**logit miss_age mentaldiag
**logit miss_age injectdrugs
**logit miss_age everalcintox
**logit miss_age everheroin
**logit miss_age evermethadone 
**logit miss_age everotherpk 
**logit miss_age eversedative 
**logit miss_age evercocaine
**logit miss_age evermarijuana
**logit miss_age everanyopioid
**logit miss_age recentalcintox
**logit miss_age recentheroin
**logit miss_age recentmethadone
**logit miss_age recentotherpk
**logit miss_age recentsedative
**logit miss_age recentcocaine
**logit miss_age recentmarijuana
**logit miss_age years_any_opioid
**logit miss_age overdosed
**logit miss_age treatedfordrugs
**logit miss_age recentmethadonetx
**logit miss_age everincar_base
**logit miss_age recentincar_base
***associated = alone everotherpk recentmarijuana

*Imputation set-up
mi set flong
mi register imputed age
mi register regular white black latino heterosexual alone injectdrugs everheroin everotherpk eversedative recentmarijuana years_any_opioid overdosed male homeless mentaldiag asidrugscore

*Imputation performed 50 times with 5 nearest neighbors
mi impute pmm age white black latino heterosexual alone injectdrugs everheroin everotherpk eversedative recentmarijuana years_any_opioid overdosed male homeless mentaldiag asidrugscore, add(50) knn(5) rseed(4450) force

*Logistic modeling of 2 and 4 quarter retention

**Full model (backwards stepwise method):
***mi estimate: logistic retention2q age white male homeless mentaldiag asidrugscore injectdrugs everheroin recentincar_base
***mi estimate: logistic retention4q age white male homeless mentaldiag asidrugscore injectdrugs everheroin recentincar_base

***mi estimate: logistic retention2q age white male homeless mentaldiag injectdrugs everheroin recentincar_base
***mi estimate: logistic retention4q age white male homeless asidrugscore injectdrugs everheroin recentincar_base

***mi estimate: logistic retention2q age white male homeless injectdrugs everheroin recentincar_base
***mi estimate: logistic retention4q age white male asidrugscore injectdrugs everheroin recentincar_base

mi estimate: logistic retention2q age white male injectdrugs everheroin recentincar_base
mi estimate: logistic retention4q age white male injectdrugs everheroin recentincar_base

