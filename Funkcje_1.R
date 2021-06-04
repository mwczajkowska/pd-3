
# Załadowanie danych z Dane.R
source("Dane.R")

# Pakiet dplyr
library(dplyr)

# Przygotowanie danych do analizy

Dane <- dplyr::inner_join(Gaming_Posts,
                          Gaming_Users,
                          by = c("OwnerUserId" = "Id")) # Łączenie Posts i Users
Dane <- dplyr::select(Dane, OwnerUserId,
                      CreationDate.y, LastAccessDate,
                      UpVotes, DownVotes, 
                      Score, ViewCount) # Wybieram interesujące mnie kolumny
Dane <- dplyr::filter(Dane, OwnerUserId != -1,
                      !is.na(ViewCount),
                      !is.na(Score)) # Wstępna filtracja użytecznych danych
Dane <- dplyr::rename(Dane,
                      Id = OwnerUserId,
                      CreationDate = CreationDate.y) # Zmiana nazw kolumn
Dane <- dplyr::mutate_at(Dane,
                         vars(Id, UpVotes, DownVotes, Score, ViewCount), 
                         funs(as.numeric)) # Zamiana kolumn z character
                                           #(wcześniej były character)
Dane <- dplyr::mutate_at(Dane, 
                         vars(CreationDate, LastAccessDate), 
                         funs(as.Date)) # Zamiana dat na Date

################################################################################

# Wyznaczam wskaźnik sukcesu dla każdego użytkownika

Sukces <- dplyr::select(Dane, Id, Score, ViewCount)
Sukces <- dplyr::mutate(Sukces,
                        SinglePostSuccess = (Score * ViewCount) / 1000)
Sukces <- dplyr::select(Sukces, Id, SinglePostSuccess)
Sukces <- dplyr::group_by(Sukces, Id)
Sukces <- dplyr::summarise(Sukces,
                           AbsoluteSuccess = sum(SinglePostSuccess),
                           AverageSuccess = mean(SinglePostSuccess))

# Dzielę użytkowników na grupy w dwóch kategoriach

# AverageSuccess & AbsoluteSuccess
# Unsuccessful <= -1
# Normal > -1 & <= 1
# Successful > 1 & <= 10
# Brilliant > 10 & <= 100
# Elite > 100

# Ramki danych z Id użytkowników z powyższych grup

Unsuccessful_avg <- dplyr::select(dplyr::filter(Sukces,
                                                AverageSuccess <= -1),
                                  Id)
Unsuccessful_abs <- dplyr::select(dplyr::filter(Sukces,
                                                AbsoluteSuccess <= -1),
                                  Id)
Normal_avg <- dplyr::select(dplyr::filter(Sukces,
                                          AverageSuccess > -1
                                          & AverageSuccess <= 1),
                                  Id)
Normal_abs <- dplyr::select(dplyr::filter(Sukces,
                                          AbsoluteSuccess > -1 
                                          & AbsoluteSuccess <= 1),
                                  Id)
Successful_avg <- dplyr::select(dplyr::filter(Sukces,
                                              AverageSuccess > 1
                                              & AverageSuccess <= 10),
                                  Id)
Successful_abs <- dplyr::select(dplyr::filter(Sukces,
                                                AbsoluteSuccess > 1 
                                                & AbsoluteSuccess <= 10),
                                  Id)
Brilliant_avg <- dplyr::select(dplyr::filter(Sukces,
                                                AverageSuccess > 10
                                             & AverageSuccess <= 100),
                                  Id)
Brilliant_abs <- dplyr::select(dplyr::filter(Sukces,
                                                AbsoluteSuccess > 10 
                                             & AbsoluteSuccess <= 100),
                                  Id)
Elite_avg <- dplyr::select(dplyr::filter(Sukces, AverageSuccess > 100),
                                  Id)
Elite_abs <- dplyr::select(dplyr::filter(Sukces, AbsoluteSuccess > 100),
                                  Id)

################################################################################

# Model 1 (może czas użytkowania konta wpływa na sukces?)

# Ramka danych z czasem użytkowania konta

Czas <- dplyr::select(Dane, Id, CreationDate, LastAccessDate)

time_difference <- function(x, y){
  z <- unclass(x) - unclass(y)
  round(z / 365, 1)
} # Funkcja obliczająca różnicę czasu, podaje wynik w latach

