#Loading..
setwd("/Users/joonk/Desktop/Joon/2021-1/데이터과학/Assignment/My practice/#4_5")
pokemon <- read.csv("pokemon_fix.csv", )


# Question1
library(dplyr)
head(pokemon)
glimpse(pokemon)
str(pokemon)

# Question02
#sample
summary(pokemon$attack)
boxplot(pokemon$attack,
        col = 'yellow',
        xlab = 'type',
        ylab = 'attack'
        )

#Attack
attack.avg <- aggregate(attack ~ type1, data = pokemon, FUN = mean)
odr <- rank(-attack.avg[,-1])
boxplot(attack~type1, data = pokemon,
        col = heat.colors(18)[odr],
        xlab = 'type1',
        ylab = 'value',
        main = 'Attack'
        )
#Defense
Defense.avg <- aggregate(defense ~ type1, data = pokemon, FUN = mean)
df_type1 <- merge(attack.avg, Defense.avg)
odr <- rank(-defense.avg[,-1])
boxplot(defense~type1, data = pokemon,
        col = heat.colors(18)[odr],
        xlab = 'type1',
        ylab = 'value',
        main = 'Defense'
)
#Speed
speed.avg <- aggregate(speed ~ type1, data = pokemon, FUN = mean)
df_type1 <- merge(df_type1, speed.avg)
odr <- rank(-speed.avg[,-1])
boxplot(speed~type1, data = pokemon,
        col = heat.colors(18)[odr],
        xlab = 'type1',
        ylab = 'value',
        main = 'Speed'
)

#HP
hp.avg <- aggregate(hp ~ type1, data = pokemon, FUN = mean)
df_type1 <- merge(df_type1, hp.avg)
odr <- rank(-hp.avg[,-1])
boxplot(hp~type1, data = pokemon,
        col = heat.colors(18)[odr],
        xlab = 'type1',
        ylab = 'value',
        main = 'HP'
)

#sp_attack
sp_attack.avg <- aggregate(sp_attack ~ type1, data = pokemon, FUN = mean)
df_type1 <- merge(df_type1, sp_attack.avg)
odr <- rank(-sp_attack.avg[,-1])
boxplot(sp_attack~type1, data = pokemon,
        col = heat.colors(18)[odr],
        xlab = 'type1',
        ylab = 'value',
        main = 'sp_attack'
)

#sp_defense
sp_defense.avg <- aggregate(sp_defense ~ type1, data = pokemon, FUN = mean)
df_type1 <- merge(df_type1, sp_defense.avg)
odr <- rank(-sp_defense.avg[,-1])
boxplot(sp_defense~type1, data = pokemon,
        col = heat.colors(18)[odr],
        xlab = 'type1',
        ylab = 'value',
        main = 'sp_defense'
)

#mean
head(df_type1)


# Question3
pokemon$build <- (pokemon$height_m * 100 + pokemon$weight_kg) 
plot(pokemon$height_m, pokemon$weight_kg)
#pokemon$build <- ifelse(pokemon$build > median(pokemon$build, na.rm = T),
#                        'big', 'small')
#Defense
plot(x = pokemon$build, y = pokemon$defense, xlim = c(0,1000))
plot(x = pokemon$build, y = pokemon$speed, xlim = c(0,500))

plot(y = pokemon[pokemon$build > median(pokemon$build),]$defense,
     x = pokemon[pokemon$build > median(pokemon$build),]$build,
     xlim = c(0,1000), ylim = c(0,200))
plot(y = pokemon[pokemon$build <= median(pokemon$build),]$defense,
     x = pokemon[pokemon$build <= median(pokemon$build),]$build,
     xlim = c(0,1000), ylim = c(0,200))

# Question4
#Attack
attack.avg <- aggregate(attack ~ generation, data = pokemon, FUN = mean)
odr <- rank(-attack.avg[,-1])
boxplot(attack~generation, data = pokemon,
        col = heat.colors(7)[odr],
        xlab = 'generation',
        ylab = 'value',
        main = 'Attack'
)
#Defense
Defense.avg <- aggregate(defense ~ generation, data = pokemon, FUN = mean)
df_type1 <- merge(attack.avg, Defense.avg)
odr <- rank(-defense.avg[,-1])
boxplot(defense~generation, data = pokemon,
        col = heat.colors(7)[odr],
        xlab = 'generation',
        ylab = 'value',
        main = 'Defense'
)
#Speed
speed.avg <- aggregate(speed ~ generation, data = pokemon, FUN = mean)
df_type1 <- merge(df_type1, speed.avg)
odr <- rank(-speed.avg[,-1])
boxplot(speed~generation, data = pokemon,
        col = heat.colors(7)[odr],
        xlab = 'generation',
        ylab = 'value',
        main = 'Speed'
)

#HP
hp.avg <- aggregate(hp ~ generation, data = pokemon, FUN = mean)
df_type1 <- merge(df_type1, hp.avg)
odr <- rank(-hp.avg[,-1])
boxplot(hp~generation, data = pokemon,
        col = heat.colors(7)[odr],
        xlab = 'generation',
        ylab = 'value',
        main = 'HP'
)

#sp_attack
sp_attack.avg <- aggregate(sp_attack ~ generation, data = pokemon, FUN = mean)
df_type1 <- merge(df_type1, sp_attack.avg)
odr <- rank(-sp_attack.avg[,-1])
boxplot(sp_attack~generation, data = pokemon,
        col = heat.colors(7)[odr],
        xlab = 'generation',
        ylab = 'value',
        main = 'sp_attack'
)

#sp_defense
sp_defense.avg <- aggregate(sp_defense ~ generation, data = pokemon, FUN = mean)
df_type1 <- merge(df_type1, sp_defense.avg)
odr <- rank(-sp_defense.avg[,-1])
boxplot(sp_defense~generation, data = pokemon,
        col = heat.colors(7)[odr],
        xlab = 'generation',
        ylab = 'value',
        main = 'sp_defense'
)

# Question5
pokemon[pokemon$name == 'Pikachu',]
condition <- ((pokemon[pokemon$name == 'Pikachu', 'attack'] < pokemon$attack) &
          (pokemon[pokemon$name == 'Pikachu', 'defense'] < pokemon$defense) &
          (pokemon$against_electric < 2) &
          (pokemon$type2 == 'ground'))
pokemon[condition, 'name']

# Question6
pokemon[pokemon$is_legendary == 1, ]


# Bonus
korean.names <- read.csv("korean_pokemon.csv")
korean.names <- korean.names[,-1]
pokemon$Korean_name <- korean.names[pokemon$name,1]
for(i in 1:801) {
  if(pokemon[i,'name'] == )
}
