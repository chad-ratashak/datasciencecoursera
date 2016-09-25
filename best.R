#function
best <- function(state, outcome){
  ## Read outcome data
  measures <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  
  ## Check that state and outcome are valid
  ###state
  states <- measures[,7] # [7] "State"
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(!state %in% states){
    stop(print("invalid state"))
  }
  
  ###outcome
  else if (!outcome %in% outcomes){
    stop(print("invalid outcome"))
  }
  
  ####colnames for outcome
  # [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  # [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  # [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  longname <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  shortname <- longname[match(outcome, outcomes)]
  
  ## Return hospital name in that state with lowest 30-day death
  measures.state <- measures[measures$State == state,]
  besthospital <- suppressWarnings(which.min(measures.state[,shortname]))
  
  #name
  print(measures.state[besthospital, "Hospital.Name"])
  
  #rate
  if(outcome == "heart attack"){
  print(measures.state[besthospital, 11])
  }
  
  else if(outcome == "heart failure"){
    print(measures.state[besthospital, 17])
  }
  
  else if(outcome == "pneumonia"){
    print(measures.state[besthospital, 23])
  }
  
}

# help.search("%in%")
#   match(x, table, nomatch = NA_integer_, incomparables = NULL)
#   x %in% table

#examples
#best in Texas for heart attacks
best("TX", "heart attack")
#best in Texas for heart failure
best("TX", "heart failure")
#best in Maryland for heart attacks
best("MD", "heart attack")
#best in Maryland for pneumonia
best("MD", "pneumonia")
#typo -- invalid state
best("BB", "heart attack")
#typo -- invalid outcome
best("NY", "hert attack")






##Assignment description
# 2 Finding the best hospital in a state
# Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
# outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector
# with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
# in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
# be one of "heart attack", "heart failure", or "pneumonia". Hospitals that do not have data on a particular
# outcome should be excluded from the set of hospitals when deciding the rankings.
# Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should
# be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals "b", "c",
# and "f" are tied for best, then hospital "b" should be returned).
# The function should use the following template.
# best <- function(state, outcome) {
# ## Read outcome data
# ## Check that state and outcome are valid
# ## Return hospital name in that state with lowest 30-day death
# ## rate
# }
# The function should check the validity of its arguments. If an invalid state value is passed to best, the
# function should throw an error via the stop function with the exact message "invalid state". If an invalid
# outcome value is passed to best, the function should throw an error via the stop function with the exact
# message "invalid outcome".
# Here is some sample output from the function.
# > source("best.R")
# > best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# > best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"
# > best("MD", "heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"
# > best("MD", "pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"
# > best("BB", "heart attack")
# Error in best("BB", "heart attack") : invalid state
# > best("NY", "hert attack")
# Error in best("NY", "hert attack") : invalid outcome
# >
# Save your code for this function to a file named best.R.