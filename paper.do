
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
gen runnerUpSummer = 0
replace runnerUpSummer = 1 if year == 1988 & country == "Japan"
replace runnerUpSummer = 1 if year == 1992 & country =="Bulgaria"
replace runnerUpSummer = 1 if year == 2000 & country =="China" 
replace runnerUpSummer = 1 if year == 2004 & country =="Italy"
replace runnerUpSummer = 1 if year == 2008 & country =="Canada"
replace runnerUpSummer = 1 if year == 2012 & country =="France"
replace runnerUpSummer = 1 if year == 2016 & country =="Spain"

gen runnerUpWinter = 0
replace runnerUpWinter = 1 if year == 1992 & country =="France"
replace runnerUpWinter = 1 if year == 1994 & country =="Sweden"
replace runnerUpWinter = 1 if year == 1998 & country =="United States"
replace runnerUpWinter = 1 if year == 2002 & country =="Switzerland" 
replace runnerUpWinter = 1 if year == 2006 & country =="Switzerland"
replace runnerUpWinter = 1 if year == 2010 & country =="Korea, Rep."
replace runnerUpWinter = 1 if year == 2014 & country =="Korea, Rep."

//Generate a dummy variable for the runner up country to host the olympics in the year
// gen runnerUp = year == yearRunnerUp

//Generate a dummy variable if the olympics was the winter olympics
gen winter = 0
replace winter = 1 if year == 1992 & country == "France"
replace winter = 1 if year == 1998 & country == "Japan"
replace winter = 1 if year == 2002 & country == "United States"
replace winter = 1 if year == 2006 & country == "Italy"
replace winter = 1 if year == 2010 & country == "Canada"
replace winter = 1 if year == 2014 & country == "Russia"

//Generate a dummy variable for countries 5 years or after hosting the olympics
gen hostYear5 = 0
replace hostYear5 = 1 if year >= 1988 & year <= 1993 & country == "Korea, Rep."
replace hostYear5 = 1 if year >= 1992 & year <= 1997 & country == "France" 
replace hostYear5 = 1 if year >= 1992 & year <= 1997 & country == "Spain"
replace hostYear5 = 1 if year >= 1998 & year <= 2003 & country == "Japan"
replace hostYear5 = 1 if year >= 2000 & year <= 2005 & country == "Australia"
replace hostYear5 = 1 if year >= 2002 & year <= 2007 & country == "United States"
replace hostYear5 = 1 if year >= 2004 & year <= 2009 & country == "Greece"
replace hostYear5 = 1 if year >= 2006 & year <= 2011 & country == "Italy"
replace hostYear5 = 1 if year >= 2008 & year <= 2013 & country == "China"
replace hostYear5 = 1 if year >= 2010 & year <= 2015 & country == "Canada"
replace hostYear5 = 1 if year >= 2012 & year <= 2017 & country == "United Kingdom"
replace hostYear5 = 1 if year >= 2014 & year <= 2019 & country == "Russia"
replace hostYear5 = 1 if year >= 2016 & year <= 2021 & country == "Brazil"

//keep relevant variables
keep hostYear5 winter hostYear hosted runnerUpWinter runnerUpSummer countrycode year country GDP GDP_PC GDP_PC_PPP InformalEmployment ElectricityAccess Percent_SafeDrinkingWater Percent_SafeSanitation FDIInflow Exports_AnnualGrowth Imports_AnnualGrowth Percent_TourismReceipts_Exports Tourism_NumberofArrivals Manuf_ValueAdded Unemployment_Total

//Template file content
log close								//closes this log



