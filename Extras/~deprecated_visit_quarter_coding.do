
fre visit1
fre visit2
fre visit3
fre visit4
fre visit5
fre visit6

replace visit1=.a if visit1<0

generate visit1_q = .
generate visit2_q = .
generate visit3_q = .
generate visit4_q = .
generate visit5_q = .
generate visit6_q = .

label variable visit1_q "Quarter assignment for first follow-up"
label variable visit2_q "Quarter assignment for second follow-up"
label variable visit3_q "Quarter assignment for third follow-up"
label variable visit4_q "Quarter assignment for fourth follow-up"
label variable visit5_q "Quarter assignment for fifth follow-up"
label variable visit6_q "Quarter assignment for sixth follow-up"

replace visit1_q = 1 if visit1<4
replace visit1_q = 2 if visit1==4
replace visit1_q = 1 if visit1==4 & visit1<visit2 & visit2<7
replace visit1_q = 1 if visit1==4 & visit1<visit2 & visit2<8 & visit2<visit3 & visit3<10
replace visit1_q = 1 if visit1==4 & visit1<visit2 & visit2<8 & visit2<visit3 & visit3<11 & visit3<visit4 & visit4<14
replace visit1_q = 2 if visit1>4 & visit1<7
replace visit1_q = 2 if visit1==7 & visit2>visit1 & visit2<10
replace visit1_q = 3 if visit1==7 & visit2>visit1 & visit2>9
replace visit1_q = 3 if visit1>7 & visit1<10
replace visit1_q = 3 if visit1==10 & visit1<visit2 & visit2<14
replace visit1_q = 4 if visit1>10 & visit1<14

replace visit2_q = 1 if visit2<4
replace visit2_q = 2 if visit2==4 & visit1==.
replace visit2_q = 2 if visit2==4 & visit1<visit2
replace visit2_q = 2 if visit2>4 & visit2<7 & visit3>6
replace visit2_q = 2 if visit2>4 & visit2<7 & visit3==.
replace visit2_q = 3 if visit2==7
replace visit2_q = 2 if visit2==7 & visit2<visit3 & visit3<10
replace visit2_q = 2 if visit2==7 & visit2<visit3 & visit3<11 & visit3<visit4 & visit4<14
replace visit2_q = 3 if visit2>7 & visit2<10
replace visit2_q = 3 if visit2>7 & visit2<10 & visit3==.
replace visit2_q = 4 if visit2==10 & visit3>12
replace visit2_q = 3 if visit2==10 & visit2<visit3 & visit3<14
replace visit2_q = 4 if visit2>10 & visit2<14

replace visit3_q = 1 if visit3<4
replace visit3_q = 2 if visit3==4 
replace visit3_q = 2 if visit3>3 & visit3<7 & visit2==.
replace visit3_q = 2 if visit3>4 & visit3<7
replace visit3_q = 3 if visit3==7
replace visit3_q = 2 if visit3==7 & visit3<visit4 & visit4<10
replace visit3_q = 3 if visit3>7 & visit3<10
replace visit3_q = 4 if visit3==10
replace visit3_q = 3 if visit3==10 & visit3<visit4 & visit4<14 & visit2!=8
replace visit3_q = 4 if visit3>10 & visit3<13
replace visit3_q = 4 if visit3>10 & visit3<14 & visit2<11
replace visit3_q = 4 if visit3>10 & visit3<14 & visit2==.

replace visit4_q = 3 if visit4>7 & visit4<10 
replace visit4_q = 4 if visit4==10 & visit3<visit4
replace visit4_q = 4 if visit4==10 & visit3==.
replace visit4_q = 4 if visit4>10 & visit4<14
replace visit4_q = . if visit3>10 & visit3<13 & visit4==13

replace visit5_q = 4 if visit5==12 | visit5==13

replace visit6_q = 4 if visit6==12


* list pid if visit_1q==visit_2q | visit_1q==visit_3q | visit_1q==visit_4q | visit_1q==visit_5q | visit_1q==visit_6q | visit_2q==visit_3q | visit_2q==visit_4q | visit_2q==visit_5q | visit_2q==visit_6q | visit_3q==visit_4q | visit_3q==visit_5q | visit_3q==visit_6q | visit_4q==visit_5q | visit_4q==visit_6q | visit_5q==visit_6q

list visit1 visit1_q visit2 visit2_q visit3 visit3_q visit4 visit4_q visit5 visit5_q visit6 visit6_q if drugtx==1


