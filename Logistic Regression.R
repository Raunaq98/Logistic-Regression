#### SIMPLE LOGISTIC REGRESSION

# using only price variable

simple_logistic <- glm(Sold ~ price,
                       data = clean_houses,
                       family = binomial)
summary(simple_logistic)



#### MULTIPLE LOGISTIC REGRESSION

logistic <- glm( Sold ~.,
                 data = clean_houses,
                 family = binomial)
summary(logistic)

#### PREDICTIONS

probabilities <- predict(logistic, typ= "response")
fitted.results <- ifelse(probabilities > 0.5,"YES","NO")

#### CONFUSION MATRIX

confusion<- table(fitted.results,clean_houses$Sold)
# fitted.results   0   1
#            NO  197  81
#            YES  79 149


#### ACCURACY

accuracy <- (197 + 149) / (197+81+79+149)
# [1] 0.6837945