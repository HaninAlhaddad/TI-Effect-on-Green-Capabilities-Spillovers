# TI-Effect-on-Green-Capabilities-Spillovers
Accompanying Data and Code for the paper titled: The effect of technological innovation on production capabilities spillovers in developing economies.


DATA FILES LOCATION: https://drive.google.com/drive/folders/1gEy0_oJuEd2uDtCNuVGqhrXU78WM0oMw?usp=drive_link
This file is associated with the following GitHub repository: https://github.com/HaninAlhaddad/TI-Effect-on-Green-Capabilities-Spillovers/tree/main

######	Code File: JCP-Code:
###### 	MAIN DATA FILES:


******	File Name: "year_origin_hs02_6.tsv.bz2"
	About the file: "Trade data from 2003 to 2017"
	Data Source:"Simoes, A.J.G., Hidalgo, C.A., 2011. The economic complexity observatory: An analytical tool for understanding 	the dynamics of economic development, in: Workshops at the twenty-fifth 	AAAI conference on artificial intelligence."
	
******	File Name: "countrycodes.csv"
	About the file: "Countries full name mapped to the countries code from file A"

******	File Name: "Products Category.csv"
	About the file: "Categories of products based on the first digits of the HS-Code"
	Data Source: "https://www.foreign-trade.com/reference/hscode.htm".

******	File Name: "Copy of Environmental Green Goods_All_FIXED.csv"
	About the file: "List of green products, their Harmonized Code to the six digits, 
	the green sector they belong to with its acronym and color for ease of analysis later"
	Data Source:"Sauvage, J., 2014. The stringency of environmental regulations and trade in environmental goods."


******	File Name: "Economy Type1.csv" 
	About the file: "The Economic Designation of Countries"
	Data Source: ""Situation, T.W.E., Annex, P.W..S., 2022. UN Department of Economic and Social Affairs and others. United 	Nations."
 
******	File Name: "Green Indicators_Original.xls" 
	About the file: "Countries Green Indicators, The environmental, technological innovation per capita and % worldwide was 	used"
	Data Source: "OECD (2021), "Green growth indicators (Edition 2020)", OECD Environment Statistics (database), 	https://doi.org/10.1787/726a0247-en (accessed on 25 July 2024)."


******	File Name: "Selected_Green_Indicators_for_melting.csv" 
	About the file: "Preprocessed Green Indicators file to calculate TI1 and TI2 by the time span."

###############################################################################
######	PART 2 in code: Green Sector Space Generation

****** 	File Name: "Out3_10_years_span.csv"
	About the file: "The results of running the sectors space analysis, each country will have the HSCode of the new product added to its green basket, its RCA value at the initial year and the final year 	and the products it shared maximum proximity with, and the proximity value.  
	Data Source: Running the Code.

	OUTPUT1: File Name: "out3_10_years_span.csv"
	OUTPUT2: File Name: "Melted_Data_10_span.csv"

###############################################################################
######	PART 3 in code: Economic growth patterns
 
###############################################################################
######	PART 4 in code:  Sectors Centrality Calculations


	OUTPUT: File Name: "eigenvector_centrality2"

###############################################################################
######	PART 5 in code: Preparing the PLS-SEM Model Data
	This part melts the Green_Indicators to the appropriate format and then merges the data set with data obtained before "Melted_Data_10_span_Data_Preprocessing_result.cs"
 	to create the SEM data.
	
	OUTPUT: File Name: "Green_Indicators_melted.csv"
	OUTPUT FILE Name: "SEM_DATA.csv" 
	

