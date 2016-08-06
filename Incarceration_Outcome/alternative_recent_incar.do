quietly misstable summarize recentincar_q1 recentincar_q2 recentincar_q3 recentincar_q4, generate (miss_)

logit recentincar_q1 age
logit recentincar_q1 white
logit recentincar_q1 black
logit recentincar_q1 latino
logit recentincar_q1 asian_and_other
logit recentincar_q1 english
logit recentincar_q1 male
logit recentincar_q1 heterosexual
logit recentincar_q1 married
logit recentincar_q1 alone
logit recentincar_q1 homeless
logit recentincar_q1 hsdiploma
logit recentincar_q1 employed
logit recentincar_q1 mentaldiag
logit recentincar_q1 injectdrugs
logit recentincar_q1 everalcintox
logit recentincar_q1 everheroin
logit recentincar_q1 evermethadone 
logit recentincar_q1 everotherpk 
logit recentincar_q1 eversedative 
logit recentincar_q1 evercocaine
logit recentincar_q1 evermarijuana
logit recentincar_q1 everanyopioid
logit recentincar_q1 recentalcintox
logit recentincar_q1 recentheroin
logit recentincar_q1 recentmethadone
logit recentincar_q1 recentotherpk
logit recentincar_q1 recentsedative
logit recentincar_q1 recentcocaine
logit recentincar_q1 recentmarijuana
logit recentincar_q1 years_any_opioid
logit recentincar_q1 overdosed
logit recentincar_q1 treatedfordrugs
logit recentincar_q1 recentmethadonetx
logit recentincar_q1 everincar_base
logit recentincar_q1 recentincar_base
*everalcintox injectdrugs

logit recentincar_q2 age
logit recentincar_q2 white
logit recentincar_q2 black
logit recentincar_q2 latino
logit recentincar_q2 asian_and_other
logit recentincar_q2 english
logit recentincar_q2 male
logit recentincar_q2 heterosexual
logit recentincar_q2 married
logit recentincar_q2 alone
logit recentincar_q2 homeless
logit recentincar_q2 hsdiploma
logit recentincar_q2 employed
logit recentincar_q2 mentaldiag
logit recentincar_q2 injectdrugs
logit recentincar_q2 everheroin
logit recentincar_q2 evermethadone 
logit recentincar_q2 everotherpk 
logit recentincar_q2 eversedative 
logit recentincar_q2 evercocaine
logit recentincar_q2 evermarijuana
logit recentincar_q2 everanyopioid
logit recentincar_q2 recentalcintox
logit recentincar_q2 recentheroin
logit recentincar_q2 recentmethadone
logit recentincar_q2 recentotherpk
logit recentincar_q2 recentsedative
logit recentincar_q2 recentcocaine
logit recentincar_q2 recentmarijuana
logit recentincar_q2 years_any_opioid
logit recentincar_q2 overdosed
logit recentincar_q2 treatedfordrugs
logit recentincar_q2 recentmethadonetx
logit recentincar_q2 everincar_base
logit recentincar_q2 recentincar_base
*recentcocaine male english

logit recentincar_q3 age
logit recentincar_q3 white
logit recentincar_q3 black
logit recentincar_q3 latino
logit recentincar_q3 asian_and_other
logit recentincar_q3 heterosexual
logit recentincar_q3 married
logit recentincar_q3 alone
logit recentincar_q3 homeless
logit recentincar_q3 hsdiploma
logit recentincar_q3 employed
logit recentincar_q3 mentaldiag
logit recentincar_q3 everheroin
logit recentincar_q3 evermethadone 
logit recentincar_q3 everotherpk 
logit recentincar_q3 eversedative 
logit recentincar_q3 evercocaine
logit recentincar_q3 evermarijuana
logit recentincar_q3 everanyopioid
logit recentincar_q3 recentalcintox
logit recentincar_q3 recentheroin
logit recentincar_q3 recentmethadone
logit recentincar_q3 recentotherpk
logit recentincar_q3 recentsedative
logit recentincar_q3 recentmarijuana
logit recentincar_q3 years_any_opioid
logit recentincar_q3 overdosed
logit recentincar_q3 treatedfordrugs
logit recentincar_q3 recentmethadonetx
logit recentincar_q3 everincar_base
logit recentincar_q3 recentincar_base
*alone

