*** Riggins' study for NYAM_BUPE data;
OPTIONS center PS=60 LS=120 ;
libname NYAM "C:\Documents and Settings\yning\Desktop\AaronF\Mariya_NYAM\data";
ods html close;
ods pdf close;
ods listing;



*** import original datasets;
PROC IMPORT OUT= NYAM.riggins 
            DATAFILE= "C:\Users\yning\Desktop\AaronF\Mariya_NYAM\data\bupe_riggins_150728.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;



*** create working datasets;
data nyam.rigginsWok1;
set nyam.riggins;
if recentopioids_v1=. then delete;
pid+1;
run;

data nyam.rigginsV1;
set nyam.rigginsWok1;
by pid;
recentOpioids=recentopioids_v1;
visitDate=visitdate_1;
visitWek=visit1;
rep=1;
if recentopioids=. then delete;
keep recentOpioids visitDate visitWek everincar_base recentincar_base parole_base years_any_opioid injectdrugs everheroin asidrugscore
     male mentaldiag pid rep;
run;
data nyam.rigginsV2;
set nyam.rigginsWok1;
by pid;
recentOpioids=recentopioids_v2;
visitDate=visitdate_2;
visitWek=visit2;
rep=2;
if recentopioids=. then delete;
keep recentOpioids visitDate visitWek everincar_base recentincar_base parole_base years_any_opioid injectdrugs everheroin asidrugscore
     male mentaldiag pid rep;
run;
data nyam.rigginsV3;
set nyam.rigginsWok1;
by pid;
recentOpioids=recentopioids_v3;
visitDate=visitdate_3;
visitWek=visit3;
rep=3;
if recentopioids=. then delete;
keep recentOpioids visitDate visitWek everincar_base recentincar_base parole_base years_any_opioid injectdrugs everheroin asidrugscore
     male mentaldiag pid rep;
run;
data nyam.rigginsV4;
set nyam.rigginsWok1;
by pid;
recentOpioids=recentopioids_v4;
visitDate=visitdate_4;
visitWek=visit4;
rep=4;
if recentopioids=. then delete;
keep recentOpioids visitDate visitWek everincar_base recentincar_base parole_base years_any_opioid injectdrugs everheroin asidrugscore
     male mentaldiag pid rep;
run;
data nyam.rigginsV5;
set nyam.rigginsWok1;
by pid;
recentOpioids=recentopioids_v5;
visitDate=visitdate_5;
visitWek=visit5;
rep=5;
if recentopioids=. then delete;
keep recentOpioids visitDate visitWek everincar_base recentincar_base parole_base years_any_opioid injectdrugs everheroin asidrugscore
     male mentaldiag pid rep;
run;
data nyam.rigginsV6;
set nyam.rigginsWok1;
by pid;
recentOpioids=input(recentopioids_v6,8.0);
visitDate=.;
visitWek=input(visit6,8.0);
rep=6;
if recentOpioids=. then delete;
keep recentOpioids visitDate visitWek everincar_base recentincar_base parole_base years_any_opioid injectdrugs everheroin asidrugscore
     male mentaldiag pid rep;
run;

data nyam.rigginsWok2;
set nyam.rigginsV1 nyam.rigginsV2 nyam.rigginsV3 nyam.rigginsV4 nyam.rigginsV5 nyam.rigginsV6;
by pid;
if recentOpioids>=1 then recentOpioid_di=1;
else if recentOpioids=0 then recentOpioid_di=0;
run;



*** regression analysis - visitWek as fixed effet;
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model recentOpioids=parole_base /*visitWek*/ years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=n link=id ddfm=bw;
random _residual_ / subject=pid type=un solution g;
nloptions tech=none;
run;
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model recentOpioids=recentincar_base /*visitWek*/ years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=n link=id ddfm=bw;
random _residual_ / subject=pid type=un solution g;
nloptions tech=none;
run;
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model recentOpioids=everincar_base /*visitWek*/ years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=n link=id ddfm=bw;
random _residual_ / subject=pid type=un solution g;
nloptions tech=none;
run;

proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model recentOpioid_di=parole_base visitWek years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=binary link=logit ddfm=bw /*or*/;
random _residual_ / subject=pid type=un solution g;
nloptions tech=none;
run;
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model recentOpioid_di=recentincar_base visitWek years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=binary link=logit ddfm=bw /*or*/;
random _residual_ / subject=pid type=un solution g;
nloptions tech=none;
run;
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model recentOpioid_di=everincar_base visitWek years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=binary link=logit ddfm=bw /*or*/;
random _residual_ / subject=pid type=un solution g;
nloptions tech=none;
run;

proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model visitWek=parole_base years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=n link=id ddfm=bw;
random _residual_ / subject=pid type=un solution g;
nloptions tech=none;
run;
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model visitWek=recentincar_base years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=n link=id ddfm=bw;
random _residual_ / subject=pid type=un solution g;
nloptions tech=none;
run;
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model visitWek=everincar_base years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=n link=id ddfm=bw;
random _residual_ / subject=pid type=un solution g;
nloptions tech=none;
run;



*** regression analysis - visitWek as random effet; 
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model recentOpioids=parole_base years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=n link=id ddfm=bw;
random visitWek / subject=pid type=un /*solution*/ g;
nloptions tech=nrridg;
run;
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model recentOpioids=recentincar_base years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=n link=id ddfm=bw;
random visitWek / subject=pid type=un /*solution*/ g;
nloptions tech=nrridg;
run;
proc glimmix data=nyam.rigginsWok2 noitprint noclprint=10 /*asycorr method=quad*/;
class parole_base(ref='no') everincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no');
model recentOpioids=everincar_base years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag /solution dist=n link=id ddfm=bw;
random visitWek / subject=pid type=un /*solution*/ g;
nloptions tech=nrridg;
run;



*********************************************************************************************************;
* new data analysis;
*********************************************************************************************************;

*** import data;
PROC IMPORT OUT= NYAM.riggins2 
            DATAFILE= "C:\Users\yning\Desktop\AaronF\Mariya_NYAM\data\longitudinal_wide3_riggins151222.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;



*** make working datasets;
data nyam.rigginsWok3;
merge nyam.riggins2(in=a) nyam.longi_wide(in=b keep=pid bc31);
by pid;
if a;
*drop var17;
run;

data nyam.rigginsQ1;
set nyam.rigginsWok3;
by pid;
recentincar=recentincar_qu1;
retention=retention1q;
recentopioid=anyrecentopioids_qu1;
opioid_bl=anyrecentopioids_base;
quart=1;
keep pid quart recentincar retention site years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag bc31 recentopioid opioid_bl;
run;
data nyam.rigginsQ2;
set nyam.rigginsWok3;
by pid;
recentincar=recentincar_qu2;
retention=retention2q;
recentopioid=anyrecentopioids_qu2;
opioid_bl=anyrecentopioids_base;
quart=2;
keep pid quart recentincar retention site years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag bc31 recentopioid opioid_bl;
run;
data nyam.rigginsQ3;
set nyam.rigginsWok3;
by pid;
recentincar=recentincar_qu3;
retention=retention3q;
recentopioid=anyrecentopioids_qu3;
opioid_bl=anyrecentopioids_base;
quart=3;
keep pid quart recentincar retention site years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag bc31 recentopioid opioid_bl;
run;
data nyam.rigginsQ4;
set nyam.rigginsWok3;
by pid;
recentincar=recentincar_qu4;
retention=retention4q;
recentopioid=anyrecentopioids_qu4;
opioid_bl=anyrecentopioids_base;
quart=4;
keep pid quart recentincar retention site years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag bc31 recentopioid opioid_bl;
run;

data nyam.rigginsWok4;
set nyam.rigginsQ1 nyam.rigginsQ2 nyam.rigginsQ3 nyam.rigginsQ4;
by pid;
run;



