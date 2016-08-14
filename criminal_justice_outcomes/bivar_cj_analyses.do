*incarceration (self-reported or chart review) from treatment modality

tab drugtx recentincar_base, row miss
tab drugtx newrecentincar_qu1, row miss
tab drugtx newrecentincar_qu2, row miss
tab drugtx newrecentincar_qu3, row miss
tab drugtx newrecentincar_qu4, row miss

*incarceration (self-reported or chart review) from previous quarter retention

tab retention1q newrecentincar_qu2, row chi2 exact miss
tab retention2q newrecentincar_qu3, row chi2 exact miss
tab retention3q newrecentincar_qu4, row chi2 exact miss

*incarceration (self-reported) from previous quarter treatment

tab bupe_qu1 recentincar_qu2, row chi2 exact miss
tab bupe_qu2 recentincar_qu3, row chi2 exact miss
tab bupe_qu3 recentincar_qu4, row chi2 exact miss

*incarceration from current retention:

tab retention1q recentincar_qu1, row chi2 exact miss
tab retention2q recentincar_qu2, row chi2 exact miss
tab retention3q recentincar_qu3, row chi2 exact miss
tab retention4q recentincar_qu4, row chi2 exact miss

*incarceration from current treatment:

tab bupe_qu1 recentincar_qu1, row chi2 exact miss
tab bupe_qu2 recentincar_qu2, row chi2 exact miss
tab bupe_qu3 recentincar_qu3, row chi2 exact miss
tab bupe_qu4 recentincar_qu4, row chi2 exact miss

*charges from previous quarter retention

tab retention1q charges_qu2, row chi2 exact miss
tab retention2q charges_qu3, row chi2 exact miss
tab retention3q charges_qu4, row chi2 exact miss

*charges from previous quarter treatment

tab bupe_qu1 charges_qu2, row chi2 exact miss
tab bupe_qu2 charges_qu3, row chi2 exact miss
tab bupe_qu3 charges_qu4, row chi2 exact miss

*parole/probation status from previous quarter retention

tab retention1q parole_qu2, row chi2 exact miss
tab retention2q parole_qu3, row chi2 exact miss
tab retention3q parole_qu4, row chi2 exact miss