logit recentincar_q4 age
logit recentincar_q4 white
logit recentincar_q4 black
logit recentincar_q4 latino
logit recentincar_q4 asian_and_other
logit recentincar_q4 heterosexual
logit recentincar_q4 married
logit recentincar_q4 homeless
logit recentincar_q4 hsdiploma
logit recentincar_q4 employed
logit recentincar_q4 mentaldiag
logit recentincar_q4 injectdrugs
logit recentincar_q4 everheroin
logit recentincar_q4 evermethadone 
logit recentincar_q4 everotherpk 
logit recentincar_q4 eversedative 
logit recentincar_q4 evercocaine
logit recentincar_q4 evermarijuana
logit recentincar_q4 everanyopioid
logit recentincar_q4 recentalcintox
logit recentincar_q4 recentheroin
logit recentincar_q4 recentmethadone
logit recentincar_q4 recentotherpk
logit recentincar_q4 recentsedative
logit recentincar_q4 recentmarijuana
logit recentincar_q4 years_any_opioid
logit recentincar_q4 overdosed
logit recentincar_q4 treatedfordrugs
logit recentincar_q4 recentmethadonetx
logit recentincar_q4 everincar_base
logit recentincar_q4 recentincar_base

logit miss_recentincar_q1 age
logit miss_recentincar_q1 white
logit miss_recentincar_q1 black
logit miss_recentincar_q1 latino
logit miss_recentincar_q1 asian_and_other
logit miss_recentincar_q1 english
logit miss_recentincar_q1 male
logit miss_recentincar_q1 heterosexual
logit miss_recentincar_q1 married
logit miss_recentincar_q1 alone
logit miss_recentincar_q1 homeless
logit miss_recentincar_q1 hsdiploma
logit miss_recentincar_q1 employed
logit miss_recentincar_q1 mentaldiag
logit miss_recentincar_q1 injectdrugs
logit miss_recentincar_q1 everalcintox
logit miss_recentincar_q1 everheroin
logit miss_recentincar_q1 evermethadone 
logit miss_recentincar_q1 everotherpk 
logit miss_recentincar_q1 eversedative 
logit miss_recentincar_q1 evercocaine
logit miss_recentincar_q1 evermarijuana
logit miss_recentincar_q1 everanyopioid
logit miss_recentincar_q1 recentalcintox
logit miss_recentincar_q1 recentheroin
logit miss_recentincar_q1 recentmethadone
logit miss_recentincar_q1 recentotherpk
logit miss_recentincar_q1 recentsedative
logit miss_recentincar_q1 recentcocaine
logit miss_recentincar_q1 recentmarijuana
logit miss_recentincar_q1 years_any_opioid
logit miss_recentincar_q1 overdosed
logit miss_recentincar_q1 treatedfordrugs
logit miss_recentincar_q1 recentmethadonetx
logit miss_recentincar_q1 everincar_base
logit miss_recentincar_q1 recentincar_base
*recentincar_base eversedative age

