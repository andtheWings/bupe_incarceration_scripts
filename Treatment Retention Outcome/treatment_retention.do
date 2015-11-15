*Treatment retention from baseline criminal justice status

tab everincar_base retention1q, row chi2
tab everincar_base retention2q, row chi2
tab everincar_base retention3q, row chi2
tab everincar_base retention4q, row chi2
tab recentincar_base retention1q, row chi2
tab recentincar_base retention2q, row chi2
tab recentincar_base retention3q, row chi2
tab recentincar_base retention4q, row chi2
tab parole_base retention1q, row chi2
tab parole_base retention2q, row chi2
tab parole_base retention3q, row chi2
tab parole_base retention4q, row chi2

*Make graphs reporting quarterly retention from baseline criminal justice
use "C:\Users\riggins\Documents\einstein_materials\Summer Research Fellowship\bupe_incarceration_scripts\Treatment Retention Outcome\retention_from_baseline_criminal_justice.dta", clear

**Quarterly rentention grouped by ever incarcerated at baseline
graph bar (asis) everincar  neverincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Ever been incarcerated > 3 days", size(medsmall) color(black)))


**Quarterly retention grouped by recent incarceration at baseline
graph bar (asis) recentincar  norecentincar, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("Incarcerated in 30 days before baseline", size(medsmall) color(black)))

**Quarterly retention grouped by baseline parole status
graph bar (asis) parole noparole, over(quarter) bar(1, fcolor(ltblue)) bar(2, fcolor(lavender) lcolor(black)) blabel(bar) title("Percent retained on buprenorphine", color(black)) yscale(range(0 100)) ylabel(#5) legend(on title("On parole or probation at baseline", size(medsmall) color(black)))

