#..... Jacek Adamczyk, sem 1, II st .......... 
#..... Lab 5, gr A, wariant 1 ................
# Modelowanie procesów uczenia maszynowego ...
# w pakiecie MLR. Trenowanie, ocena ..........
# i porównywanie modeli w pakiecie MLR .......
#.............................................

# Zadanie 2


#install.packages("mlr")
#install.packages("rFerns")
#install.packages("randomForestSRC")

library("mlr")
library("rFerns")
library("randomForestSRC")

# Funkcja normalizuj¹ca dane w zakr min do max
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

setwd("C:/Users/jacek/Dysk Google/ATH 1/APU/Lab5/Zad2")
smartfony <- read.csv("JacekAdamczyk_APU_Lab1.csv")
smartfony
head(smartfony)

smartfony$ocena <- factor(smartfony$ocena)
smartfony$ocena

smartfony <- smartfony[,-6]
smartfony <- smartfony[,-1]
smartfony <- smartfony[,-5]
smartfony <- smartfony[,-7]
smartfony <- smartfony[,-5]
smartfony

smartfony$wyswietlacz <- normalize(smartfony$wyswietlacz)
smartfony$pamiec_RAM <- normalize(smartfony$pamiec_RAM)
smartfony$pamiec_wbudowana <- normalize(smartfony$pamiec_wbudowana)
smartfony <- data.frame(smartfony)

smartfony

zadanie = makeClassifTask(id = deparse(substitute(smartfony)),
                                       smartfony,
                                       "ocena",
                                       weights = NULL,
                                       blocking = NULL,
                                       coordinates = NULL,
                                       positive = NA_character_,
                                       fixup.data = "warn",
                                       check.data = TRUE)

ponowne_probkowanie = makeResampleDesc("CV", iters = 10)

metody_uczenia <- makeLearners(c("rpart",
                                 "C50",
                                 "rFerns",
                                 "randomForestSRC"),
                               type = "classif")

porownnanie_metod <- benchmark(learners = metody_uczenia,
                               tasks = zadanie,
                               resamplings = ponowne_probkowanie)

porownnanie_metod
porownnanie_metod$results

plotBMRBoxplots(porownnanie_metod, measure = mmce,
                order.lrn = getBMRLearnerIds(porownnanie_metod))
plotBMRSummary(porownnanie_metod)
plotBMRRanksAsBarChart(porownnanie_metod, pos = "dodge",
                       order.lrn = getBMRLearnerIds(porownnanie_metod))