*** regression analysis;
proc glimmix data=nyam.rigginsWok4 noitprint noclprint=10 /*asycorr method=quad*/;
class pid recentincar(ref='no') retention(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no') recentopioid(ref='no') site;
model recentincar=retention years_any_opioid asidrugscore male /*injectdrugs*/ everheroin mentaldiag bc31 recentopioid / solution dist=binary link=logit ddfm=bw cl;
random _residual_ / subject=pid type=cs solution g;
nloptions tech=none;
run;

proc genmod data=nyam.rigginsWok4;
class pid recentincar(ref='no') retention(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no') recentopioid(ref='no') site;
model recentincar=retention years_any_opioid asidrugscore male injectdrugs everheroin mentaldiag bc31 recentopioid / dist=binomial link=logit;
repeated subject=pid / type=cs corrw;
run;



*********************************************************************************************************;
* new data analysis part 2;
*********************************************************************************************************;

*** import data;
PROC IMPORT OUT= NYAM.riggins3 
            DATAFILE= "C:\Users\yning\Desktop\AaronF\Mariya_NYAM\data\longitudinal_wide3_riggins160120b.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;



*** make working datasets;
data nyam.rigginsWok5;
merge nyam.riggins3(in=a) nyam.longi_wide(in=b keep=pid bc31); * bc31 = ever in jail;
by pid;
if a;
*drop var17;
run;

data rigginsQT1;
set nyam.rigginsWok5;
by pid;
recentincar=recentincar_qu1;
retention=retention1q;
recentopioid_di=anyrecentopioids_qu1;
recentopioid_day=recentopioids_qu1;
quart=1;
keep pid quart recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag recentopioid_di recentopioid_day;
run;
data rigginsQT2;
set nyam.rigginsWok5;
by pid;
recentincar=recentincar_qu2;
retention=retention2q;
recentopioid_di=anyrecentopioids_qu2;
recentopioid_day=recentopioids_qu2;
quart=2;
keep pid quart recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag recentopioid_di recentopioid_day;
run;
data rigginsQT3;
set nyam.rigginsWok5;
by pid;
recentincar=recentincar_qu3;
retention=retention3q;
recentopioid_di=anyrecentopioids_qu3;
recentopioid_day=recentopioids_qu3;
quart=3;
keep pid quart recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag recentopioid_di recentopioid_day;
run;
data rigginsQT4;
set nyam.rigginsWok5;
by pid;
recentincar=recentincar_qu4;
retention=retention4q;
recentopioid_di=anyrecentopioids_qu4;
recentopioid_day=recentopioids_qu4;
quart=4;
keep pid quart recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag recentopioid_di recentopioid_day;
run;

data nyam.rigginsWok6;
set rigginsQT1 rigginsQT2 rigginsQT3 rigginsQT4;
by pid;
run;



*** regression analysis;
title 'recentopioid_di in full model without imputed age';
proc glimmix data=nyam.rigginsWok6 noitprint noclprint=10 /*asycorr method=quad*/;
class pid recentincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no')
      white(ref='no') male(ref='no') homeless(ref='no') recentopioid_di(ref='no');
model recentopioid_di=recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag / solution dist=binary link=logit ddfm=bw cl;
random _residual_ / subject=pid type=cs solution g;
nloptions tech=none;
run;
title;
title 'recentopioid_di in parsimonious model';
proc glimmix data=nyam.rigginsWok6 noitprint noclprint=10 /*asycorr method=quad*/;
class pid recentincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no')
      male(ref='no') homeless(ref='no') recentopioid_di(ref='no');
model recentopioid_di=recentincar_base male homeless asidrugscore injectdrugs everheroin mentaldiag / solution dist=binary link=logit ddfm=bw cl;
random _residual_ / subject=pid type=cs solution g;
nloptions tech=none;
run;
title;
title 'recentopioid_di in restricted model';
proc glimmix data=nyam.rigginsWok6 noitprint noclprint=10 /*asycorr method=quad*/;
class pid recentincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') recentopioid_di(ref='no');
model recentopioid_di=recentincar_base asidrugscore injectdrugs everheroin / solution dist=binary link=logit ddfm=bw cl;
random _residual_ / subject=pid type=cs solution g;
nloptions tech=none;
run;
title;

title 'recentopioid_day in full model without imputed age';
proc glimmix data=nyam.rigginsWok6 noitprint noclprint=10 /*asycorr method=quad*/;
class pid recentincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no')
      white(ref='no') male(ref='no') homeless(ref='no');
model recentopioid_day=recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag / solution dist=normal link=id ddfm=bw cl;
random _residual_ / subject=pid type=cs solution g;
nloptions tech=none;
run;
title;
title 'recentopioid_day in parsimonious model';
proc glimmix data=nyam.rigginsWok6 noitprint noclprint=10 /*asycorr method=quad*/;
class pid recentincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no')
      male(ref='no') homeless(ref='no');
model recentopioid_day=recentincar_base male homeless asidrugscore injectdrugs everheroin mentaldiag / solution dist=normal link=id ddfm=bw cl;
random _residual_ / subject=pid type=cs solution g;
nloptions tech=none;
run;
title;
title 'recentopioid_day in restricted model';
proc glimmix data=nyam.rigginsWok6 noitprint noclprint=10 /*asycorr method=quad*/;
class pid recentincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no');
model recentopioid_day=recentincar_base asidrugscore injectdrugs everheroin / solution dist=normal link=id ddfm=bw cl;
random _residual_ / subject=pid type=cs solution g;
nloptions tech=none;
run;
title;



*** multiple imputation for age;
%macro imputeage(datain, dataout, rep);
proc mi seed = 9876 data = &datain out = &dataout nimpute=&rep;
   class white black latino asian_and_other heterosexual alone injectdrugs everheroin everotherpk eversedative recentmarijuana;
   fcs reg(age=white black latino asian_and_other heterosexual alone injectdrugs everheroin everotherpk eversedative
               recentmarijuana years_any_opioid overdosed/details);
   var age white black latino asian_and_other heterosexual alone injectdrugs everheroin everotherpk eversedative
       recentmarijuana years_any_opioid overdosed;
run;
%mend;
%imputeage(nyam.rigginsWok5, nyam.rigginsWok5im, 5);


*** generate imputed working datasets;
proc sort data=nyam.rigginsWok5im; by _imputation_ pid; run;
data rigginsQT1;
set nyam.rigginsWok5im;
by _imputation_ pid;
recentincar=recentincar_qu1;
retention=retention1q;
recentopioid_di=anyrecentopioids_qu1;
recentopioid_day=recentopioids_qu1;
quart=1;
keep _imputation_ pid quart recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag recentopioid_di recentopioid_day;
run;
data rigginsQT2;
set nyam.rigginsWok5im;
by _imputation_ pid;
recentincar=recentincar_qu2;
retention=retention2q;
recentopioid_di=anyrecentopioids_qu2;
recentopioid_day=recentopioids_qu2;
quart=2;
keep _imputation_ pid quart recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag recentopioid_di recentopioid_day;
run;
data rigginsQT3;
set nyam.rigginsWok5im;
by _imputation_ pid;
recentincar=recentincar_qu3;
retention=retention3q;
recentopioid_di=anyrecentopioids_qu3;
recentopioid_day=recentopioids_qu3;
quart=3;
keep _imputation_ pid quart recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag recentopioid_di recentopioid_day;
run;
data rigginsQT4;
set nyam.rigginsWok5im;
by _imputation_ pid;
recentincar=recentincar_qu4;
retention=retention4q;
recentopioid_di=anyrecentopioids_qu4;
recentopioid_day=recentopioids_qu4;
quart=4;
keep _imputation_ pid quart recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag recentopioid_di recentopioid_day;
run;

data nyam.rigginsWok6im;
set rigginsQT1 rigginsQT2 rigginsQT3 rigginsQT4;
by _imputation_ pid;
run;

proc freq data=nyam.rigginsWok6;
table everheroin*recentopioid_day/chisq;
run;



*** regression analysis on imputed datasets;
proc sort data=nyam.rigginsWok6im; by _imputation_ pid; run;

title 'recentopioid_di in full model with imputed age';
proc glimmix data=nyam.rigginsWok6im noitprint noclprint=10 /*asycorr method=quad*/;
by _imputation_;
class pid recentincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no')
      white(ref='no') male(ref='no') homeless(ref='no') recentopioid_di(ref='no');
model recentopioid_di=recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag / solution dist=binary link=logit ddfm=bw cl;
random _residual_ / subject=pid type=cs solution g;
nloptions tech=none;
ods output ParameterEstimates=nyam.est_di;
run;
title;

title 'recentopioid_day in full model with imputed age';
proc glimmix data=nyam.rigginsWok6im noitprint noclprint=10 /*asycorr method=quad*/;
by _imputation_;
class pid recentincar_base(ref='no') injectdrugs(ref='no') everheroin(ref='no') mentaldiag(ref='no')
      white(ref='no') male(ref='no') homeless(ref='no');
model recentopioid_day=recentincar_base age white male homeless asidrugscore injectdrugs everheroin mentaldiag / solution dist=normal link=id ddfm=bw cl;
random _residual_ / subject=pid type=cs solution g;
nloptions tech=none;
ods output ParameterEstimates=nyam.est_day;
run;
title;

*** mi analysis to summarize estimates obtained from each of the 5 imputed datasets; 
* prepare working datasets;
data est_diwok;
set nyam.est_di;
retain recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
       white_est white_se white_p white_lcl white_ucl
	   male_est male_se male_p male_lcl male_ucl
	   homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	   injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	   everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	   mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	   age_est age_se age_p age_lcl age_ucl
	   asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;

 if effect='recentincar_base' & recentincar_base='yes' then do;
  recentincar_base_est=estimate;
  recentincar_base_se=stderr;
  recentincar_base_p=probt;
  recentincar_base_lcl=lower;
  recentincar_base_ucl=upper;
 end;

 if effect='white' & white='yes' then do;
  white_est=estimate;
  white_se=stderr;
  white_p=probt;
  white_lcl=lower;
  white_ucl=upper;
 end;

 if effect='male' & male='yes' then do;
  male_est=estimate;
  male_se=stderr;
  male_p=probt;
  male_lcl=lower;
  male_ucl=upper;
 end;

 if effect='homeless' & homeless='yes' then do;
  homeless_est=estimate;
  homeless_se=stderr;
  homeless_p=probt;
  homeless_lcl=lower;
  homeless_ucl=upper;
 end;

 if effect='injectdrugs' & injectdrugs='yes' then do;
  injectdrugs_est=estimate;
  injectdrugs_se=stderr;
  injectdrugs_p=probt;
  injectdrugs_lcl=lower;
  injectdrugs_ucl=upper;
 end;

 if effect='everheroin' & everheroin='yes' then do;
  everheroin_est=estimate;
  everheroin_se=stderr;
  everheroin_p=probt;
  everheroin_lcl=lower;
  everheroin_ucl=upper;
 end;

 if effect='mentaldiag' & mentaldiag='yes' then do;
  mentaldiag_est=estimate;
  mentaldiag_se=stderr;
  mentaldiag_p=probt;
  mentaldiag_lcl=lower;
  mentaldiag_ucl=upper;
 end;

 if effect='age' then do;
  age_est=estimate;
  age_se=stderr;
  age_p=probt;
  age_lcl=lower;
  age_ucl=upper;
 end;

 if effect='asidrugscore' then do;
  asidrugscore_est=estimate;
  asidrugscore_se=stderr;
  asidrugscore_p=probt;
  asidrugscore_lcl=lower;
  asidrugscore_ucl=upper;
 end;
run;
data est_diwok1;
set est_diwok;
by _imputation_;
if _imputation_=1 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data est_diwok2;
set est_diwok;
by _imputation_;
if _imputation_=2 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data est_diwok3;
set est_diwok;
by _imputation_;
if _imputation_=3 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data est_diwok4;
set est_diwok;
by _imputation_;
if _imputation_=4 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data est_diwok5;
set est_diwok;
by _imputation_;
if _imputation_=5 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data nyam.est_diwok;
set est_diwok1 est_diwok2 est_diwok3 est_diwok4 est_diwok5;
drop _imputation_;
run;

****************;

data est_daywok;
set nyam.est_day;
retain recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
       white_est white_se white_p white_lcl white_ucl
	   male_est male_se male_p male_lcl male_ucl
	   homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	   injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	   everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	   mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	   age_est age_se age_p age_lcl age_ucl
	   asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;

 if effect='recentincar_base' & recentincar_base='yes' then do;
  recentincar_base_est=estimate;
  recentincar_base_se=stderr;
  recentincar_base_p=probt;
  recentincar_base_lcl=lower;
  recentincar_base_ucl=upper;
 end;

 if effect='white' & white='yes' then do;
  white_est=estimate;
  white_se=stderr;
  white_p=probt;
  white_lcl=lower;
  white_ucl=upper;
 end;

 if effect='male' & male='yes' then do;
  male_est=estimate;
  male_se=stderr;
  male_p=probt;
  male_lcl=lower;
  male_ucl=upper;
 end;

 if effect='homeless' & homeless='yes' then do;
  homeless_est=estimate;
  homeless_se=stderr;
  homeless_p=probt;
  homeless_lcl=lower;
  homeless_ucl=upper;
 end;

 if effect='injectdrugs' & injectdrugs='yes' then do;
  injectdrugs_est=estimate;
  injectdrugs_se=stderr;
  injectdrugs_p=probt;
  injectdrugs_lcl=lower;
  injectdrugs_ucl=upper;
 end;

 if effect='everheroin' & everheroin='yes' then do;
  everheroin_est=estimate;
  everheroin_se=stderr;
  everheroin_p=probt;
  everheroin_lcl=lower;
  everheroin_ucl=upper;
 end;

 if effect='mentaldiag' & mentaldiag='yes' then do;
  mentaldiag_est=estimate;
  mentaldiag_se=stderr;
  mentaldiag_p=probt;
  mentaldiag_lcl=lower;
  mentaldiag_ucl=upper;
 end;

 if effect='age' then do;
  age_est=estimate;
  age_se=stderr;
  age_p=probt;
  age_lcl=lower;
  age_ucl=upper;
 end;

 if effect='asidrugscore' then do;
  asidrugscore_est=estimate;
  asidrugscore_se=stderr;
  asidrugscore_p=probt;
  asidrugscore_lcl=lower;
  asidrugscore_ucl=upper;
 end;
run;
data est_daywok1;
set est_daywok;
by _imputation_;
if _imputation_=1 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data est_daywok2;
set est_daywok;
by _imputation_;
if _imputation_=2 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data est_daywok3;
set est_daywok;
by _imputation_;
if _imputation_=3 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data est_daywok4;
set est_daywok;
by _imputation_;
if _imputation_=4 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data est_daywok5;
set est_daywok;
by _imputation_;
if _imputation_=5 & last._imputation_=1 then output;
keep _imputation_ 
     recentincar_base_est recentincar_base_se recentincar_base_p recentincar_base_lcl recentincar_base_ucl
     white_est white_se white_p white_lcl white_ucl
	 male_est male_se male_p male_lcl male_ucl
	 homeless_est homeless_se homeless_p homeless_lcl homeless_ucl
	 injectdrugs_est injectdrugs_se injectdrugs_p injectdrugs_lcl injectdrugs_ucl
	 everheroin_est everheroin_se everheroin_p everheroin_lcl everheroin_ucl
	 mentaldiag_est mentaldiag_se mentaldiag_p mentaldiag_lcl mentaldiag_ucl
	 age_est age_se age_p age_lcl age_ucl
	 asidrugscore_est asidrugscore_se asidrugscore_p asidrugscore_lcl asidrugscore_ucl;
run;
data nyam.est_daywok;
set est_daywok1 est_daywok2 est_daywok3 est_daywok4 est_daywok5;
drop _imputation_;
run;

* run mi analysis;
proc mianalyze data=nyam.est_diwok;
modeleffects 
     recentincar_base_est white_est male_est homeless_est injectdrugs_est everheroin_est mentaldiag_est age_est asidrugscore_est
     ;

stderr 
     recentincar_base_se white_se male_se homeless_se injectdrugs_se everheroin_se mentaldiag_se age_se asidrugscore_se
     ;
run;

proc mianalyze data=nyam.est_daywok;
modeleffects 
     recentincar_base_est white_est male_est homeless_est injectdrugs_est everheroin_est mentaldiag_est age_est asidrugscore_est
     ;

stderr 
     recentincar_base_se white_se male_se homeless_se injectdrugs_se everheroin_se mentaldiag_se age_se asidrugscore_se
     ;
run;









