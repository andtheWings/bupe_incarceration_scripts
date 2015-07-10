*To install the "fre" command type "search fre" --> find the "fre" command in the 
*pop-up window --> click on the link --> click on "click here to install"

*Start with longitudinal data and work backwards to identify the subjects in the 
*study who were assigned to treatment with buprenorphine at baseline.

tab DTxQ4 AllBupeQ4, missing

*A cross-tabulation of these two variables shows that all subjects who 
*were listed as receiving buprenorphine for all four quarters (147) were a subset
*of all subjects who got buprenorphine in the fourth quarter (162)

tab AllBupeBase AllBupeQ4, missing

*Similarly, all subjects who were listed as receiving buprenorphine 
*for all four quarters (147) were a subset of all subjects who received 
*buprenorphine at baseline (306)

tab AllBupeBase drugtx, missing

*Both of these variables list the same 306 subjects as receiving buprenorphine
*at baseline

fre BaseTx

*BaseTx breaks those 306 subjects into two groups based on whether they got 
*integrated care or not.

tab drugtx CAA1, missing

*The variable drugtx, whose method of generation is unclear, does not 
*consistently cross-tabulate with CAA1. CAA1 is presumably linked to a chart 
*abstraction form, but the chart abstraction in my BHIVES binder correlates
*with the CAB# variables. The raw count for people assigned to buprenorphine is
*319...too high. 

fre CAA1 if CAA2==2 | CAA2A==1

*I tried to filter the count for CAA1 down by stipulating that those assigned
*to buprenorphine needed to have been documented as inducing onto buprenorphine
*(CAA2==1) or needed to have been already using buprenorphine when the study
*began (CAA2A==1). Now the count of subjects is too low at 287. Presumably
*some of these people were induced onto buprenorphine after the time of chart
*review, but I do not have data from a subsequent review.

tab drugtx BupStart, missing
tab BupStart CAA1, missing

*The variable BupStart (baseline bupe=292), whose method of generation is 
*unclear, cross-tabulates inconsistently with both CAA1 (319 or 287) 
*and drugtx (306).

*drugtx gives a baseline bupe treatment count that is most consistent with the 
*longitudinal data we have. Its count is also closest to the count already
*reported in literature from BHIVES studies (303).

list PID drugtx if DTxQ1==11 & DTxQ2==11 & DTxQ3==11 & DTxQ4==11

*There are three subjects who were assigned Bupe treatment under drugtx but who
*were listed as belonging to the "no treatment" category at the end of all
*four quarters. We hypothesize that these 3 people may have been assigned
*treatment on buprenorphine, but clinical circumstances prevented them from
*ever being induced onto the medication. Removing these three people takes the
*drugtx count of baseline bupe subjects to 303, the count reported in literature.
