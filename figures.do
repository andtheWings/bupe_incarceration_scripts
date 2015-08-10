*Make graphs reporting quarterly retention from baseline criminal justice
use "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\bupe_incarceration_scripts\retention_from_baseline_criminal_justice.dta", clear

*Quarterly rentention grouped by ever incarcerated at baseline
graph bar (asis) everincar  neverincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Ever been incarcerated > 3 days", size(medsmall) color(black)))

*Quarterly retention grouped by recent incarceration at baseline
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Incarcerated in 30 days before baseline", size(medsmall) color(black)))

*Quarterly retention grouped by baseline parole status
graph bar (asis) parole noparole, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("On parole or probation at baseline", size(medsmall) color(black)))

*Make graphs reporting quarterly retention from quarterly criminal justice
use "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\figures\retention_from_quarterly_criminal_justice.dta", clear

*Quarterly retention grouped by recent incarceration at quarterly visits
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Subject was incarcerated in 30 days before each quarterly visit", size(medsmall) color(black)))

*Make graphs reporting quarterly opioid use
use "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\figures\opioid_use_from_criminal_justice.dta", clear

*Quarterly self-reported opioid use grouped by ever incarcerated at baseline
graph bar (asis) everincar  neverincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent of those retained who reported opioid use", color(black)) legend(on title("Subject has ever been incarcerated", size(medsmall) color(black)))

*Quarterly self-reported opioid use grouped by recent incarceration at baseline
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(sunflowerlime)) bar(2, fcolor(eltgreen) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent of those retained who reported opioid use", color(black)) legend(on title("Subject was incarcerated in 30 days before baseline", size(medsmall) color(black)))

*Quarterly self-reported opioid use grouped by baseline parole status
graph bar (asis) parole  noparole, over(quarter) bar(1, fcolor(sunflowerlime)) bar(2, fcolor(eltgreen) lcolor(black)) blabel(bar) yscale(range(0 100)) ylabel(#5) title("Percent of those retained who reported opioid use", color(black)) legend(on title("Subject was on parole or probation at baseline", size(medsmall) color(black)))
