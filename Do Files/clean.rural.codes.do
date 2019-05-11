/* use rural-urban continuum codes data */
. 
. import excel "/Users/teparlett/Documents/Data Management and Research Life Cycle/Final Pro
> ject/Raw Data/rural.2013.USDA.raw.xls", sheet("Rural-urban Continuum Code 2013") clear

/* rename variable for county GEOID */

. rename A GEOID

/* make county and state label one variable */

. gen county_state = (C + ", " + B)

/* drop unneeded variables */

. drop B

. drop C

. drop D

/* rename rural-urban continuum code variable */

. rename E RUCC_2013

/* drop another unneeded variable */

. drop F

/* make nonmetro dummy variable */

. gen nonmetro = 1 if real(RUCC_2013) > 3
(1,236 missing values generated)

/* drop top line label data */

. drop in 1
(1 observation deleted)

/* drop Puerto Rico counties */

. sort GEOID

. drop in 3144/3221
(78 observations deleted)

. save "/Users/teparlett/Documents/Data Management and Research Life Cycle/Final Project/Iso
> lated Variables/rural.2013.USDA.cleaned.dta"
--------------------------------------------------------------------------------------------
