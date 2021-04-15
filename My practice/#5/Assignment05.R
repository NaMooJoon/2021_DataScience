setwd("/Users/joonk/Desktop/Joon/2021-1/데이터과학/Assignment/My practice/#5")
weather <- readRDS('weather-1.rds')

#01
str(weather)
head(weather)

any(is.na(weather))
sum(is.na(weather))


#02
weather <- weather[,-1]

#03
long_weather <- gather(weather, dayOfMonth, value, c(-1,-2,-3))
tidy_weather <- spread(long_weather, measure, value)
head(tidy_weather, 10)
str(tidy_weather)

#04
tidy_weather$dayOfMonth <- str_replace(tidy_weather$dayOfMonth,'X', '')
tidy_weather$dayOfMonth <- as.numeric(tidy_weather$dayOfMonth)
head(tidy_weather, 10)
str(tidy_weather)


#05
tidy_weather <- unite(tidy_weather, date, c('year', 'month','dayOfMonth'), sep = '-')
tidy_weather$date <- as.Date(tidy_weather$date)


#06
tidy_weather$PrecipitationIn <- str_replace(tidy_weather$PrecipitationIn, 'T', '0')

#07
glimpse(tidy_weather)
tidy_weather[,c(-1,-3)] <- sapply(tidy_weather[,c(-1,-3)], as.double)
tidy_weather$Events <- as.factor(tidy_weather$Events)
dim(tidy_weather)
?sapply

#08
any(is.na(tidy_weather))
sum(is.na(tidy_weather))
colSums(is.na(tidy_weather))

#09
boxplot(tidy_weather$Max.Humidity, col = 'skyblue')
max(tidy_weather$Max.Humidity, na.rm = TRUE)
tidy_weather[which.max(tidy_weather$Max.Humidity), 'Max.Humidity'] <- 
  tidy_weather[which.max(tidy_weather$Max.Humidity), 'Max.Humidity'] / 10

#10
boxplot(tidy_weather$Mean.VisibilityMiles)
min(tidy_weather$Mean.VisibilityMiles, na.rm = TRUE)
tidy_weather[which.min(tidy_weather$Mean.VisibilityMiles), 
             'Mean.VisibilityMiles'] <- NA


#11
str(tidy_weather)

#11-01
tidy_weather$Events <- as.character(tidy_weather$Events)
tidy_weather$Events <- ifelse(nchar(tidy_weather$Events) == 0,
                              "None", tidy_weather$Events)
tidy_weather$Events <- as.factor(tidy_weather$Events)
#11-2
levels(tidy_weather$Events)
levels(tidy_weather$Events)[1] <- "None"

#12
colnames(tidy_weather)
colnames(tidy_weather) <- tolower(colnames(tidy_weather))

#13
write.csv(tidy_weather ,file = "weather.csv")
