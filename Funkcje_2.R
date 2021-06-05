# Za³adowanie danych z Dane.R
source("Dane.R")

# Pakiet dplyr
library(dplyr)

# Przygotowanie danych do analizy
# Przez x, y, z oznaczamy u¿ytkowników bêd¹cych jednoczeœnie 
# na forum Gaming oraz odpowiednio Fitness, Languagelearning, Martialarts
x <- inner_join(Gaming_Users, Fitness_Users, 
                by = "AccountId" ) 
y <- inner_join(Gaming_Users, Languagelearning_Users, 
                by = "AccountId" )
z <- inner_join(Gaming_Users, Martialarts_Users, 
                by = "AccountId" )

# Analogicznie wyznaczamy czêœæ wspóln¹ (x, y), (y, z), (z, x) oraz (x, y, z)
x_y <- inner_join(x, y, by = "AccountId")
y_z <- inner_join(y, z, by = "AccountId")
z_x <- inner_join(z, x, by = "AccountId")
x_y_z <- inner_join(x_y, y_z, by = "AccountId")

# Poprzez n_i, i=1, 2, ..., 7 oznaczamy licznoœæ zbiorów, 
# które przedstawiaj¹ poszczególne zainteresowania 
# (obliczenia wynikaj¹ z prostych dzia³añ na zbiorach)
n_1 <- nrow(x_y_z)
n_2 <- nrow(x_y) - n_1
n_3 <- nrow(y_z) - n_1
n_4 <- nrow(z_x) - n_1
n_5 <- nrow(x) - (n_1 + n_2 + n_4)
n_6 <- nrow(y) - (n_1 + n_2 + n_3)
n_7 <- nrow(z) - (n_1 + n_3 + n_4)

# Tworzymy ramkê danych z nazwami zainteresowañ i odpowiadaj¹cymi im liczbami
n <-  c(n_5, n_6, n_7, n_2, n_3, n_4, n_1)
labels <-  c("Fitness","Languagelearning",
               "Martialarts",
               "F&L", "L&M",
               "M&F", "F&L&M")
dane <- data.frame(n, labels)