Czas <- dplyr::mutate(Czas,
                      DifferenceInTime = time_difference(LastAccessDate, 
                                                         CreationDate))
Czas <- dplyr::select(Czas, Id, DifferenceInTime)
Czas <- dplyr::distinct(Czas, Id, .keep_all = TRUE) 

# Sprawdzamy średni czas użytkowania konta w każdej z grup

extract_MeanTime <- function(Czas, Grupa){
  wynik <- dplyr::inner_join(Grupa, Czas, by = "Id")
  wynik <- summarise(wynik, MeanTime = mean(DifferenceInTime))
  wynik <- wynik[1, 1, drop = TRUE]
  round(wynik, 1)
} # Funkcja zwracająca średni czas użyktowania konta w danej grupie

# Tworzenie wynikowych list

Lista_suc_avg <- list(extract_MeanTime(Czas, Unsuccessful_avg),
                  extract_MeanTime(Czas, Normal_avg),
                  extract_MeanTime(Czas, Successful_avg),
                  extract_MeanTime(Czas, Brilliant_avg),
                  extract_MeanTime(Czas, Elite_avg))

Lista_suc_abs <- list(extract_MeanTime(Czas, Unsuccessful_abs),
                  extract_MeanTime(Czas, Normal_abs),
                  extract_MeanTime(Czas, Successful_abs),
                  extract_MeanTime(Czas, Brilliant_abs),
                  extract_MeanTime(Czas, Elite_abs))

names(Lista_suc_avg) <- c("Unsuccessful",
                      "Normal",
                      "Successful",
                      "Brilliant",
                      "Elite")

names(Lista_suc_abs) <- c("Unsuccessful",
                      "Normal",
                      "Successful",
                      "Brilliant",
                      "Elite")

# Komentarz: Widać, że czas użytkowania konta wpływa na sukces postów

################################################################################

# Model 2 (może "kontrowersyjność" wpływa na sukces?)
# Wskaźnik kontrowersyjności to Controversy = DownVotes / (UpVotes + DownVotes)

Kontrowersja <- dplyr::select(Dane, Id, UpVotes, DownVotes)
Kontrowersja <- dplyr::filter(Kontrowersja,
                              UpVotes^2 + DownVotes^2 != 0) # W przypadku, gdy
# UpVotes i DownVotes oba są zerami, nie da się policzyć wskaźnika Controversy
Kontrowersja <- dplyr::mutate(Kontrowersja,
                              Controversy = round(
                                DownVotes / (UpVotes + DownVotes), 2
                                )
                              )
Kontrowersja <- dplyr::select(Kontrowersja, Id, Controversy)
Kontrowersja <- dplyr::distinct(Kontrowersja, Id, .keep_all = TRUE)

# Sprawdzamy średnią kontrowersyjność w każdej z grup

extract_MeanControversy <- function(Kontrowersja, Grupa){
  wynik <- dplyr::inner_join(Grupa, Kontrowersja, by = "Id")
  wynik <- summarise(wynik, MeanControversy = mean(Controversy))
  wynik <- wynik[1, 1, drop = TRUE]
  round(wynik, 2)
} # Funkcja zwracająca średnią kontrowersyjność w danej grupie

# Tworzenie wynikowych list

Lista_con_avg <- list(extract_MeanControversy(Kontrowersja, Unsuccessful_avg),
                      extract_MeanControversy(Kontrowersja, Normal_avg),
                      extract_MeanControversy(Kontrowersja, Successful_avg),
                      extract_MeanControversy(Kontrowersja, Brilliant_avg),
                      extract_MeanControversy(Kontrowersja, Elite_avg))

Lista_con_abs <- list(extract_MeanControversy(Kontrowersja, Unsuccessful_abs),
                      extract_MeanControversy(Kontrowersja, Normal_abs),
                      extract_MeanControversy(Kontrowersja, Successful_abs),
                      extract_MeanControversy(Kontrowersja, Brilliant_abs),
                      extract_MeanControversy(Kontrowersja, Elite_abs))

names(Lista_con_avg) <- c("Unsuccessful",
                          "Normal",
                          "Successful",
                          "Brilliant",
                          "Elite")

names(Lista_con_abs) <- c("Unsuccessful",
                          "Normal",
                          "Successful",
                          "Brilliant",
                          "Elite")

# Komentarz: Widać, że kontrowersyjność wpływa, lecz w niewielkim stopniu,
# na popularność postów

