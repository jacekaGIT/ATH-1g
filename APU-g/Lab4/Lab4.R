#..... Jacek Adamczyk, sem 1, II st .......... 
#..... Lab 4, gr A, wariant 1 ................
#Uczenie maszynowe z u¿yciem drzew decyzyjnych
#.............................................


#install.packages("C50")
library("C50")

setwd("C:/Users/jacek/Dysk Google/ATH 1/APU/Lab4")
smartfony <- read.csv("JacekAdamczyk_APU_Lab1.csv")
smartfony
View(smartfony)
summary(smartfony)

smartfony$ocena <- factor(smartfony$ocena)
smartfony

drzewo <- C5.0.default(x=smartfony[,-9], y=smartfony$ocena )

summary(drzewo)
drzewo
plot(drzewo)

predict.C5.0(drzewo, smartfony[,-9])
predict.C5.0(drzewo, smartfony[,-9], type = "class")
