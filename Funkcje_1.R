
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
Snsuccessful_abs <- dplyr::select(dplyr::filter(Sukces,
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

# Czas <- ... to be continued






