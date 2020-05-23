#..... Jacek Adamczyk, sem 1, II st .......... 
#..... zaj 2, gr A, wariant 1 ................
#....Procedura Analitycznej Hierarchizacji....


#install.packages('ahp')
library(ahp)
library(data.tree)

setwd("C:/Users/jacek/Dysk Google/ATH 1/APU/Lab2")
smartfonyAhp <- Load("smartfonySamsung.yml")

print(smartfonyAhp, filterFun = isNotLeaf)

Calculate(smartfonyAhp)
print(smartfonyAhp, priority = function(x) x$parent$priority["Total", x$name])
Visualize(smartfonyAhp)
Analyze(smartfonyAhp)
AnalyzeTable(smartfonyAhp)



