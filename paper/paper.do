//Template file content

cd /Users/shirui/Desktop/econ203/paper		//sets the working directory
capture log close						//closes any open log files
log using "paper.log", text replace	//creates clean log - can use 'append' instead of replace
clear									//clears open datasets

//New code for the analysis

use wbiclean203.dta, clear						//opens our data

//keep only relevant countries that hosted the past 15 olympics
keep if country == "Korea, Rep." | country == "France" | country == "Spain" | country == "Norway" | country == "United States" | country == "Japan" | country == "Australia" | country == "Greece" | country == "Italy" | country == "China" | country == "Canada" | country == "United Kingdom" | country == "Russia" | country == "Brazil"

//Template file content
log close								//closes this log



