#..... Jacek Adamczyk, sem 1, II st .......... 
#..... zaj 4, gr A, wariant 1 ................
#.... U¿ycie sztucznych sieci neuronowych ....
#.............................................

#install.packages("neuralnet")
library("neuralnet")

# Funkcja normalizuj¹ca dane w zakr min do max
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}


#.................. Zad 1 ....................
#.............................................

# Funkcja zadana
fzad <- function(x) {
  return ((x ^ 2) + (2 * x))
}

max <- 10 # Górna wartoœæ zakresu argumentów
min <- 1  # Dolna wartoœæ zakresu argumentów

traininginput <- as.data.frame(runif(100, min, max))
traininginput [1:20,]

trainingoutput <- fzad(traininginput)
trainingoutput [1:20,]

scaled.trininginput <- as.data.frame(lapply(traininginput, normalize))
scaled.trininginput [1:20,]

trainingdata <- cbind(scaled.trininginput, trainingoutput)
colnames(trainingdata) <- c("We", "Wy")
trainingdata [1:20,]

net.price <- neuralnet(Wy~We, trainingdata, hidden = c(5, 5, 5),
                       threshold = 0.01, rep = 2)

net.price$result.matrix [1:3,]

plot (net.price)

#............... TESTOWANIE SIECI ............
#.............................................
testdata <- as.data.frame(runif(5, min, max))
scaled.testdata <- as.data.frame(lapply(testdata, normalize))

net.result <- compute(net.price, scaled.testdata)
func.result <- fzad(testdata)

compare.result <- cbind(net.result$net.result, func.result,
                        abs((func.result-net.result$net.result)),
                        abs((func.result-net.result$net.result))/func.result
                        )
colnames(compare.result) <- c("Obliczenia sieci", "Wynik spodziewany",
                              "b³¹d bezwzgl=|fn-ff|", "B³¹d wzglêdny" )
compare.result
#.............................................




#.............................................
#.................. Zad 2 ....................
#.............................................

setwd("C:/Users/jacek/Dysk Google/ATH 1/APU/Lab3")
smartfony <- read.csv("JacekAdamczyk_APU_Lab1.csv")
smartfony

cena <- normalize(smartfony$cena)
cena
smartfony <- smartfony[,-6]
smartfony <- smartfony[,-1]
smartfony <- smartfony[,-5]
smartfony <- smartfony[,-7]
smartfony <- smartfony[,-5]

smartfony[,2:5] <- as.data.frame(lapply(smartfony[,2:5], normalize))
smartfony <- cbind(smartfony, cena)
smartfony

net.price2 <- neuralnet(cena~wyswietlacz+pamiec_RAM+pamiec_wbudowana+
                          ocena, smartfony, hidden = c(5,3), threshold = 0.01)
plot (net.price2)

#............... TESTOWANIE SIECI ............
#.............................................

szukanytel <- read.csv("szukany.csv")
szukanytel
szukanytel <- szukanytel[,-6]
szukanytel <- szukanytel[,-1]
szukanytel <- szukanytel[,-5]
szukanytel <- szukanytel[,-7]
szukanytel <- szukanytel[,-5]

szukanytel

szukanytel[,2:5] <- as.data.frame(lapply(szukanytel[,2:5], normalize))
szukanytel
net.result2 <- compute(net.price2, szukanytel)
net.result2$net.result
print("Prognozowana cena smartfona w zale¿noœci od parametrów")
net.result2$net.result*6600 #wynik by³ znormalizowany

