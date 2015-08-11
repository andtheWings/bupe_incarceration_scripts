*Make graphs reporting quarterly retention from baseline criminal justice
use "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\bupe_incarceration_scripts\retention_from_baseline_criminal_justice.dta", clear

*Quarterly rentention grouped by ever incarcerated at baseline
graph bar (asis) everincar  neverincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Ever been incarcerated > 3 days", size(medsmall) color(black)))

*Quarterly retention grouped by recent incarceration at baseline
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Incarcerated in 30 days before baseline", size(medsmall) color(black)))

*Quarterly retention grouped by baseline parole status
graph bar (asis) parole noparole, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("On parole or probation at baseline", size(medsmall) color(black)))

*Make graphs reporting any quarterly opioid use from flexible quarter assignment
import delimited "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\bupe_incarceration_scripts\loose_any_opioids_from_baseline_criminal_justice.csv", clear
label define quarter 0 "Baseline" 1 "Quarter 1" 2 "Quarter 2" 3 "Quarter 3" 4 "Quarter 4"
label values quarter quarter
label variable neverincar "no"
label variable everincar "yes"
label variable norecentincar "no"
label variable recentincar "yes"
label variable noparole "no"
label variable parole "yes"

*Quarterly self-reported opioid use grouped by ever incarcerated at baseline (flexible)
graph bar (asis) everincar  neverincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent of those who reported recent opioid use", color(black)) note("*Flexible quarter assignment") legend(on title("Subject has ever been incarcerated", size(medsmall) color(black)))

*Quarterly self-reported opioid use grouped by recent incarceration at baseline
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent of those who reported recent opioid use", color(black)) note("*Flexible quarter assignment") legend(on title("Subject was incarcerated in previous 30 days at baseline", size(medsmall) color(black)))

*Quarterly self-reported opioid use grouped by baseline parole status
graph bar (asis) parole  noparole, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent of those who reported recent opioid use", color(black)) note("*Flexible quarter assignment") legend(on title("Subject was on parole or probation at baseline", size(medsmall) color(black)))

*Make graphs reporting any quarterly opioid use from flexible quarter assignment
import delimited "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\bupe_incarceration_scripts\loose_any_opioids_from_baseline_criminal_justice.csv", clear
label define quarter 0 "Baseline" 1 "Quarter 1" 2 "Quarter 2" 3 "Quarter 3" 4 "Quarter 4"
label values quarter quarter
label variable neverincar "no"
label variable everincar "yes"
label variable norecentincar "no"
label variable recentincar "yes"
label variable noparole "no"
label variable parole "yes"

*Quarterly self-reported opioid use grouped by ever incarcerated at baseline (flexible)
graph bar (asis) everincar  neverincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent of those who reported recent opioid use", color(black)) note("*Strict quarter assignment") legend(on title("Subject has ever been incarcerated", size(medsmall) color(black)))

*Quarterly self-reported opioid use grouped by recent incarceration at baseline
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent of those who reported recent opioid use", color(black)) note("*Strict quarter assignment") legend(on title("Subject was incarcerated in previous 30 days at baseline", size(medsmall) color(black)))

*Quarterly self-reported opioid use grouped by baseline parole status
graph bar (asis) parole  noparole, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent of those who reported recent opioid use", color(black)) note("*Strict quarter assignment") legend(on title("Subject was on parole or probation at baseline", size(medsmall) color(black)))
