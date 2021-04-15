setwd("/Users/joonk/Desktop/Joon/2021-1/데이터과학/Assignment/My practice/#5_practice")
students2 <- read.csv("students2.csv", header = T, stringsAsFactors = F)
str(students2)
glimpse(students2)

#dob
students2$dob <- as.Date(students2$dob)
str(students2)

#nurse_visit
library(lubridate)
students2$nurse_visit <- ymd_hms(students2$nurse_visit)
str(students2)

head(students2)
