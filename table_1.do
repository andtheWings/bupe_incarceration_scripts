*This table reports variables only investigated in the baseline interview 
*or variables with "ever" in the baseline interview's question stem. The table only includes
*subjects who were treated with buprenorphine at any point in the study. It sorts
*by whether individuals had ever been incarcerated greater than 3 days 
*before or during the study.

*drop if recentincar_base==.
**for paper on treatment outcomes from recent incarceration

*''Age''

histogram age 
summarize age

histogram age, by(everincar_base)
ttest age, by(everincar_base)	

histogram age, by(parole_base)
ttest age, by(parole_base) 

histogram age, by(recentincar_base)
ttest age, by(recentincar_base) 

histogram age, by(retention4q)
ttest age, by(retention4q)

*''Site''

tab everincar_base site, row chi2
tab recentincar_base site, row chi2
tab parole_base site, row chi2
tab retention4q site, row chi2

*''Race/Ethnicity''

fre white
fre black
fre latino
fre asian_and_other

tab everincar_base white, row chi2
tab everincar_base black, row chi2
tab everincar_base latino, row chi2
tab everincar_base asian_and_other, row chi2 exact

tab recentincar_base white, row chi2 miss
tab recentincar_base black, row chi2 miss
tab recentincar_base latino, row chi2 miss
tab recentincar_base asian_and_other, row chi2 exact miss

tab parole_base white, row chi2
tab parole_base black, row chi2
tab parole_base latino, row chi2
tab parole_base asian_and_other, row chi2 exact

tab retention4q white, row chi2
tab retention4q black, row chi2
tab retention4q latino, row chi2
tab retention4q asian_and_other, row chi2 exact

*''English as primary language''

fre english
tab everincar_base english, row chi2
tab recentincar_base english, row chi2
tab parole_base english, row chi2

*''Male''

fre male
tab everincar_base male, row chi2 miss
tab recentincar_base male, row chi2 miss
tab parole_base male, row chi2 miss
tab retention4q male, row chi2 miss

*''Heterosexual''

fre heterosexual
tab everincar_base heterosexual, row chi2
tab recentincar_base heterosexual, row chi2
tab parole_base heterosexual, row chi2

*''Married''

fre married
tab everincar_base married, row chi2
tab recentincar_base married, row chi2
tab parole_base married, row chi2

*''Lives alone''

fre alone
tab everincar_base alone, row chi2
tab recentincar_base alone, row chi2 exact
tab parole_base alone, row chi2

*''Self-reported homelessness''

fre homeless
tab everincar_base homeless, row chi2 miss
tab recentincar_base homeless, row chi2 miss
tab parole_base homeless, row chi2 miss
tab retention4q homeless, row chi2 miss

*''High school diploma or equivalency''

fre hsdiploma
tab everincar_base hsdiploma, row chi2 miss
tab recentincar_base hsdiploma, row chi2 miss
tab parole_base hsdiploma, row chi2 miss
tab retention4q hsdiploma, row chi2 miss

*''Employed''

fre employed
tab everincar_base employed, row chi2 miss
tab recentincar_base employed, row chi2 exact miss
tab parole_base employed, row chi2 miss
tab retention4q employed, row chi2 miss

*''Years since HIV diagnosis''

*histogram sincediagnosis
*summarize sincediagnosis, detail

*by everincar_base, sort: summarize sincediagnosis, detail
*ranksum sincediagnosis, by(everincar_base)
*by recentincar_base, sort: summarize sincediagnosis, detail
*ranksum sincediagnosis, by(recentincar_base)
*by parole_base, sort: summarize sincediagnosis, detail
*ranksum sincediagnosis, by(parole_base)

*Lowest CD4 count
*  **Note** this must be evaluated in the master baseline dataset

*histogram lowestcd4
*summarize lowestcd4, detail

*by everincar_base, sort: summarize lowestcd4, detail
*ranksum lowestcd4, by(everincar_base)
*by recentincar_base, sort: summarize lowestcd4, detail
*ranksum lowestcd4, by(recentincar_base)
*by parole_base, sort: summarize lowestcd4, detail
*ranksum lowestcd4, by(parole_base)

*Ever diagnosed with mental illness

fre mentaldiag
tab everincar_base mentaldiag, row chi2 miss
tab recentincar_base mentaldiag, row chi2 miss
tab parole_base mentaldiag, row chi2 miss
tab retention4q mentaldiag, row chi2 miss

*''Depression Scale''

histogram cesdstandardmean
summarize cesdstandardmean

histogram cesdstandardmean, by(everincar_base)
histogram cesdstandardmean, by(recentincar_base)
histogram cesdstandardmean, by(parole_base)

ttest cesdstandardmean, by(everincar_base) unequal
ttest cesdstandardmean, by(recentincar_base) unequal
ttest cesdstandardmean, by(parole_base) unequal

*''Ready to make change in heroin/opioid use''

