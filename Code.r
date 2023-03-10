library(readxl)
Movies <- read_excel("~/Desktop/Movies (1).xlsm", 
                     col_types = c("numeric", "text", "date", 
                                   "text", "text", "numeric", "numeric"))
View(Movies)
Movies <- data.frame(Movies)
View(Movies)

library(ggplot2)
library(dplyr)

#Graph 1
Years <- c(2016,2017,2018,2019)
Amount_of_Movies_Released <- c(679,617,587,556)
One <- data.frame(Years,Amount_of_Movies_Released)

One.Graph <- ggplot(data=One, aes(x=Years, y=Amount_of_Movies_Released)) +
  geom_smooth(color="pink") +
 geom_rug(col="yellow",alpha=10, size=1.5)+
  ggtitle("The Decrease in Total Amount Of Movies Released Between the Years of 2016 to 2019")
Y <- print(One.Graph+labs (y="Total Amount of Movies Released", x= "Years"))





#Graph 2
Months<-months.Date(Movies$Release.Date)
Movies <-cbind(Movies,Months)

Months[Months=="January"] <- "January-March"
Months[Months== "February"] <- "January-March"
Months[Months== "March"] <- "January-March"

Months[Months=="April"] <- "April-June"
Months[Months=="May"] <- "April-June"
Months[Months=="June"] <- "April-June"

Months[Months=="July"] <- "July-September"
Months[Months=="August"] <- "July-September"
Months[Months=="September"] <- "July-September"

Months[Months=="October"] <- "October-December"
Months[Months=="November"] <- "October-December"
Months[Months=="December"] <- "October-December"
Months.2<-Months 
Months.2
Movies <- cbind(Movies,Months.2)
Movies
Two.Graph<- ggplot(Movies, aes(x=Months.2,fill=Months.2)) +  
  geom_bar()+theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Total Amount of Movies Released by Months Bewtween the Years of 2016 to 2019")
X<- print(Two.Graph+labs (y="Total Amount of Movies Released", x= "Months", fill = "Months")) 







#Graph 3
Three.Graph <- ggplot(Movies, aes(x=Genre,fill=Genre)) +  
  geom_bar()+theme(axis.text.x = element_text(angle = 90))+
  ggtitle("Total Amount of Movies Released by Genres Bewtween the Years of 2016 to 2019")
Z<- print(Three.Graph+labs (y="Total Amount of Movies Released", x= "Genres", fill = "Genres")) 
Three.Graph




#Graph Three Prep 
genretypes <- c("Action", "Adventure", "Black Comedy", "Comedy", "Documentary", "Drama","Horror", "Multiple Genres",
                "Musical", "Romantic Comedy", "Thriller/Suspense", "Western", "Concert/Perfor???????")
genretypes
for (i in 1:length(genretypes)){
  print(genretypes[i]) 
  print(count(Movies[which(Movies$Genre==genretypes[i]),]))
}
b <- data.frame(genretypes,"count"=c(213,144,30,258,485,838,118,13,21,72,209,23,15))
print(b)

Genres <- data.frame(genretypes,b)







#Graph 4 (Table)
duplicated(Movies$Distributor)
New <- Movies$Distributor[!duplicated(Movies$Distributor)]
New

for (i in 1:length(New)){
  print(New[i]) 
  print(count(Movies[which(Movies$Distributor==New[i]),]))
}

New.2 <- c( 42, 68, 52, 81, 45, 83, 31, 78, 33, 16, 39, 1, 56, 11, 3, 27, 10, 2, 26, 2,5, 
            55,7,10,11,12,43,4,21,3,81,11,32,50,4,77,1,2,1,8,87,8,1,40,21,4,1,9,6,1,
            1,27,1,3,1,2,38,7, 1,7,1,8,33,64,33,1,28,6,5,3,86,4,1,2,1,5,1,25,17,16,1,46,
            1,18,1,56,1,6,2, 3,7,8,1,1,4,1,1,13, 7,1,8,14,1,1,17,1,2,12,4,46,1,7,11,1,9,
            3,1,6,1,9,1,1,1,1,7,1,1,1,5,3,1,1,1,1,1,5,1,1,2,1,1,1,2,1,12,5,2,8,4,8,7,1,1,
            27,1,2,1,7,18,2,6,4,1,1,2,1,3,2,3,22,1,1,4,1,4,1,1,4,1,1,1,1,3,4,4,19,2,3,2,
            3,2,4,1,1,1,2,4,1,1,2,1,1,1,1,1,8,1,1,1,2,1,1,1,1,1,2,2,1,1,1,1,6,1,4,15,1,
            1,1,1,1,5,1,1,1,1,1,1,2,1,1,1,2,1,1)

Dis.2 <- data.frame(New,New.2)
Dis.2
Dis.2 <-Dis.2[order(-Dis.2$New.2),]
write.csv(Dis.2,"Dis.2.csv")




#Graph 5

sum(Movies$Tickets.Sold[1:679])
sum(Movies$Tickets.Sold[680:1296])
sum(Movies$Tickets.Sold[1297:1883])
sum(Movies$Tickets.Sold[1884:2439])

Years <- c(2016,2017,2018,2019)
TATS <- c(1214020806,1126430739,1200161994,1174192136)
Graph.4 <- data.frame(Years,TATS)

Four.Graph <- ggplot(Graph.4,aes(x=Years,y=TATS)) +
  geom_smooth(color="Purple")+
  geom_rug(col="orange",alpha=10, size=1.5)+
  ggtitle("Total Amount of Movie Tickets Sold Bewtween the Years of 2016 to 2019")
A<- print(Four.Graph+labs (y="Total Amount of Movie Tickets Sold", x= "Years", fill="Years")) 
Four.Graph

#Rearrangement of Excel files 

Movies<- Movies[order(-Movies$Gross),]
Movies <- Movies[order(-Movies$Tickets.Sold),]
Movies
write.csv(Movies,"Movies.csv")
