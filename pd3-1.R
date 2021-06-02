
library("XML")

result <- xmlParse("diy/Posts.xml")
nodes <- getNodeSet(result, path = "//row")
data <- XML:::xmlAttrsToDataFrame(nodes)
data
typeof(data)
is.data.frame(data)