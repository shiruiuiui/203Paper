
cd /Users/shirui/Desktop/econ203/paper		//sets the working directory
capture log close						//closes any open log files
log using "paper.log", text replace	//creates clean log - can use 'append' instead of replace
clear									//clears open datasets

//New code for the analysis

use wbiclean203.dta, clear						//opens our data

//Generate a new variable "hostYear" that indicates the year a country hosted the olyimpics
gen hostYear = 1988 if country == "Korea, Rep."
replace hostYear = 1992 if country == "France"
replace hostYear = 1992 if country == "Spain"
replace hostYear = 1994 if country == "Norway"
replace hostYear = 1998 if country == "Japan"
replace hostYear = 2000 if country == "Australia"
replace hostYear = 2002 if country == "United States"
replace hostYear = 2004 if country == "Greece"
replace hostYear = 2006 if country == "Italy"
replace hostYear = 2008 if country == "China"
replace hostYear = 2010 if country == "Canada"
replace hostYear = 2012 if country == "United Kingdom"
replace hostYear = 2014 if country == "Russia"
replace hostYear = 2016 if country == "Brazil"

//Generate a dummy variable for the country hosted the olympics in that year or not
gen hosted = year == hostYear


//Generate a new variable runnerUp
gen runnerUp = 0
replace runnerUp = 1 if year == 1998 & country == "Japan"
replace runnerUp = 1 if year == 1992 & country =="France"
replace runnerUp = 1 if year == 1994 & country =="Sweden"
replace runnerUp = 1 if year == 1998 & country =="United States"
replace runnerUp = 1 if year == 2000 & country =="China" 
replace runnerUp = 1 if year == 2002 & country =="Switzerland" | country =="Sweden" 
replace runnerUp = 1 if year == 2004 & country =="Italy"
replace runnerUp = 1 if year == 2006 & country =="Switzerland"
replace runnerUp = 1 if year == 2008 & country =="Canada"
replace runnerUp = 1 if year == 2010 & country =="Korea, Rep."
replace runnerUp = 1 if year == 2012 & country =="France"
replace runnerUp = 1 if year == 2014 & country =="Korea, Rep."
replace runnerUp = 1 if year == 2016 & country =="Spain"

//Generate a dummy variable for the runner up country to host the olympics in the year
// gen runnerUp = year == yearRunnerUp

//Generate a dummy variable if the olympics was the winter olympics
gen winter = 0
replace winter = 1 if year == 1992 & country == "France"
replace winter = 1 if year == 1994 & country == "Norway"
replace winter = 1 if year == 1998 & country == "Japan"
replace winter = 1 if year == 2002 & country == "United States"
replace winter = 1 if year == 2006 & country == "Italy"
replace winter = 1 if year == 2010 & country == "Canada"
replace winter = 1 if year == 2014 & country == "Russia"

//keep relevant variables
 keep winter hostYear hosted runnerUp countrycode year country GDP GDP_PC GDP_PC_PPP InformalEmployment ElectricityAccess Percent_SafeDrinkingWater Percent_SafeSanitation FDIInflow Exports_AnnualGrowth Imports_AnnualGrowth Percent_TourismReceipts_Exports Tourism_NumberofArrivals Manuf_ValueAdded Unemployment_Total

//summarize variables
sum

//Template file content
log close								//closes this log



