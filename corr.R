


corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    corrs <- numeric()
    files <- list.files(directory)
    for (file in files) {
        df <- read.csv(paste(directory, "/", file, sep = ""))
        complete <- !is.na(df[["sulfate"]]) & !is.na(df[["nitrate"]])
        if ( sum(complete) != 0 & sum(complete) > threshold ) {
            s <- df[["sulfate"]][complete]
            n <- df[["nitrate"]][complete]
            corrs <- c(corrs, cor(s,n))
        } else {
            #corrs <- append(corrs, 0)
        }
    }
    corrs
}
