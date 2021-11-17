
cd /Users/shirui/Desktop/econ203/paper		//sets the working directory
capture log close						//closes any open log files
log using "paper.log", text replace	//creates clean log - can use 'append' instead of replace
clear									//clears open datasets

//New code for the analysis

use wbiclean203.dta, clear						//opens our data

//keep only relevant countries that hosted the past 15 olympics
keep if country == "Korea, Rep." | country == "France" | country == "Spain" | country == "Norway" | country == "United States" | country == "Japan" | country == "Australia" | country == "Greece" | country == "Italy" | country == "China" | country == "Canada" | country == "United Kingdom" | country == "Russia" | country == "Brazil"

//keep relevant variables
keep countrycode year country GDP GDP_PC GDP_PC_PPP InformalEmployment ElectricityAccess Percent_SafeDrinkingWater Percent_SafeSanitation FDIInflow Exports_AnnualGrowth Imports_AnnualGrowth Percent_TourismReceipts_Exports Tourism_NumberofArrivals Manuf_ValueAdded Unemployment_Total

//summarize variables
sum

//Template file content
log close								//closes this log



