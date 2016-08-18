*prior ever incarceration from retention:

tab retention1q everincar_base, row chi2 exact miss
tab retention2q everincar_base, row chi2 exact miss
tab retention3q everincar_base, row chi2 exact miss
tab retention4q everincar_base, row chi2 exact miss

*prior recent charges from retention:

tab retention1q charges_base, row chi2 exact miss
tab retention2q charges_base, row chi2 exact miss
tab retention3q charges_base, row chi2 exact miss
tab retention4q charges_base, row chi2 exact miss

*prior recent incarceration from retention:

tab retention1q recentincar_base, row chi2 exact miss
tab retention2q recentincar_base, row chi2 exact miss
tab retention3q recentincar_base, row chi2 exact miss
tab retention4q recentincar_base, row chi2 exact miss

*incarceration (self-reported or chart review) from treatment modality

*tab drugtx recentincar_base, row miss
*tab drugtx newrecentincar_qu1, row miss
*tab drugtx newrecentincar_qu2, row miss
*tab drugtx newrecentincar_qu3, row miss
*tab drugtx newrecentincar_qu4, row miss

*incarceration (self-reported) from previous quarter retention

tab retention1q recentincar_qu2, row chi2 exact miss
tab retention2q recentincar_qu3, row chi2 exact miss
tab retention3q recentincar_qu4, row chi2 exact miss

*incarceration (self-reported) from previous quarter treatment

tab bupe_qu1 recentincar_qu2, row chi2 exact miss
tab bupe_qu2 recentincar_qu3, row chi2 exact miss
tab bupe_qu3 recentincar_qu4, row chi2 exact miss

*incarceration (self-reported) from current retention:

tab retention1q recentincar_qu1, row chi2 exact miss
tab retention2q recentincar_qu2, row chi2 exact miss
tab retention3q recentincar_qu3, row chi2 exact miss
tab retention4q recentincar_qu4, row chi2 exact miss

*incarceration (self-reported) from current treatment:

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
