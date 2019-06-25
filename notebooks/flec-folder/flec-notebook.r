# Databricks notebook source
library(dplyr)

# COMMAND ----------

install.packages("rpart")
install.packages("rpart.plot")

# COMMAND ----------

install.packages("caret")
install.packages("e1071")

# COMMAND ----------

library(rpart.plot)
library(caret)

# COMMAND ----------

data(ptitanic)
ptitanic <- na.omit(ptitanic)

# COMMAND ----------

ind <- createDataPartition(ptitanic$survived, 1, p=0.8, list=T)
trainDB <- ptitanic[ind$Resample1,]

# COMMAND ----------

glm_titanic <- caret::train(survived ~sex + age +pclass, data=trainDB, method = "glm")

# COMMAND ----------

glm_titanic$finalModel$coefficients

# COMMAND ----------

(test <- trainDB[1,c("pclass", "sex", "age")])
predict(glm_titanic, newdata = test)