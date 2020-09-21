# imported data as "houses"
library(dplyr)
library(ggplot2)
#### DISCRIPANCIES

summary(houses)
# there is clear issue with distribution of n_hot_rooms, rainfall
# presence of NAs in n_hos_beds


#### EDA

boxplot(houses$n_hot_rooms,
        main = "boxplot of n_hot_rooms")
# 2 clear outliers

pairs(~houses$Sold+houses$rainfall,
      data=houses)
# 1 clear outlier

barplot(table(houses$airport))
# nothing unusual

barplot(table(houses$bus_ter))
# only 1 category, we can remove it


#### OUTLIERS

# n_hot_rooms = outlier on higher side
upper <- 3*quantile(houses$n_hot_rooms,0.99)
clean_hot_rooms <- function(x){
         if (x > upper){
                  x<- upper
         }else{
                  x<- x
         }
}
houses$n_hot_rooms<- sapply(houses$n_hot_rooms,clean_hot_rooms)


# rainfall = putlier on the lower side
lower <- 0.3*quantile(houses$rainfall,0.01)
clean_rainfall <- function(y){
         if (y < lower){
                  y<- lower
         }else{
                  y<- y
         }
}
houses$rainfall<- sapply(houses$rainfall,clean_rainfall)


#### NA VALUES

# n_hos_beds
mean_bed<- mean(houses$n_hos_beds,na.rm=TRUE)
impute_beds<- function(beds){
         out<- beds
         for(i in 1:length(beds)){
                  if(is.na(beds[i])){
                           out[i]<- mean_bed
                  }else{
                           out[i]<-beds[i]
                  }
         }
         return(out)
}
correct_beds <- impute_beds(houses$n_hos_beds)
houses$n_hos_beds<- correct_beds

#### VARIABLE TRANSFORMATION

# dist1, dist2, dist3 and dist4 showcase the same thing
# also removing bus_ter
houses <- houses %>% mutate( dist = (dist1+dist2+dist3+dist4)/4)
clean_houses <- houses %>% select(-c(dist1,dist2,dist3,dist4,bus_ter))


#### CHARACTER FACTORS

# we can create dummies to handle character type categorical variables
library(dummies)
clean_houses <- dummy.data.frame(clean_houses)
clean_houses <- clean_houses %>% select(-c(waterbodyNone,airportNO))


#### CORRELATION

library(corrgram)
corrgram(clean_houses,order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)


#### SAVING FINAL DATA
dir<- getwd()
path<- paste0(dir,"/houses.csv")
write.csv(clean_houses,path)