*scatter drugtximportant readytochange

*histogram readytochange recentincar_base, by(everincar_base)

*ranksum readytochange recentincar_base, by(everincar_base)
*median readytochange recentincar_base, by(everincar_base) exact medianties(split)
*by everincar_base, sort : summarize readytochange recentincar_base, detail

*''Composite score for alcohol use''

histogram asialcscore
summarize asialcscore, detail

by everincar_base, sort: summarize asialcscore, detail
ranksum asialcscore, by(everincar_base)
by recentincar_base, sort: summarize asialcscore, detail
ranksum asialcscore, by(recentincar_base)
by parole_base, sort: summarize asialcscore, detail
ranksum asialcscore, by(parole_base)

*''Composite score for drug use''

histogram asidrugscore
summarize asidrugscore

histogram asidrugscore, by(everincar_base)
histogram asidrugscore, by(recentincar_base)
histogram asidrugscore, by(parole_base)
histogram asidrugscore, by(retention4q)

ttest asidrugscore, by(everincar_base) unequal
ttest asidrugscore, by(recentincar_base) unequal
ttest asidrugscore, by(parole_base) unequal
ttest asidrugscore, by(retention4q) unequal

*Inject drugs ever?

fre injectdrugs
tab everincar_base injectdrugs, row chi2 miss
tab recentincar_base injectdrugs, row chi2 miss
tab parole_base injectdrugs, row chi2 miss
tab retention4q injectdrugs, row chi2 miss

*Ever use specific drugs?

fre everalcintox
tab everincar_base everalcintox, row chi2
tab recentincar_base everalcintox, row chi2
tab parole_base everalcintox, row chi2

fre everheroin
tab everincar_base everheroin, row chi2 miss
tab recentincar_base everheroin, row chi2 miss
tab parole_base everheroin, row chi2 miss
tab retention4q everheroin, row chi2 miss

fre evermethadone
tab everincar_base evermethadone, row chi2
tab recentincar_base evermethadone, row chi2
tab parole_base evermethadone, row chi2

fre everotherpk
tab everincar_base everotherpk, row chi2
tab recentincar_base everotherpk, row chi2
tab parole_base everotherpk, row chi2

fre everanyopioid
tab everincar_base everanyopioid, row chi2
tab recentincar_base everanyopioid, row chi2
tab parole_base everanyopioid, row chi2

fre eversedative
tab everincar_base eversedative, row chi2
tab recentincar_base eversedative, row chi2
tab parole_base eversedative, row chi2

fre evercocaine
tab everincar_base evercocaine, row chi2
tab recentincar_base evercocaine, row chi2
tab parole_base evercocaine, row chi2

fre evermarijuana
tab everincar_base evermarijuana, row chi2
tab recentincar_base evermarijuana, row chi2
tab parole_base evermarijuana, row chi2

*''Recent drug use:''

fre recentalcintox
tab everincar_base recentalcintox, row chi2
tab recentincar_base recentalcintox, row chi2
tab parole_base recentalcintox, row chi2

fre recentheroin
tab everincar_base recentheroin, row chi2
tab recentincar_base recentheroin, row chi2
tab parole_base recentheroin, row chi2
tab retention4q recentheroin, row chi2

fre recentmethadone
tab everincar_base recentmethadone, row chi2
tab recentincar_base recentmethadone, row chi2
tab parole_base recentmethadone, row chi2

fre recentotherpk
tab everincar_base recentotherpk, row chi2
tab recentincar_base recentotherpk, row chi2
tab parole_base recentotherpk, row chi2

fre recentsedative
tab everincar_base recentsedative, row chi2
tab recentincar_base recentsedative, row chi2
tab parole_base recentsedative, row chi2

fre recentcocaine
tab everincar_base recentcocaine, row chi2
tab recentincar_base recentcocaine, row chi2
tab parole_base recentcocaine, row chi2
tab retention4q recentcocaine, row chi2

fre recentmarijuana
tab everincar_base recentmarijuana, row chi2
tab recentincar_base recentmarijuana, row chi2
tab parole_base recentmarijuana, row chi2

*tab recentalcintox everalcintox, column
*tab recentheroin everheroin, column
*tab recentmethadone evermethadone, column
*tab recentotherpk everotherpk, column
*tab recentsedative eversedative, column
*tab recentcocaine evercocaine, column
*tab recentmarijuana evermarijuana, column

*fre bc102d
*recode bc102d 98=.a 99=.b

*histogram bc102d recentincar_base
*summarize bc102d recentincar_base, detail

*by everincar_base, sort: summarize bc102d recentincar_base, detail
*ranksum bc102d recentincar_base, by(everincar_base)
*by recentincar_base, sort: summarize bc102d recentincar_base, detail
*ranksum bc102d recentincar_base, by(recentincar_base)
*by parole_base, sort: summarize bc102d recentincar_base, detail
*ranksum bc102d recentincar_base, by(parole_base)

