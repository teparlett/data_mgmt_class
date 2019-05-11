/* Use raw educational attainment data */
. 
. import delimited "/Users/teparlett/Documents/Data Management and Research Life Cycle/Final Project/Raw D
> ata/attainment.2017.ACS5.raw.csv", clear 
(771 vars, 3,144 obs)

/* Drop unneeded variables and label variables to be used */

. drop v1

. drop v3

. drop v5-v51

. drop v53-v63

. rename v2 GEOID

. rename v4 population_18_24

. rename v52 degree_18_24

. rename v64 population_25_up

. drop v65-v135

. rename v136 bachelors_25_up

. drop v137-v147

. rename v148 grad_25_up

. drop v149-v771

/* Make the graduation rate of 18+ year olds to be used */

. gen grad_rate = (real(degree_18_24) + real(bachelors_25_up) + real(grad_25_up))/(real(population_18_24) 
> + real(population_25_up))
(2 missing values generated)

/* drop lines of labels from dataset */

. drop in 1/2
(2 observations deleted)

/* drop variables no longer being used */

. drop population_18_24

. drop degree_18_24

. drop population_25_up

. drop bachelors_25_up

. drop grad_25_up

. save "/Users/teparlett/Documents/Data Management and Research Life Cycle/Final Project/Isolated Variable
> s/attainment.2017.ACS5.cleaned.dta"
