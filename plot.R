#Load and explore data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

#Dimensions
ncol(outcome)
#[1] 46
nrow(outcome)
#[1] 4706

#Plot
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])


#30-day mortality rates for heart attack
##Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack

names(outcome)
# [1] "Provider.Number"                                                                      
# [2] "Hospital.Name"                                                                        
# [3] "Address.1"                                                                            
# [4] "Address.2"                                                                            
# [5] "Address.3"                                                                            
# [6] "City"                                                                                 
# [7] "State"                                                                                
# [8] "ZIP.Code"                                                                             
# [9] "County.Name"                                                                          
# [10] "Phone.Number"                                                                         
# [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"                            
# [12] "Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
# [13] "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
# [14] "Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
# [15] "Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"       
# [16] "Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"                 
# [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"                           
# [18] "Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" 
# [19] "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
# [20] "Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
# [21] "Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"      
# [22] "Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"                
# [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"                               
# [24] "Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"     
# [25] "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"    
# [26] "Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"    
# [27] "Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"          
# [28] "Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"                    
# [29] "Hospital.30.Day.Readmission.Rates.from.Heart.Attack"                                  
# [30] "Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"        
# [31] "Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"     
# [32] "Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"     
# [33] "Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"             
# [34] "Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"                       
# [35] "Hospital.30.Day.Readmission.Rates.from.Heart.Failure"                                 
# [36] "Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"       
# [37] "Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"    
# [38] "Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"    
# [39] "Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"            
# [40] "Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"                      
# [41] "Hospital.30.Day.Readmission.Rates.from.Pneumonia"                                     
# [42] "Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Pneumonia"           
# [43] "Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia"        
# [44] "Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia"        
# [45] "Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Pneumonia"                
# [46] "Footnote...Hospital.30.Day.Readmission.Rates.from.Pneumonia"                  










# 1 Plot the 30-day mortality rates for heart attack
# Read the outcome data into R via the read.csv function and look at the first few rows.
# > outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# > head(outcome)
# There are many columns in this dataset. You can see how many by typing ncol(outcome) (you can see
#                                                                                       the number of rows with the nrow function). In addition, you can see the names of each column by typing
# names(outcome) (the names are also in the PDF document.
#                 To make a simple histogram of the 30-day death rates from heart attack (column 11 in the outcome dataset),
#                 run
#                 > outcome[, 11] <- as.numeric(outcome[, 11])
#                 > ## You may get a warning about NAs being introduced; that is okay
#                   > hist(outcome[, 11])
#                 1
#                 Because we originally read the data in as character (by specifying colClasses = "character" we need to
#                                                                      coerce the column to be numeric. You may get a warning about NAs being introduced but that is okay.