*fre bc103d
*recode bc103d 92=.a

*histogram bc103d recentincar_base
*summarize bc103d recentincar_base, detail

*by everincar_base, sort: summarize bc103d recentincar_base, detail
*ranksum bc103d recentincar_base, by(everincar_base)
*by recentincar_base, sort: summarize bc103d recentincar_base, detail
*ranksum bc103d recentincar_base, by(recentincar_base)
*by parole_base, sort: summarize bc103d recentincar_base, detail
*ranksum bc103d recentincar_base, by(parole_base)

*fre bc104d

*histogram bc104d recentincar_base
*summarize bc104d recentincar_base, detail

*by everincar_base, sort: summarize bc104d recentincar_base, detail
*ranksum bc104d recentincar_base, by(everincar_base)
*by recentincar_base, sort: summarize bc104d recentincar_base, detail
*ranksum bc104d recentincar_base, by(recentincar_base)
*by parole_base, sort: summarize bc104d recentincar_base, detail
*ranksum bc104d recentincar_base, by(parole_base)

*fre bc105d

*histogram bc105d recentincar_base
*summarize bc105d recentincar_base, detail

*by everincar_base, sort: summarize bc105d recentincar_base, detail
*ranksum bc105d recentincar_base, by(everincar_base)
*by recentincar_base, sort: summarize bc105d recentincar_base, detail
*ranksum bc105d recentincar_base, by(recentincar_base)
*by parole_base, sort: summarize bc105d recentincar_base, detail
*ranksum bc105d recentincar_base, by(parole_base)

*fre bc107d
*recode bc107d 98=.a

*histogram bc107d recentincar_base
*summarize bc107d recentincar_base, detail

*by everincar_base, sort: summarize bc107d recentincar_base, detail
*ranksum bc107d recentincar_base, by(everincar_base)
*by recentincar_base, sort: summarize bc107d recentincar_base, detail
*ranksum bc107d recentincar_base, by(recentincar_base)
*by parole_base, sort: summarize bc107d recentincar_base, detail
*ranksum bc107d recentincar_base, by(parole_base)

*fre bc108d

*histogram bc108d recentincar_base
*summarize bc108d recentincar_base, detail

*by everincar_base, sort: summarize bc108d recentincar_base, detail
*ranksum bc108d recentincar_base, by(everincar_base)
*by recentincar_base, sort: summarize bc108d recentincar_base, detail
*ranksum bc108d recentincar_base, by(recentincar_base)
*by parole_base, sort: summarize bc108d recentincar_base, detail
*ranksum bc108d recentincar_base, by(parole_base)

*fre bc110d

*histogram bc110d recentincar_base
*summarize bc110d recentincar_base, detail

*by everincar_base, sort: summarize bc110d recentincar_base, detail
*ranksum bc110d recentincar_base, by(everincar_base)
*by recentincar_base, sort: summarize bc110d recentincar_base, detail
*ranksum bc110d recentincar_base, by(recentincar_base)
*by parole_base, sort: summarize bc110d recentincar_base, detail
*ranksum bc110d recentincar_base, by(parole_base)

*''Years of Regular Drug Use (Heroin and other pain-killers)''

histogram years_any_opioid
summarize years_any_opioid, detail

by everincar_base, sort: summarize years_any_opioid, detail
ranksum years_any_opioid, by(everincar_base)
by recentincar_base, sort: summarize years_any_opioid, detail
ranksum years_any_opioid, by(recentincar_base)
by parole_base, sort: summarize years_any_opioid, detail
ranksum years_any_opioid, by(parole_base)

*''Number of times overdosed on drugs''

histogram overdosed
summarize overdosed, detail

by everincar_base, sort: summarize overdosed, detail
ranksum overdosed, by(everincar_base)
by recentincar_base, sort: summarize overdosed, detail
ranksum overdosed, by(recentincar_base)
by parole_base, sort: summarize overdosed, detail
ranksum overdosed, by(parole_base)

*''Number of times treated for drug abuse''

histogram treatedfordrugs
summarize treatedfordrugs, detail

by everincar_base, sort: summarize treatedfordrugs, detail
ranksum treatedfordrugs, by(everincar_base)
by recentincar_base, sort: summarize treatedfordrugs, detail
ranksum treatedfordrugs, by(recentincar_base)
by parole_base, sort: summarize treatedfordrugs, detail
ranksum treatedfordrugs, by(parole_base)
by retention4q, sort: summarize treatedfordrugs, detail
ranksum treatedfordrugs, by(retention4q)

*''Methadone treatment in prior three months''

fre recentmethadonetx
tab everincar_base recentmethadonetx, row chi2
tab recentincar_base recentmethadonetx, row chi2
tab parole_base recentmethadonetx, row chi2

*Ever incarcerated
fre everincar_base
tab retention4q everincar_base, row chi2

*Recently incarcerated
fre recentincar_base 
tab retention4q recentincar_base, row chi2
