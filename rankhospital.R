rankhospital <- function(state, outcome, num = "best") {
  
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
  
  
  longname <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  shortname <- longname[match(outcome, outcomes)]
  
  ## Return hospital name in that state with the given rank 30-day death rate
  measures.state <- measures[measures$State == state, ]
  
  # order data by outcome
  sorted.measures.state <- measures.state[order(as.numeric(measures.state[[shortname]]), measures.state[["Hospital.Name"]],decreasing=FALSE,na.last=NA), ]
  
  #handle num input
  if (num=="best") num = 1
  if (num=='worst') num = nrow(sorted.measures.state)
  #will automatically return NA if num > nrow, as well as if it's some other text value
  # if someone passes num < 1, they'll get what's expected
  #if (is.numeric(num) & num > nrwo(sorted.data.state) return(NA)
  
  print(sorted.measures.state[num,"Hospital.Name"])

  ## 30-day death rate
  if(outcome == "heart attack"){
    print(sorted.measures.state[2, 11]) #Name, heart attack
  }

  else if(outcome == "heart failure"){
    print(sorted.measures.state[2, 17]) #Name, heart failure
  }
  
  else if(outcome == "pneumonia"){
    print(sorted.measures.state[2, 23]) #Name, pneumonia
  }

}





# Example
rankhospital("TX", "heart failure", 4)
# [1] "DETAR HOSPITAL NAVARRO"
rankhospital("MD", "heart attack", "worst")
# [1] "HARFORD MEMORIAL HOSPITAL"
rankhospital("MN", "heart attack", 5000)
# [1] NA



















# 3 Ranking hospitals by outcome in a state
# Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a
# state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num).
# The function reads the outcome-of-care-measures.csv le and returns a character vector with the name
# of the hospital that has the ranking specied by the num argument. For example, the call
# rankhospital("MD", "heart failure", 5)
# would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate
# for heart failure. The num argument can take values \best", \worst", or an integer indicating the ranking
# (smaller numbers are better). If the number given by num is larger than the number of hospitals in that
# state, then the function should return NA. Hospitals that do not have data on a particular outcome should
# be excluded from the set of hospitals when deciding the rankings.
# Handling ties. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause
# of death. In those cases ties should be broken by using the hospital name. For example, in Texas (\TX"),
#                                                                                                    the hospitals with lowest 30-day mortality rate for heart failure are shown here.
#                                                                                                    > head(texas)
#                                                                                                    Hospital.Name Rate Rank
#                                                                                                    3935 FORT DUNCAN MEDICAL CENTER 8.1 1
#                                                                                                    4085 TOMBALL REGIONAL MEDICAL CENTER 8.5 2
#                                                                                                    4103 CYPRESS FAIRBANKS MEDICAL CENTER 8.7 3
#                                                                                                    3954 DETAR HOSPITAL NAVARRO 8.7 4
#                                                                                                    4010 METHODIST HOSPITAL,THE 8.8 5
#                                                                                                    3962 MISSION REGIONAL MEDICAL CENTER 8.8 6
#                                                                                                    Note that Cypress Fairbanks Medical Center and Detar Hospital Navarro both have the same 30-day rate
#                                                                                                    (8.7). However, because Cypress comes before Detar alphabetically, Cypress is ranked number 3 in this
#                                                                                                    scheme and Detar is ranked number 4. One can use the order function to sort multiple vectors in this
#                                                                                                    manner (i.e. where one vector is used to break ties in another vector).
#                                                                                                    The function should use the following template.
#                                                                                                    rankhospital <- function(state, outcome, num = "best") {
#                                                                                                    ## Read outcome data
#                                                                                                    ## Check that state and outcome are valid
#                                                                                                    ## Return hospital name in that state with the given rank
#                                                                                                    ## 30-day death rate
#                                                                                                    }
#                                                                                                    The function should check the validity of its arguments. If an invalid state value is passed to best, the
#                                                                                                    function should throw an error via the stop function with the exact message \invalid state". If an invalid
# outcome value is passed to best, the function should throw an error via the stop function with the exact
# message \invalid outcome".
# Here is some sample output from the function.
# > source("rankhospital.R")
# > rankhospital("TX", "heart failure", 4)
# [1] "DETAR HOSPITAL NAVARRO"
# > rankhospital("MD", "heart attack", "worst")
# 3
# [1] "HARFORD MEMORIAL HOSPITAL"
# > rankhospital("MN", "heart attack", 5000)
# [1] NA
# Save your code for this function to a le named rankhospital.R.