*incarceration from baseline treatment modality
use "/home/riggins/bupe_incarceration_scripts/criminal_justice_outcomes/incar from modality.dta"
graph bar (asis) incar_n incar_y incar_missing, over(modality, label(labsize(small))) over(quarter) percentages stack bar(3, fcolor(gray)) title(Percent incarcerated stratified by baseline treatment modality, size(medlarge))

*incarceration from previous quarter retention:
use "/home/riggins/bupe_incarceration_scripts/criminal_justice_outcomes/incar from previous quarter retention.dta"
graph bar (asis) incar_n incar_y incar_missing, over(retention, label(labsize(small))) over(quarter) percentages stack bar(1, fcolor(navy)) bar(2, fcolor(maroon)) bar(3, fcolor(gray)) title(Percent incarcerated sorted by BMT retention in previous quarter, size(medlarge))

*incarceration from previous quarter treatment:
use "/home/riggins/bupe_incarceration_scripts/criminal_justice_outcomes/incar from previous quarter treatment.dta"
graph bar (asis) incar_n incar_y incar_missing, over(treated, label(labsize(small))) over(quarter) percentages stack bar(1, fcolor(navy)) bar(2, fcolor(maroon)) bar(3, fcolor(gray)) title(Percent incarcerated sorted by BMT treatment in previous quarter, size(medlarge))

*incarceration from current retention:
use "/home/riggins/bupe_incarceration_scripts/criminal_justice_outcomes/incar from current retention.dta"
graph bar (asis) incar_n incar_y incar_missing, over(retained, label(labsize(vsmall))) over(quarter) percentages stack bar(1, fcolor(navy)) bar(2, fcolor(maroon)) bar(3, fcolor(gray)) title(Percent incarcerated sorted by BMT retention)

*incarceration from current treatment:
use "/home/riggins/bupe_incarceration_scripts/criminal_justice_outcomes/incar from current treatment.dta"
graph bar (asis) incar_n incar_y incar_missing, over(treated) over(quarter) stack bar(1, fcolor(navy)) bar(2, fcolor(maroon)) bar(3, fcolor(gray)) title(Percent incarcerated sorted by current BMT status)
