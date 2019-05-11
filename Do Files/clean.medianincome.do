
/* use median income data */
. 
. import delimited "/Users/teparlett/Documents/Data Management and Research Life Cycle
> /Final Project/Raw Data/medianincome.2017.ACS5.raw.csv"
(243 vars, 3,144 obs)

/* drop unneeded variables, label variables to be used */

. drop v1

. drop v3

. rename v2 GEOID

. drop v4-v7

. drop v9-v243

. rename v8 median_household_income

/* drop top lines of labels */

. drop in 1/2
(2 observations deleted)

. save "/Users/teparlett/Documents/Data Management and Research Life Cycle/Final Proje
> ct/Isolated Variables/medianincome.2017.ACS5.cleaned.dta"