logit miss_recentincar_q2 white
logit miss_recentincar_q2 black
logit miss_recentincar_q2 latino
logit miss_recentincar_q2 asian_and_other
logit miss_recentincar_q2 english
logit miss_recentincar_q2 male
logit miss_recentincar_q2 heterosexual
logit miss_recentincar_q2 married
logit miss_recentincar_q2 alone
logit miss_recentincar_q2 homeless
logit miss_recentincar_q2 hsdiploma
logit miss_recentincar_q2 employed
logit miss_recentincar_q2 mentaldiag
logit miss_recentincar_q2 injectdrugs
logit miss_recentincar_q2 everalcintox
logit miss_recentincar_q2 everheroin
logit miss_recentincar_q2 evermethadone 
logit miss_recentincar_q2 everotherpk 
logit miss_recentincar_q2 evercocaine
logit miss_recentincar_q2 evermarijuana
logit miss_recentincar_q2 everanyopioid
logit miss_recentincar_q2 recentalcintox
logit miss_recentincar_q2 recentheroin
logit miss_recentincar_q2 recentmethadone
logit miss_recentincar_q2 recentotherpk
logit miss_recentincar_q2 recentsedative
logit miss_recentincar_q2 recentcocaine
logit miss_recentincar_q2 recentmarijuana
logit miss_recentincar_q2 years_any_opioid
logit miss_recentincar_q2 overdosed
logit miss_recentincar_q2 treatedfordrugs
logit miss_recentincar_q2 recentmethadonetx
logit miss_recentincar_q2 everincar_base
*recentmarijuana evermethadone

logit miss_recentincar_q3 white
logit miss_recentincar_q3 black
logit miss_recentincar_q3 latino
logit miss_recentincar_q3 asian_and_other
logit miss_recentincar_q3 english
logit miss_recentincar_q3 male
logit miss_recentincar_q3 heterosexual
logit miss_recentincar_q3 married
logit miss_recentincar_q3 alone
logit miss_recentincar_q3 homeless
logit miss_recentincar_q3 hsdiploma
logit miss_recentincar_q3 employed
logit miss_recentincar_q3 mentaldiag
logit miss_recentincar_q3 injectdrugs
logit miss_recentincar_q3 everalcintox
logit miss_recentincar_q3 everheroin
logit miss_recentincar_q3 everotherpk 
logit miss_recentincar_q3 evercocaine
logit miss_recentincar_q3 evermarijuana
logit miss_recentincar_q3 everanyopioid
logit miss_recentincar_q3 recentalcintox
logit miss_recentincar_q3 recentheroin
logit miss_recentincar_q3 recentmethadone
logit miss_recentincar_q3 recentotherpk
logit miss_recentincar_q3 recentsedative
logit miss_recentincar_q3 recentcocaine
logit miss_recentincar_q3 years_any_opioid
logit miss_recentincar_q3 overdosed
logit miss_recentincar_q3 treatedfordrugs
logit miss_recentincar_q3 recentmethadonetx
logit miss_recentincar_q3 everincar_base
*recentheroin

logit miss_recentincar_q4 white
logit miss_recentincar_q4 black
logit miss_recentincar_q4 latino
logit miss_recentincar_q4 asian_and_other
logit miss_recentincar_q4 english
logit miss_recentincar_q4 male
logit miss_recentincar_q4 heterosexual
logit miss_recentincar_q4 married
logit miss_recentincar_q4 alone
logit miss_recentincar_q4 homeless
logit miss_recentincar_q4 hsdiploma
logit miss_recentincar_q4 employed
logit miss_recentincar_q4 mentaldiag
logit miss_recentincar_q4 injectdrugs
logit miss_recentincar_q4 everalcintox
logit miss_recentincar_q4 everheroin
logit miss_recentincar_q4 everotherpk 
logit miss_recentincar_q4 evercocaine
logit miss_recentincar_q4 evermarijuana
logit miss_recentincar_q4 everanyopioid
logit miss_recentincar_q4 recentalcintox
logit miss_recentincar_q4 recentmethadone
logit miss_recentincar_q4 recentotherpk
logit miss_recentincar_q4 recentsedative
logit miss_recentincar_q4 recentcocaine
logit miss_recentincar_q4 years_any_opioid
logit miss_recentincar_q4 overdosed
logit miss_recentincar_q4 treatedfordrugs
logit miss_recentincar_q4 recentmethadonetx
logit miss_recentincar_q4 everincar_base
*recentalcintox
