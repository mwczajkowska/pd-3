
# Załadowanie biblioteki "XML"
library(XML)

################################################################################

# Ramki danych z Gaming

# Badges
# result <- XML::xmlParse("Gaming/Badges.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Gaming_Badges <-  XML:::xmlAttrsToDataFrame(nodes)

# Comments
# result <- XML::xmlParse("Gaming/Comments.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Gaming_Comments <-  XML:::xmlAttrsToDataFrame(nodes)

# PostHistory
# result <- XML::xmlParse("Gaming/PostHistory.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Gaming_PostHistory <-  XML:::xmlAttrsToDataFrame(nodes)

# PostLinks
# result <- XML::xmlParse("Gaming/PostLinks.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Gaming_PostLinks <-  XML:::xmlAttrsToDataFrame(nodes)

# Posts
result <- XML::xmlParse("Gaming/Posts.xml")
nodes <- XML::getNodeSet(result, path = "//row")
Gaming_Posts <-  XML:::xmlAttrsToDataFrame(nodes)

# Tags
# result <- XML::xmlParse("Gaming/Tags.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Gaming_Tags <-  XML:::xmlAttrsToDataFrame(nodes)

# Users
result <- XML::xmlParse("Gaming/Users.xml")
nodes <- XML::getNodeSet(result, path = "//row")
Gaming_Users <-  XML:::xmlAttrsToDataFrame(nodes)

# Votes
# result <- XML::xmlParse("Gaming/Votes.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Gaming_Votes <-  XML:::xmlAttrsToDataFrame(nodes)

################################################################################

# Ramki danych z Fitness

# Badges
# result <- XML::xmlParse("Fitness/Badges.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Fitness_Badges <-  XML:::xmlAttrsToDataFrame(nodes)

# Comments
# result <- XML::xmlParse("Fitness/Comments.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Fitness_Comments <-  XML:::xmlAttrsToDataFrame(nodes)

# PostHistory
# result <- XML::xmlParse("Fitness/PostHistory.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Fitness_PostHistory <-  XML:::xmlAttrsToDataFrame(nodes)

# PostLinks
# result <- XML::xmlParse("Fitness/PostLinks.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Fitness_PostLinks <-  XML:::xmlAttrsToDataFrame(nodes)

# Posts
# result <- XML::xmlParse("Fitness/Posts.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Fitness_Posts <-  XML:::xmlAttrsToDataFrame(nodes)

# Tags
# result <- XML::xmlParse("Fitness/Tags.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Fitness_Tags <-  XML:::xmlAttrsToDataFrame(nodes)

# Users
# result <- XML::xmlParse("Fitness/Users.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Fitness_Users <-  XML:::xmlAttrsToDataFrame(nodes)

# Votes
# result <- XML::xmlParse("Fitness/Votes.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Fitness_Votes <-  XML:::xmlAttrsToDataFrame(nodes)

################################################################################

# Ramki danych z Languagelearning
  
# Badges
# result <- XML::xmlParse("Languagelearning/Badges.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Languagelearning_Badges <-  XML:::xmlAttrsToDataFrame(nodes)

# Comments
# result <- XML::xmlParse("Languagelearning/Comments.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Languagelearning_Comments <-  XML:::xmlAttrsToDataFrame(nodes)

# PostHistory
# result <- XML::xmlParse("Languagelearning/PostHistory.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Languagelearning_PostHistory <-  XML:::xmlAttrsToDataFrame(nodes)

# PostLinks
# result <- XML::xmlParse("Languagelearning/PostLinks.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Languagelearning_PostLinks <-  XML:::xmlAttrsToDataFrame(nodes)

# Posts
# result <- XML::xmlParse("Languagelearning/Posts.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Languagelearning_Posts <-  XML:::xmlAttrsToDataFrame(nodes)

# Tags
# result <- XML::xmlParse("Languagelearning/Tags.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Languagelearning_Tags <-  XML:::xmlAttrsToDataFrame(nodes)

# Users
# result <- XML::xmlParse("Languagelearning/Users.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Coffee_Users <-  XML:::xmlAttrsToDataFrame(nodes)

# Votes
# result <- XML::xmlParse("Languagelearning/Votes.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Languagelearning_Votes <-  XML:::xmlAttrsToDataFrame(nodes)

################################################################################
  
# Ramki danych z Martialarts
  
# Badges
# result <- XML::xmlParse("Martialarts/Badges.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Martialarts_Badges <-  XML:::xmlAttrsToDataFrame(nodes)

# Comments
# result <- XML::xmlParse("Martialarts/Comments.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Martialarts_Comments <-  XML:::xmlAttrsToDataFrame(nodes)

# PostHistory
# result <- XML::xmlParse("Martialarts/PostHistory.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Martialarts_PostHistory <-  XML:::xmlAttrsToDataFrame(nodes)

# PostLinks
# result <- XML::xmlParse("Martialarts/PostLinks.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Martialarts_PostLinks <-  XML:::xmlAttrsToDataFrame(nodes)

# Posts
# result <- XML::xmlParse("Martialarts/Posts.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Martialarts_Posts <-  XML:::xmlAttrsToDataFrame(nodes)

# Tags
# result <- XML::xmlParse("Martialarts/Tags.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Martialarts_Tags <-  XML:::xmlAttrsToDataFrame(nodes)

# Users
# result <- XML::xmlParse("Martialarts/Users.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Martialarts_Users <-  XML:::xmlAttrsToDataFrame(nodes)

# Votes
# result <- XML::xmlParse("Martialarts/Votes.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Martialarts_Votes <-  XML:::xmlAttrsToDataFrame(nodes)

################################################################################
  
# Ramki danych z Music
  
# Badges
# result <- XML::xmlParse("Music/Badges.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Music_Badges <-  XML:::xmlAttrsToDataFrame(nodes)

# Comments
# result <- XML::xmlParse("Music/Comments.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Music_Comments <-  XML:::xmlAttrsToDataFrame(nodes)

# PostHistory
# result <- XML::xmlParse("Music/PostHistory.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Music_PostHistory <-  XML:::xmlAttrsToDataFrame(nodes)

# PostLinks
# result <- XML::xmlParse("Music/PostLinks.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Music_PostLinks <-  XML:::xmlAttrsToDataFrame(nodes)

# Posts
# result <- XML::xmlParse("Music/Posts.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Music_Posts <-  XML:::xmlAttrsToDataFrame(nodes)

# Tags
# result <- XML::xmlParse("Music/Tags.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Music_Tags <-  XML:::xmlAttrsToDataFrame(nodes)

# Users
# result <- XML::xmlParse("Music/Users.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Music_Users <-  XML:::xmlAttrsToDataFrame(nodes)

# Votes
# result <- XML::xmlParse("Music/Votes.xml")
# nodes <- XML::getNodeSet(result, path = "//row")
# Music_Votes <-  XML:::xmlAttrsToDataFrame(nodes)

# Usunięcie niepotrzebnych zmiennych

rm(nodes)
rm(result)
