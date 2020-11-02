# Exercise 3: -----------------------------------------------------------------

# 1 Create a function which convert centimeters measures into millimeters and use it on iris data frame to return the sepal length in millimeters.
data(iris)
colnames(iris)=c("sepal.len","sepal.wid","petal.len","petal.wid","species")

convert = function(len.cm){
  len.mm <- len.cm*10
  return(len.mm)
}
convert(iris$sepal.len)
head(iris)

# 2 Create a function which computes the maximal surface of the petal reported in the iris data frame. Add the output in a new column of the iris data frame.
surface = function(length,width){
  max.area <- length*width
  return(max.area)
}
surface(iris$petal.len,iris$petal.wid)

iris$petal.max.area <- surface(length = iris$petal.len, width = iris$petal.wid)
head(iris)

# 3 For each row in the iris data frame, add the maximal length measure in a new column.
for(i in 1:nrow(iris)){
  iris$max.len[i] <- max(iris$sepal.len[i],iris$petal.len[i])
}
head(iris)

# 4 Create a new column in the iris data frame which displays “sepal” following by the corresponding value if the maximal length measure correspond to the sepal length and “petal” following by the corresponding value otherwise.
for(i in 1:nrow(iris)){
  if(iris$max.len[i]==iris$sepal.len[i]){
    iris$part.max[i] <- paste("sepal-",iris$max.len[i])
  }
  else{
    iris$part.max[i] <- paste("petal-",iris$max.len[i])
  }
}
head(iris)


# 5 Use the apply function to answer question 1
lapply(list(iris$sepal.len),convert)

# 6 Use the sapply function to answer question 3
sapply(1:nrow(iris),function(i) max(iris$sepal.len[i],iris$petal.len[i])) 

# 7 Using the sapply and rbind function, create a new row in the iris data frame containing median value of each column.
new_row=sapply(colnames(iris),function(i){
  if(i=="species"){
    return(NA)
  }else{
    return(median(iris[,i]))
  }
}) 
iris_new=rbind(iris,new_row)
data(iris)

# 7 Based on the iris dataset, plot the distribution of the sepal length variable for each specie. To plot need to have appropriate title and axes labels. Save the plot in a pdf file.
pdf(file="seapl_length_distribution.pdf")
boxplot(formula=sepal.wid~species,data=iris,main="Distribution of the sepal length in the three iris species",xlab="Species",ylab="Length(cm)",outline=T)
dev.off()
