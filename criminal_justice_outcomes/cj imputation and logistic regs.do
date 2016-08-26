*Locked into the model -- age, white, male, everincar_base
*Seem associated with incarceration -- male, recentcocaine, recentmarijuana, years_any_opioid
*Associated with missingness of Q2 incar -- english, homeless, evermethadone, recentmethadone, recentmarijuana
*Associated with missingness of Q4 incar -- english, male
*Seem associated with age -- white, heterosexual, alone, inject drugs, everheroin, recentmarijuana, years_any_opioid, overdosed
*Associated with missingness of age -- alone, everotherpk, recentmarijuana

*Imputation set-up
mi set flong
mi register imputed age recentincar_qu2 recentincar_qu4
mi register regular white english male heterosexual alone homeless injectdrugs everheroin evermethadone recentmethadone everotherpk recentcocaine recentmarijuana years_any_opioid overdosed everincar_base bupe_qu1 bupe_qu3

*Perform imputation
mi impute chained (pmm, knn(5) omit(english homeless evermethadone recentmethadone)) age (logit, omit(heterosexual alone injectdrugs everheroin everotherpk overdosed)) recentincar_qu2 (logit, omit(heterosexual alone injectdrugs everheroin evermethadone recentmethadone everotherpk overdosed)) recentincar_qu4 = white english male heterosexual alone homeless injectdrugs everheroin evermethadone recentmethadone everotherpk recentcocaine recentmarijuana years_any_opioid overdosed everincar_base bupe_qu1 bupe_qu3, add(20) rseed(18) force augment

*Logistic regression of Q2 incarceration from Q1 BMT treatment
*mi estimate: logistic recentincar_qu2 age white male everincar_base recentcocaine recentmarijuana years_any_opioid bupe_qu1
*mi estimate: logistic recentincar_qu2 age white male everincar_base recentcocaine recentmarijuana bupe_qu1
mi estimate: logistic recentincar_qu2 age white male everincar_base recentcocaine bupe_qu1

*Logistic regression of Q4 incarceration from Q3 BMT treatment
*mi estimate: logistic recentincar_qu4 age white male everincar_base recentcocaine recentmarijuana years_any_opioid bupe_qu3
*mi estimate: logistic recentincar_qu4 age white male everincar_base recentcocaine years_any_opioid bupe_qu3
mi estimate: logistic recentincar_qu4 age white male everincar_base years_any_opioid bupe_qu3
