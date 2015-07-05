## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result!

pollutantmean <- function(directory, pollutant, id = 1:332) {
    files <- list.files(directory, full.name = TRUE)
    pol.data <- data.frame()
    for (i in id) {
        pol.data <- rbind(pol.data, read.csv(files[i]))
    }
    mean(pol.data[,pollutant], na.rm = TRUE)
}