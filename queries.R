install.packages("dplyr")
install.packages("ggplot2")
install.packages("DBI")
install.packages("RMySQL")
library(DBI)
library(RMySQL)
library(dplyr)
library(ggplot2)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
head(DataDB)

esp <- DataDB %>%
  filter(Language == "Spanish")

class(esp)

ggplot(esp, aes(x=CountryCode, y = Percentage)) +
  geom_bin2d()

