## Programming Assignment #3
## Data Science Specialization. Johns Hopkins University
## Author:            Caleb Andrade
## Date created:      Aug/30/2015
## Last modified:     Aug/30/2015

best <- function(state, outcome) {
    ## Read outcome data
    data = read.csv("outcome-of-care-measures.csv", colClasses = "character");
    idx = 0;
    
    ## Check that state and outcome are valid
    if(outcome == "heart attack") idx = 11;
    if(outcome == "heart failure") idx = 17;
    if(outcome == "pneumonia") idx = 23;
    if (idx == 0) stop("invalid outcome");
    flag = FALSE;
    states = data["State"][, 1]
    for (item in states) {
        if(item == state) {
            flag = TRUE;
            break;
        }
    }
    if(!flag) stop("invalid state")
    
    b.hosp = c();
    rate = as.numeric(data[idx][, 1]);
    n = length(rate)
    champ = 1;

    for (i in 1:n) {
        if (!is.na(rate[i]) && data["State"][i,1] == state){
            if (rate[i] == rate[champ]) {
                b.hosp = append(b.hosp, i);
            }
            if (rate[i] < rate[champ]) {
                champ = i;
                b.hosp = c(i);
            }
        }
    }
    
    h.names = c();
    for (i in 1:length(b.hosp)) {
        h.names = append(h.names, data["Hospital.Name"][b.hosp[i], 1])
    }
    sort(h.names)[1]
}


            
        
        
        
        
 