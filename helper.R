rankhospital <- function(state,outcome,num="best") {
    ##Read outcome data
    outcomedata <- read.csv("data/outcome-of-care-measures.csv",
                            colClasses = "character")
    filteroutcome <- outcomedata[,c(2,7,11,17,23)]
    colnames(filteroutcome) <- c("Hospital name","State","heart attack"
                                 ,"heart failure","pneumonia")
    filteroutcome[,3] <- suppressWarnings(as.numeric(filteroutcome[,3],na.rm=TRUE))
    filteroutcome[,4] <- suppressWarnings(as.numeric(filteroutcome[,4],na.rm=TRUE))
    filteroutcome[,5] <- suppressWarnings(as.numeric(filteroutcome[,5],na.rm=TRUE))
    filterstate <- subset(filteroutcome,State== state)
    outcomename <- colnames(filteroutcome[,3:5])
    
    sumofoutcome <- sum(outcome != outcomename)
    
    ##Check that state and outcome are valid
    if (nrow(filterstate)==0) {stop("invalid state")}
    
    else if (sumofoutcome==3) {stop("invalid outcome")}
    
    else if (num=="best") {
        sortoutcome <- filterstate[order(filterstate[,outcome],
                                         filterstate$"Hospital name",
                                         decreasing=FALSE), ]
        print(sortoutcome[1,1])
    }
    
    else if (num=="worst") {
        sortoutcome <- filterstate[order(filterstate[,outcome],
                                         filterstate$"Hospital name",
                                         decreasing=TRUE), ]
        print(sortoutcome[1,1])
    }
    
    else {sortoutcome <- filterstate[order(filterstate[,outcome],
                                           filterstate$"Hospital name",
                                           decreasing=FALSE), ]
    print(sortoutcome[num,1])
    }
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
}