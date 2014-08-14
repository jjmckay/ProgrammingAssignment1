

complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    nobs <- numeric()
    idPadded <- formatC(id, width = 3, flag = "0")
    for (x in idPadded) {
        df <- read.csv(paste(directory, "/", x, ".csv", sep = ""))
        anobs <- sum( !is.na(df[["sulfate"]]) & !is.na(df[["nitrate"]]))
        nobs <- append(nobs, anobs)
    }
    data.frame(cbind(id,nobs))
}
