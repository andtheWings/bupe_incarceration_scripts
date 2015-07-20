replace visit_1=. if visit_1<=0

rename visit_1 first_mnths_since
label variable first_mnths_since "Number of months since baseline for follow-up 1"
rename visit_2 second_mnths_since
label variable second_mnths_since "Number of months since baseline for follow-up 2"
rename visit_3 third_mnths_since
label variable third_mnths_since "Number of months since baseline for follow-up 3"
rename visit_4 fourth_mnths_since
label variable fourth_mnths_since "Number of months since baseline for follow-up 4"
rename visit_5 fifth_mnths_since
label variable fifth_mnths_since "Number of months since baseline for follow-up 5"

generate first_followup_quarter = .
generate second_followup_quarter = .
generate third_followup_quarter = .
generate fourth_followup_quarter = .

replace first_followup_quarter = 1 if first_mnths_since>0 & first_mnths_since<4
replace first_followup_quarter = 2 if first_mnths_since==4
replace first_followup_quarter = 1 if first_mnths_since==4 & first_mnths_since<second_mnths_since & second_mnths_since<7
replace first_followup_quarter = 1 if first_mnths_since==4 & first_mnths_since<second_mnths_since & second_mnths_since<8 & second_mnths_since<third_mnths_since & third_mnths_since<10
replace first_followup_quarter = 1 if first_mnths_since==4 & first_mnths_since<second_mnths_since & second_mnths_since<8 & second_mnths_since<third_mnths_since & third_mnths_since<11 & third_mnths_since<fourth_mnths_since
replace first_followup_quarter = 2 if first_mnths_since>4 & first_mnths_since<7
replace first_followup_quarter = 2 if first_mnths_since==7 & second_mnths_since>first_mnths_since & second_mnths_since<10
replace first_followup_quarter = 3 if first_mnths_since==7 & second_mnths_since>first_mnths_since & second_mnths_since>9
replace first_followup_quarter = 3 if first_mnths_since>7 & first_mnths_since<10
replace first_followup_quarter = 3 if first_mnths_since==10 & first_mnths_since<second_mnths_since & second_mnths_since<14
replace first_followup_quarter = 4 if first_mnths_since>10 & first_mnths_since<14

replace second_followup_quarter = 1 if second_mnths_since<4
replace second_followup_quarter = 2 if second_mnths_since==4 & first_mnths_since==.
replace second_followup_quarter = 2 if second_mnths_since==4 & first_mnths_since<second_mnths_since
replace second_followup_quarter = 2 if second_mnths_since>4 & second_mnths_since<7 & third_mnths_since>6
replace second_followup_quarter = 2 if second_mnths_since>4 & second_mnths_since<7 & third_mnths_since==.
replace second_followup_quarter = 3 if second_mnths_since==7
replace second_followup_quarter = 2 if second_mnths_since==7 & second_mnths_since<third_mnths_since & third_mnths_since<11 & third_mnths_since<fourth_mnths_since & fourth_mnths_since<14
replace second_followup_quarter = 3 if second_mnths_since>7 & second_mnths_since<10
replace second_followup_quarter = 3 if second_mnths_since>7 & second_mnths_since<10 & third_mnths_since==.
replace second_followup_quarter = 4 if second_mnths_since==10 & third_mnths_since>12
replace second_followup_quarter = 3 if second_mnths_since==10 & second_mnths_since<third_mnths_since & third_mnths_since<14
replace second_followup_quarter = 4 if second_mnths_since>10 & second_mnths_since<14

replace third_followup_quarter = 1 if third_mnths_since<4
replace third_followup_quarter = 2 if third_mnths_since==4 
replace third_followup_quarter = 2 if third_mnths_since>3 & third_mnths_since<7 & second_mnths_since==.
replace third_followup_quarter = 2 if third_mnths_since>4 & third_mnths_since<7
replace third_followup_quarter = 3 if third_mnths_since==7
replace third_followup_quarter = 2 if third_mnths_since==7 & third_mnths_since<fourth_mnths_since & fourth_mnths_since<10
replace third_followup_quarter = 3 if third_mnths_since>7 & third_mnths_since<10
replace third_followup_quarter = 3 if third_mnths_since==10 & third_mnths_since<fourth_mnths_since & fourth_mnths_since<14
replace third_followup_quarter = 4 if third_mnths_since==10 & second_mnths_since>7 & second_mnths_since<10
replace third_followup_quarter = 4 if third_mnths_since==10 & fourth_mnths_since>12
replace third_followup_quarter = 4 if third_mnths_since==10 & fourth_mnths_since==.
replace third_followup_quarter = 4 if third_mnths_since>10 & third_mnths_since<14
replace third_followup_quarter = 4 if third_mnths_since==13 & second_followup_quarter!=4

replace fourth_followup_quarter = 1 if fourth_mnths_since<4 & first_mnths_since==. & second_mnths_since==. & third_mnths_since==.
replace fourth_followup_quarter = 2 if fourth_mnths_since>3 & fourth_mnths_since<7 & second_mnths_since==. & third_mnths_since==.
replace fourth_followup_quarter = 3 if fourth_mnths_since>7 & fourth_mnths_since<10 
replace fourth_followup_quarter = 4 if fourth_mnths_since==10 & third_mnths_since<fourth_mnths_since
replace fourth_followup_quarter = 4 if fourth_mnths_since==10 & third_mnths_since==.
replace fourth_followup_quarter = 4 if fourth_mnths_since>10 & fourth_mnths_since<14
replace fourth_followup_quarter = . if third_mnths_since>10 & third_mnths_since<13 & fourth_mnths_since==13

list first_mnths_since first_followup_quarter second_mnths_since second_followup_quarter third_mnths_since third_followup_quarter fourth_mnths_since fourth_followup_quarter if drugtx==1



