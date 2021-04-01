# Loading data into R
setwd("/Users/joonk/Desktop/Joon/2021-1/데이터과학/Assignment/My practice/#4")
GDP <- read.csv("GDP.csv")
POP <- read.csv("population.csv")
LIFE_EXP <- read.csv("Life Expectancy.csv")
str(GDP)
str(POP)
str(LIFE_EXP)

# Question01
colnames(GDP) <- c("Country", "GDP")
colnames(POP) <- c("Country", "POP")
str(GDP)
str(POP)

# Question02
country <- merge(GDP, POP) # all = T 할때 쓰레기값 있음
head(country)

# Question03
country <- merge(country, LIFE_EXP)
head(country)

# Question04-1
condition <- country$GDP > country[country$Country == 'South Korea', 'GDP']
subset(country, condition)$Country

# Question04-2
condition <- (country$GDP > country[country$Country == 'South Korea', 'GDP'] 
              & country$POP < country[country$Country == 'South Korea', 'POP'])
head(subset(country, condition, select = c(Country, GDP, POP)))

# Question04-3
country$Country_GDP = country$GDP * (country$POP / 1000)
condition <- (country$Country_GDP > country[country$Country == 'South Korea', 'Country_GDP']
              & country$Country_GDP < country[country$Country == 'United States', 'Country_GDP'])
subset(country, condition)

# Question05-1
options(scipen = 10)
sample_country <- country[sample(nrow(country), 20, replace = F), ]
sapply(sample_country[, c(-1)], mean)


# Question05-2
options(scipen = 100)
sample_mean <- function() {
  sample_country <- country[sample(nrow(country), 20, replace = F), ]
  sapply(sample_country[, c(-1)], mean)
}

sample_mean_mtx <- matrix(sample_mean(), byrow = TRUE, nrow = 1)
for(i in 1:9) {
  sample_mean_mtx <- rbind(sample_mean_mtx, sample_mean())
}

# Question05-3
sample_means <- apply(sample_mean_mtx, 2,mean)
country_means <- sapply(country[ ,-1], mean)

# Question05-4
set.seed(2020)
sample_mean_mtx <- matrix(sample_mean(), byrow = TRUE, nrow = 1)
for(i in 1:9) {
  sample_mean_mtx <- rbind(sample_mean_mtx, sample_mean())
}


# Question06
country$Country_GDP <- round(country$Country_GDP / 1000000, 2)
country$Country_GDP <- paste0(country$Country_GDP, 'B')
head(country[, c('Country', 'Country_GDP')], 10)


# Question07
GDP_idx <- which(country$GDP > mean(country$GDP))
POP_idx <- which(country$POP > mean(country$POP))
country[intersect(GDP_idx, POP_idx), "Country"]

# Question08
quantile(country$GDP)
country$GDP_group <- cut(country$GDP, breaks = quantile(country$GDP), 
                 labels = c('Very Low', 'Low', 'High', 'Very High'),
                 include.lowest = TRUE)
table(country$GDP_group)

# Question09
aggregate(cbind(POP, Life_exp) ~ GDP_group, data = country, FUN = mean)

          