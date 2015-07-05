## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations
## NOTE: Do not round the result!

result <- numeric()
corr <- function(directory, threshold = 0) {
    files_list <- list.files(directory, full.name = TRUE)
    for (x in 1:length(files_list)) {
        data <- read.csv(files_list[x])
        complete <- data[complete.cases(data), ]
        if (nrow(complete) > threshold) {
            result <- c(result, cor(complete$sulfate, complete$nitrate))
        }
    }
    result
}