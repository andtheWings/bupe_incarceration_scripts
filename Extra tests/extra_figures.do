*Make graphs reporting quarterly retention from quarterly criminal justice
use "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\figures\retention_from_quarterly_criminal_justice.dta", clear

*Quarterly retention grouped by recent incarceration at quarterly visits
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Subject was incarcerated in 30 days before each quarterly visit", size(medsmall) color(black)))
