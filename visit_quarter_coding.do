fre visit_1
fre visit_2
fre visit_3
fre visit_4
fre visit_5
fre visit_6

replace visit_1=.a if visit_1<0

generate first_followup_quarter = .
generate second_followup_quarter = .
generate third_followup_quarter = .
generate fourth_followup_quarter = .
generate fifth_followup_quarter = .
generate sixth_followup_quarter = .

replace first_followup_quarter = 1 if visit_1<4
replace first_followup_quarter = 2 if visit_1==4
replace first_followup_quarter = 1 if visit_1==4 & visit_1<visit_2 & visit_2<7
replace first_followup_quarter = 1 if visit_1==4 & visit_1<visit_2 & visit_2<8 & visit_2<visit_3 & visit_3<10
replace first_followup_quarter = 1 if visit_1==4 & visit_1<visit_2 & visit_2<8 & visit_2<visit_3 & visit_3<11 & visit_3<visit_4 & visit_4<14
replace first_followup_quarter = 2 if visit_1>4 & visit_1<7
replace first_followup_quarter = 2 if visit_1==7 & visit_2>visit_1 & visit_2<10
replace first_followup_quarter = 3 if visit_1==7 & visit_2>visit_1 & visit_2>9
replace first_followup_quarter = 3 if visit_1>7 & visit_1<10
replace first_followup_quarter = 3 if visit_1==10 & visit_1<visit_2 & visit_2<14
replace first_followup_quarter = 4 if visit_1>10 & visit_1<14

replace second_followup_quarter = 1 if visit_2<4
replace second_followup_quarter = 2 if visit_2==4 & visit_1==.
replace second_followup_quarter = 2 if visit_2==4 & visit_1<visit_2
replace second_followup_quarter = 2 if visit_2>4 & visit_2<7 & visit_3>6
replace second_followup_quarter = 2 if visit_2>4 & visit_2<7 & visit_3==.
replace second_followup_quarter = 3 if visit_2==7
replace second_followup_quarter = 2 if visit_2==7 & visit_2<visit_3 & visit_3<10
replace second_followup_quarter = 2 if visit_2==7 & visit_2<visit_3 & visit_3<11 & visit_3<visit_4 & visit_4<14
replace second_followup_quarter = 3 if visit_2>7 & visit_2<10
replace second_followup_quarter = 3 if visit_2>7 & visit_2<10 & visit_3==.
replace second_followup_quarter = 4 if visit_2==10 & visit_3>12
replace second_followup_quarter = 3 if visit_2==10 & visit_2<visit_3 & visit_3<14
replace second_followup_quarter = 4 if visit_2>10 & visit_2<14

replace third_followup_quarter = 1 if visit_3<4
replace third_followup_quarter = 2 if visit_3==4 
replace third_followup_quarter = 2 if visit_3>3 & visit_3<7 & visit_2==.
replace third_followup_quarter = 2 if visit_3>4 & visit_3<7
replace third_followup_quarter = 3 if visit_3==7
replace third_followup_quarter = 2 if visit_3==7 & visit_3<visit_4 & visit_4<10
replace third_followup_quarter = 3 if visit_3>7 & visit_3<10
replace third_followup_quarter = 4 if visit_3==10
replace third_followup_quarter = 3 if visit_3==10 & visit_3<visit_4 & visit_4<14
replace third_followup_quarter = 4 if visit_3>10 & visit_3<13
replace third_followup_quarter = 4 if visit_3>10 & visit_3<14 & visit_2<11
replace third_followup_quarter = 4 if visit_3>10 & visit_3<14 & visit_2==.

replace fourth_followup_quarter = 3 if visit_4>7 & visit_4<10 
replace fourth_followup_quarter = 4 if visit_4==10 & visit_3<visit_4
replace fourth_followup_quarter = 4 if visit_4==10 & visit_3==.
replace fourth_followup_quarter = 4 if visit_4>10 & visit_4<14
replace fourth_followup_quarter = . if visit_3>10 & visit_3<13 & visit_4==13

replace fifth_followup_quarter = 4 if visit_5==12 | visit_5==13

replace sixth_followup_quarter = 4 if visit_6==12

list visit_1 first_followup_quarter visit_2 second_followup_quarter visit_3 third_followup_quarter visit_4 fourth_followup_quarter visit_5 fifth_followup_quarter visit_6 sixth_followup_quarter if drugtx==1



