# Za�adowanie danych z Dane.R
source("Dane.R")

# Pakiety dplyr, tidyverse, gganimate

library(dplyr)
library(tidyverse)
library(gganimate)

# Przygotowanie danych do analizy
# Zliczamy ile post�w zosta�o napisanych na ka�dym z for�w w danym roku
Fitness_Year <- group_by(Fitness_Posts, data.frame(
                    substr(Fitness_Posts$CreationDate[],1, 4))) %>%
                summarise(n = n())
colnames(Fitness_Year)[1] <- "Year"

Languagelearning_Year <- group_by(Languagelearning_Posts, data.frame(
                    substr(Languagelearning_Posts$CreationDate[], 1, 4))) %>%
                summarise(n = n())
colnames(Languagelearning_Year)[1] <- "Year"

Martialarts_Year <- group_by(Martialarts_Posts, data.frame(
                      substr(Martialarts_Posts$CreationDate[], 1, 4))) %>%
                summarise(n = n())
colnames(Martialarts_Year)[1] <- "Year"

# ��czymy otrzymane wcze�niej dane, zast�pujemy NA warto�ci� 0
z <- data.frame(full_join(
  Fitness_Year, Languagelearning_Year, by = "Year") %>% full_join(
     Martialarts_Year, by = "Year" 
  ))
z[is.na(z)] <- 0
colnames(z) <- c("Year", "n_1", "n_2", "n_3")

# Aby wykorzysta� funkcj� transition_reveal do stworzenia animacj
# musimy zapisa� t� ramk� danych w innej postaci
# Tworzymy nowe ramki danych, kt�re nast�pnie ��czymy
new_fitness_year <- data.frame( Type = "Fitness", Year =z[ ,1], n = z[ ,2])
new_languagelearning_year <- data.frame( 
                      Type = "Languagelearning", Year = z[ ,1], n = z[ ,3])
new_martialarts_year <- data.frame( Type = "Martialarts", Year = z[ ,1], n = z[ ,4])
dane <- rbind(new_fitness_year, 
              new_languagelearning_year, 
              new_martialarts_year)

# Tworzymy animowany wykres przy u�yciu funkcji z pakiet�w 
# tidyverse i gganimate
wykres <- ggplot(
  dane,
  aes(Year, n, group = Type, color = factor(Type))
) +
  geom_line(size=1.5) +
  scale_color_viridis_d() +
  labs(x = "Rok", y = "Liczba") +
  theme(legend.position = "top")+
  geom_point(aes(group = seq_along(Year)), size =2.5) +
  transition_reveal(readr::parse_number(Year))

# Zapisujemy animacj� 
anim_save("wykres.gif", animation = wykres)

