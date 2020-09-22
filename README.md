# Logistic Regression

Logistic Regression is used when the dependent variable(target) is **categorical**. For example, to predict whether an email is spam (1) or (0)
It is used for **classification of categorical variables**. It involves a **sigmoidal activation function** that provides an **output between o and 1
for any input**.

          Sig(x) = 1 / (1 + e^(-x) )
          
This results in a probability between 0 and 1 of belonging in the 1 class( binary classification : 0 or 1 )
We can then cut a cutoff point at 0.5, below which everything belongs to class 0.

# Confusion Matrix

We evaluate the model performace using a **confusion matrix**.
**Confusion Matrix** is a table that is often used to describe the performance of a classification model on a set of test data for which 
the true values are known. It allows the visualization of the performance of an algorithm.
    
|    . | Predicted NO | Predicted YES|
|------| -------------|---------------|
|Actual NO| TN | FP |
|Actual YES | FN | TP |

Accuracy =    ( TP + TN ) / ( TP + FP + TN + FN )

# Limitations

                    Two-Class Problems : Logistic regression is intended for two-class or binary classification problems. 
                    It can be extended for multi-class classification, but is rarely used for this purpose.

                    Unstable With Well Separated Classes :  Logistic regression can become unstable when the classes are well separated.

                    Unstable With Few Examples : Logistic regression can become unstable when there are few examples from which to estimate the parameters.
