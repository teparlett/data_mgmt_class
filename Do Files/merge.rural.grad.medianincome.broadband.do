/* use cleaned rurality data */

. use "/Users/teparlett/Documents/Data Management and Research Life Cycle/Final Projec
> t/Isolated Variables/rural.2013.USDA.cleaned.dta"

/* merge with cleaned median income data */

. merge 1:1 GEOID using "/Users/teparlett/Documents/Data Management and Research Life 
> Cycle/Final Project/Isolated Variables/medianincome.2017.ACS5.cleaned.dta"
(note: variable GEOID was str5, now str7 to accommodate using data's values)

    Result                           # of obs.
    -----------------------------------------
    not matched                             5
        from master                         3  (_merge==1)
        from using                          2  (_merge==2)

    matched                             3,140  (_merge==3)
    -----------------------------------------

/* drop unmerged observations */
	
. sort _merge

. drop in 1/5
(5 observations deleted)

. drop in 1/5
(5 observations deleted)

/* drop automatic merge variable */

. drop _merge

/* merge with cleaned broadband data */

. merge 1:1 GEOID using "/Users/teparlett/Documents/Data Management and Research Life 
> Cycle/Final Project/Isolated Variables/broadband.2017.ACS5.cleaned.dta"

    Result                           # of obs.
    -----------------------------------------
    not matched                             7
        from master                         0  (_merge==1)
        from using                          7  (_merge==2)

    matched                             3,135  (_merge==3)
    -----------------------------------------

/* drop unmerged variables, drop automatic merge variable */
	
. sort _merge

. drop in 1/7
(7 observations deleted)

. drop _merge

/* merge with cleaned educational attainment data */

. merge 1:1 GEOID using "/Users/teparlett/Documents/Data Management and Research Life 
> Cycle/Final Project/Isolated Variables/attainment.2017.ACS5.cleaned.dta"

    Result                           # of obs.
    -----------------------------------------
    not matched                             7
        from master                         0  (_merge==1)
        from using                          7  (_merge==2)

    matched                             3,135  (_merge==3)
    -----------------------------------------

/* drop unmerged observations, drop automatic merge variable */
	
. sort _merge

. drop in 1/7
(7 observations deleted)

. drop _merge

/* median household income is a string. make it a number. */

. gen n_median_household_income = real(median_household_income)

/* get rid of the median income string variable */

. drop median_household_income

. rename n_median_household_income median_household_income

. save "/Users/teparlett/Documents/Data Management and Research Life Cycle/Final Proje
> ct/Merged Dataset/full_dataset.dta"
