#..... Jacek Adamczyk, sem 1, II st .......... 
#..... zaj 1, gr A, wariant 1 ................ PUNKT a)
a <- 2 * exp(5)
b <- 2 * a
a
b
max(a,b)

#............................................. PUNKT b)
?sum()

#............................................. PUNKT c)
d <- c(15:25)
sum(d)

#............................................. PUNKT d)
apropos("sum", mode = "function")

#............................................. PUNKT e)
# katalog ooryginalny:
#setwd("C:/Users/jacek/OneDrive/Documents")
# zmiana:
setwd("C:/Users/jacek/Dysk Google/ATH 1/APU/W1")
getwd()
a <- "smartfony Samsung"
write(a, file='Lab1_e.csv')
rm(a)
a
a <- read.csv(file='Lab1_e.csv')
a

#............................................. PUNKT f)
#instalacja pakietu "gridExtra - wy³¹czona do nastepnych uruchomien skryptu
#install.packages("gridExtra")
library("gridExtra")
search()

# tabela
tt1 <- ttheme_default()
tt2 <- ttheme_minimal()

grid.arrange(
  tableGrob(mtcars[1:10,], theme=tt1),
  tableGrob(mtcars[1:10, 1:5], theme=tt2),
  nrow=1)

#............................................. PUNKT g)
aa <- seq(100, 20, -4)
aa

#............................................. PUNKT h)
a <- c(9:5)
b <- c(11:16)
a
b
d <- c(b, a)
d

#............................................. PUNKT i)
# dane techniczne telefonów
# ze strony https://www.mgsm.pl/pl/
# sortowanie od najnowszych, Android 10
nazwy            <- c('Galaxy A Quantum', 'Galaxy A21S', 'Galaxy A41',
                      'Galaxy S20', 'Galaxy A71', 'Galaxy M21', 'Galaxy Z Flip',
                      'Galaxy S10 Lite', 'Galaxy A51', 'Galaxy Note10')
wyswietlacz      <- c(6.7, 6.5, 6.1, 6.7, 6.7, 6.4, 6.7, 6.7, 6.5, 6.75)
pamiec_RAM       <- c(8, 4, 4, 12, 6, 6, 8, 8, 4, 12)
pamiec_wbudowana <- c(128, 64, 64, 128, 128, 64, 256, 128, 128, 256)
aparat_foto      <- c(64, 48, 48, 64, 64, 48, 12, 48, 48, 12)
cena             <- c(2268, 1070, 1299, 5999, 1528, 999, 6600, 2799, 1699, 4999)
liczba_ocen      <- c(7, 4, 6, 3, 3, 47, 17, 41, 19, 33)

#ocena            <- c(7.23, 5.95, 5.85, 5.57, 5, 6.53, 6.55, 8.42, 7.48, 8.54,
#                     5.97, 6.81, 6,66, 6.84, 8.27)

smartfony <- data.frame(nazwy, wyswietlacz, pamiec_RAM, pamiec_wbudowana,
                        aparat_foto, cena, liczba_ocen)
mean(smartfony$cena)

#............................................. PUNKT j)
nowy_wiersz <- data.frame(nazwy = 'Galaxy Xcover4S', wyswietlacz = 5,
                          pamiec_RAM = 3, pamiec_wbudowana = 32,
                          aparat_foto = 16, cena = 1119, liczba_ocen = 35)
smartfony <- rbind(smartfony, nowy_wiersz)
mean(smartfony$cena)

#............................................. PUNKT k)
#smartfony$ocena <- factor(c(7.23, 5.95, 5.85, 5.57, 5, 6.53, 6.55, 8.42, 7.48,
#                            8.54, 5.97))
smartfony$ocena <- factor(c(5, 4, 4, 3.5, 3, 3.5, 4, 5, 4.5,
                            5, 4.5))
aggregate(smartfony$cena, list(smartfony$cena), mean)
smartfony

#............................................. PUNKT l)
nnazwy            <- c('Galaxy XcoverPro', 'Galaxy A10', 'Galaxy A80',
                       'Galaxy A40')
nwyswietlacz      <- c(6.3, 6.2, 6.7, 5.7)
npamiec_RAM       <- c(4, 2, 8, 4)
npamiec_wbudowana <- c(64, 32, 128, 64)
naparat_foto      <- c(25, 13, 48, 16)
ncena             <- c(2199, 699, 2399, 999)
nliczba_ocen      <- c(28, 11, 87, 406)
nocena            <- factor(c(5, 4, 4.5, 5))
#nocena            <- factor(c(6.81, 6,66, 6.84, 8.27))

nsmartfony <- data.frame(nazwy = nnazwy, wyswietlacz = nwyswietlacz,
                         pamiec_RAM = npamiec_RAM,
                         pamiec_wbudowana = npamiec_wbudowana,
                         aparat_foto = naparat_foto, cena = ncena,
                         liczba_ocen = nliczba_ocen, ocena = nocena)

smartfony <- rbind(smartfony, nsmartfony)
smartfony

dane_wykresu <- table(smartfony$ocena)
dane_wykresu
barplot(dane_wykresu, main = 'Liczebnoœæ reprezentantów ka¿dej z ocen')

#............................................. PUNKT m)
oceny_tabela <- table(smartfony$ocena)
udzial_procentowy <- oceny_tabela / sum(oceny_tabela)
oceny_tabela
udzial_procentowy
pie(udzial_procentowy, main = 'Udzia³ procentowy ocen')

#instalacja pakietu "plotrix" - wy³¹czona do nastepnych uruchomien skryptu
#install.packages("plotrix")
library(plotrix)
fan.plot(oceny_tabela, main = "Udzia³ procentowy ocen",
         labels = names((oceny_tabela)))

#............................................. PUNKT n)
nowa_kolumna <- ifelse(smartfony$liczba_ocen > 100, 'wiêcej ni¿ 100 opinii',
                       ifelse(smartfony$liczba_ocen >= 50, '50-100 opinii',
                              ifelse(smartfony$liczba_ocen < 50,
                                     'mniej ni¿ 50 opinii', 'nie ma')))
nowa_kolumna
smartfony['status_opinii'] <- factor(nowa_kolumna)
smartfony
pie(table(smartfony$status_opinii))

#............................................. PUNKT o)
paste(smartfony$nazwy, ' ma ocenê klientów ', smartfony$ocena,
      ' bo ma liczbê opinii ', smartfony$liczba_ocen)

#............................................. PUNKT p)
write.csv(smartfony, 'JacekAdamczyk_APU_Lab1.csv')
smartfony_z_pliku <- read.csv('JacekAdamczyk_APU_Lab1.csv')
smartfony_z_pliku



