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



complete <- function(directory, id = 1:332) {
    files <- list.files(directory, full.name = TRUE)
    com.data <- data.frame()
    for (i in id) {
        com.data <- rbind(com.data, c(i, nrow(na.omit(read.csv(files[i])))))
    }
    colnames(com.data) <- c("id", "nobs")
    print(com.data)
}