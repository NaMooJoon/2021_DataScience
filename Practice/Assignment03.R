############ Problem 1 ############

## Setting
load(url('https://github.com/hbchoi/SampleData/raw/master/country.RData'))
library(dplyr)

# Question 1
is_Numerical <- sapply(country,typeof) %in% c("integer", "double")
names(country[, is_Numerical])

# Question 2
country_ranking <- data.frame(country[,!is_Numerical],
                         apply(country[,is_Numerical], 2, function(x) {rank(desc(x))}))
head(country_ranking, 10)

# Question 3
country_ranking[country_ranking$country_name == "South Korea",]

# Question 4
country_ranking_mean <- country_ranking[,!is_Numerical]
country_ranking_mean$avg_rank <- apply(country_ranking[,is_Numerical],1, mean)
arrange(country_ranking_mean, avg_rank)




############ Problem 2 ############

# Question 5
app <- read.csv("/Users/joonk/Desktop/Joon/2021-1/데이터과학/Assignment/Practice/apps_delimiter.csv",sep = "^", stringsAsFactors = FALSE)
app <- app[,-1]
str(app)
apply(app, 2, function(some){length(unique(some))})
app$Category <- as.factor(app$Category)
app$Installs <- as.factor(app$Installs)
app$Content.Rating <- as.factor(app$Content.Rating)
app$Genres <- as.factor(app$Genres)
app$Android.Ver <- as.factor(app$Android.Ver)
str(app)

# Question 6
head(aggregate(Rating~Genres, app, mean), 6)

# Question 7
head(app[order(-app$Reviews),], 6)
