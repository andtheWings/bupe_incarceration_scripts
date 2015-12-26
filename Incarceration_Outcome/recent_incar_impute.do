*Summarize missingness of variables
misstable summarize age white black latino asian_and_other english male heterosexual married alone homeless hsdiploma employed mentaldiag injectdrugs everalcintox everheroin evermethadone everotherpk eversedative evercocaine evermarijuana everanyopioid recentalcintox recentheroin recentmethadone recentotherpk recentsedative recentcocaine recentmarijuana years_any_opioid overdosed treatedfordrugs recentmethadonetx retention1q retention2q retention3q retention4q recentincar_qu1 recentincar_qu2 recentincar_qu3 recentincar_qu4

*Modify "don't know" and "refused" missing values to generic missing values
recode alone .a=.
recode mentaldiag .a=.
recode treatedfordrugs .b=.
recode recentmethadonetx .a=.

*Look for patterns
**Most common pattern is for all 4 quarterly incarceration indicators to be missing
misstable patterns age white black latino asian_and_other english male heterosexual married alone homeless hsdiploma employed mentaldiag injectdrugs everalcintox everheroin evermethadone everotherpk eversedative evercocaine evermarijuana everanyopioid recentalcintox recentheroin recentmethadone recentotherpk recentsedative recentcocaine recentmarijuana years_any_opioid overdosed treatedfordrugs recentmethadonetx retention1q retention2q retention3q retention4q recentincar_qu1 recentincar_qu2 recentincar_qu3 recentincar_qu4

*Generate missing-indicator variables
quietly misstable summarize age white black latino asian_and_other english male heterosexual married alone homeless hsdiploma employed mentaldiag injectdrugs everalcintox everheroin evermethadone everotherpk eversedative evercocaine evermarijuana everanyopioid recentalcintox recentheroin recentmethadone recentotherpk recentsedative recentcocaine recentmarijuana years_any_opioid overdosed treatedfordrugs recentmethadonetx retention1q retention2q retention3q retention4q recentincar_qu1 recentincar_qu2 recentincar_qu3 recentincar_qu4, generate (miss_)

*Identify variables that predict missingness

