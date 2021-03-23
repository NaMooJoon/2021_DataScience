# Loading data into R
load(url('https://github.com/hbchoi/SampleData/raw/master/country.RData'))

# Question 1
head(country,5)
tail(country,5)


# Question 2
sapply(country, class)
apply(country, 2, function(some){length(unique(some))})
country$continent <- factor(country$continent)
sapply(country, class)


# Question 3
summary(country$continent)


# Question 4
levels(country$continent)
levels(country$continent) <- c('AF', 'AS', 'EU', 'NA', 'OC', 'SA')
summary(country$continent)


# Question 5
country$GDP_group <- ifelse(country$GDP >= mean(country$GDP), 'HIGH', 'LOW')
table(country$GDP_group)


# Question 6
Find_continent <- function(S) {
  ifelse(country$continent == S, "TRUE", "FALSE")
}
Find_continent("AS")
Find_continent("EU")


