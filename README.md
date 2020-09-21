# Logistic Regression

Logistic Regression is used when the dependent variable(target) is **categorical**. For example, to predict whether an email is spam (1) or (0)
It is used for **classification of categorical variables**. It involves a **sigmoidal activation function** that provides an **output between o and 1
for any input**.

          Sig(x) = 1 / (1 + e^(-x) )
          
This results in a probability between 0 and 1 of belonging in the 1 class( binary classification : 0 or 1 )
We can then cut a cutoff point at 0.5, below which everything belongs to class 0.
