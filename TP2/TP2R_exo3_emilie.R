# Exercice 3 ---------------------------------------------------------------
# Q1
ConvertCmToMm = function(VInCm){
  " This function convert a length in cm to a length in mm.
   :input VInCm: (vector) of double corresponding to lenghts given in cm;
   :output VInMm: (vector)of double corresponding to lenghts given in mm."
  
  VInMm <- VInCm * 10
  return(VInMm)
}
Sepal.Length.mm <- ConvertCmToMm(iris$Sepal.Length)

#Q2 
MaxPetalArea = function(Petal.Length, Petal.Width){
  " This function return the maximal area of the petal for each iris, 
  assuming that this area correspond then to a rectangle.
  :input Petal.Length: (vector) of double corresponding to the petals' lenght in cm;
  :input Petal.Width: (vector) of double corresponding to the petals' width in cm;
  :output MaxArea: (vector) of double corresponding to the petals' maximal area i cm^2;"
  MaxArea <- Petal.Length * Petal.Width
  return(MaxArea)
}

iris$Petal.Max.Petal.Area <- MaxPetalArea(iris$Petal.Length, iris$Petal.Width)
print(head(iris))

# Q3
for (i in 1:dim(iris[0])){
  if (iris$Petal.Length[i] > iris$Sepal.Length[i]){
    iris$Max.Length[i] <- iris$Petal.Length[i] 
  }
  else if(iris$Petal.Length[i] < iris$Sepal.Length[i]){
    iris$Max.Length[i] <- iris$Sepal.Length[i] 
  }
  else{ # Petal.Lenght == Sepal.Length
    iris$Max.Length[i] <- iris$Sepal.Length[i] 
  }
}
head(iris)

# Q4
for (i in 1:dim(iris[0])){
  if (iris$Max.Length[i] == iris$Sepal.Length[i]){
    iris$Part.max[i] <- paste("sepal-", iris$Sepal.Length[i]) 
  }
  else {
    iris$Part.max[i] <- paste("petal-", iris$Petal.Length[i]) 
  }
}
head(iris)

# Q5
lapply(list(iris$Sepal.Length), ConvertCmToMm)

# Q6
sapply(1:nrow(iris),function(i) max(iris$Sepal.Length[i],iris$Petal.Length[i])) 

# Q7
MedianValues <- sapply(1:ncol(iris), function(i) if(is.numeric(iris[,i])){
                                                        return(median(iris[,i]))} 
                                                  else{
                                                    return("NA")
                                                  }) 
irisNew <- rbind(iris, MedianValues)

# Q8
print(unique(iris$Species))
print(max(iris$Sepal.Length))
print(min(iris$Sepal.Length))

print(iris$Species[max(iris$Sepal.Length)])
plot(density(iris$Sepal.Length[iris$Species == "virginica"]), col= "blue", main = "Distribution of sepals' lenght by specie",
            xlab = "cm", ylim = c(0,1.2), xlim = c(3,9))
lines(density(iris$Sepal.Length[iris$Species == "versicolor"]), col= "red")
lines(density(iris$Sepal.Length[iris$Species == "setosa"]), col= "green")
legend('topright', legend=c("virginica", "versicolor", "setosa" ),
       col=c( "blue", "red", "green"), lty=1)

pdf(file="seapl_length_distribution.pdf")
boxplot(formula=Sepal.Width~Species,data=iris,main="Distribution of the sepal length in the three iris species",xlab="Species",ylab="Length(cm)",outline=T)



