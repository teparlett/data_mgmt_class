
/* Use raw broadband data */

. import delimited "/Users/teparlett/Documents/Data Management and Research Life Cycle/Final Project/Raw D
> ata/broadband.2017.ACS5.raw.csv", clear 
(127 vars, 3,145 obs)

/* Drop unneeded variables */

. drop v1

. drop v3

. drop v5-v55

. drop v57-v127

/* Label variables for use */

. rename v2 GEOID

. rename v4 households

. rename v56 broadband_households

/* make the rate of household broadband usage */

. gen broadband_rate = (real(broadband_households) / real(households))
(2 missing values generated)

/* Drop the top rows of data labels */

. drop in 1/3
(3 observations deleted)

/* Drop now unneeded variables */

. drop households

. drop broadband_households

. save "/Users/teparlett/Documents/Data Management and Research Life Cycle/Final Project/Isolated Variable
> s/broadband.2017.ACS5.cleaned.dta"
file /Users/teparlett/Documents/Data Management and Research Life Cycle/Final Project/Isolated Variables/b
---------------------------------------------------------------
