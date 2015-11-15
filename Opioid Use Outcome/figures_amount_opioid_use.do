label variable recentopioids_base "Baseline"
label variable recentopioids_q1 "Quarter 1"
label variable recentopioids_q2 "Quarter 2"
label variable recentopioids_q3 "Quarter 3"
label variable recentopioids_q4 "Quarter 4"

label variable recentopioids_qu1 "Quarter 1"
label variable recentopioids_qu2 "Quarter 2"
label variable recentopioids_qu3 "Quarter 3"
label variable recentopioids_qu4 "Quarter 4"

label define everincar 0 "Never incarcerated" 1 "Ever incarcerated"
label values everincar_base everincar

graph box recentopioids_base recentopioids_q1 recentopioids_q2 recentopioids_q3 recentopioids_q4, over(everincar_base) ytitle(Days of opioid use) note("*Flexible quarter assignment")
graph box recentopioids_base recentopioids_qu1 recentopioids_qu2 recentopioids_q3 recentopioids_qu4, over(everincar_base) ytitle(Days of opioid use) note("*Strict quarter assignment")

label define recentincar 0 "Not recently incarcerated" 1 "Recently incarcerated"
label values recentincar_base recentincar

graph box recentopioids_base recentopioids_q1 recentopioids_q2 recentopioids_q3 recentopioids_q4, over(recentincar_base) ytitle(Days of opioid use) note("*Flexible quarter assignment")
graph box recentopioids_base recentopioids_qu1 recentopioids_qu2 recentopioids_q3 recentopioids_qu4, over(recentincar_base) ytitle(Days of opioid use) note("*Strict quarter assignment")

label define parole 0 "Not on parole or probation" 1 "On parole or probation"
label values parole_base parole

graph box recentopioids_base recentopioids_q1 recentopioids_q2 recentopioids_q3 recentopioids_q4, over(parole_base) ytitle(Days of opioid use) note("*Flexible quarter assignment")
graph box recentopioids_base recentopioids_qu1 recentopioids_qu2 recentopioids_q3 recentopioids_qu4, over(parole_base) ytitle(Days of opioid use) note("*Strict quarter assignment")
