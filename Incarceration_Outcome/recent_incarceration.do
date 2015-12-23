*Chi-squared tests of quarterly recent incarceration from quarterly treatment retention:

**Loose quarter assignments for recent incarceration:

tab retention1q recentincar_q1, row chi2
tab retention2q recentincar_q2, row chi2
tab retention3q recentincar_q3, row chi2
tab retention4q recentincar_q4, row chi2

**Strict quarter assignments for recent incarceration:

tab retention1q recentincar_qu1, row chi2
tab retention2q recentincar_qu2, row chi2
tab retention3q recentincar_qu3, row chi2
tab retention4q recentincar_qu4, row chi2

*Figures for quarterly recent incarceration from quarterly treatment retention:

**Loose quarter assignments for recent incarceration:

import delimited "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\bupe_incarceration_scripts\Incarceration Outcome\recentincar_loose_from_quarterly_retention.csv", clear
label define quarter 1 "Quarter 1" 2 "Quarter 2" 3 "Quarter 3" 4 "Quarter 4"
label values quarter quarter
label variable retained "Yes"
label variable not_retained "No"
graph bar (asis) retained not_retained, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent who reported recent incarceration", color(black)) note("*Loose quarter assignment") legend(on title("Subject retained in treatment through each given quarter", size(medsmall) color(black)))

**Strict quarter assignments for recent incarceration:

import delimited "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\bupe_incarceration_scripts\Incarceration Outcome\recentincar_strict_from_quarterly_retention.csv", clear
label define quarter 1 "Quarter 1" 2 "Quarter 2" 3 "Quarter 3" 4 "Quarter 4"
label values quarter quarter
label variable retained "Yes"
label variable not_retained "No"
graph bar (asis) retained not_retained, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent who reported recent incarceration", color(black)) note("*Strict quarter assignment") legend(on title("Subject retained in treatment through each given quarter", size(medsmall) color(black)))
