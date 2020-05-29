#..... Jacek Adamczyk, sem 1, II st .......... 
#..... Lab 5, gr A, wariant 1 ................
# Modelowanie procesów uczenia maszynowego ...
# w pakiecie MLR. Trenowanie, ocena ..........
# i porównywanie modeli w pakiecie MLR .......
#.............................................

# Zadanie 1


#install.packages("C50")
#install.packages("MASS")
library("C50")
library("MASS")

View(iris)

data(iris)
head(iris)

drzewo <- C5.0(x=iris[,-5], y=iris$Species)

drzewo
summary(drzewo)
plot(drzewo)

