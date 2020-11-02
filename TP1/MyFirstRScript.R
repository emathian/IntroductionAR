# Introduction to R : TP1 --------------------------------------------------

# General introduction  --------------------------------------------------------------
# b : My first comment
# c : My first instruction 
help(plot)


# Exercice 1 --------------------------------------------------------------
# Q1
i <- 0

# Q2
help(typeof)
help("as.character")
help(print)
help(nchar)

# Q3
mychar <- as.character(i)
print(mychar)

# Q4
mystring <- "hello"
print(nchar(mystring))

# Q5
v1 <- c(1:5)
print(v1)
# My First for loop
v2 <- c()
for (i in 1:5){
  v2 <- c(v2,i)
}
print(v2)

# Q6
MyCategorialVariable <- as.factor(v1)
print(MyCategorialVariable)

# Q7
l <- list(i, v1, v2, mystring)
print(l)

# Q8
m1 <- matrix(1:10, ncol = 5, nrow = 2, byrow = T)
print(m1)

m2 <- matrix(1:10, ncol = 5, nrow = 2, byrow = F)
print(m2)

# Q9
df <- data.frame("ID" = c('id1', 'id2', 'id3'),
                 "SEX" = as.factor(c("female", "male", "female")),
                 "SMOKING" = c(F,F,T))
print(df)

# Q10
## a
print(list("Lenght of the vector v1 = ", length(v1), "Sum of the vector v1 = ", sum(v1), "Mean of the vector v1 = ", mean(v1)))

## b
print(levels(MyCategorialVariable))

## c 
print(table(v1))
print(summary(v1))

print(table(MyCategorialVariable))
print(summary(MyCategorialVariable))

# Q11
help(iris)

# Q12
print(dim(iris))

# Q13
print(colnames(iris))

# Q14
write.table(iris, "iris.txt", quote=F,row.names = F,col.names = T,sep="\t")
write.csv(iris, "iris.csv",row.names = F) 

# Q15
DfFromTxt <- read.table("iris.txt", header = T, sep= "\t")
DfFromCsv <- read.csv("iris.csv",  header = T, sep = ',')


# Exercice 2 --------------------------------------------------------------

# Q1
print(iris$Petal.Length[3])
print(iris[3, "Petal.Length"])

# Q2
v3 <- v1
v3[3] <- v3[3] * 2
print(v3)

# Q3
# a 
print(sum(v3 < 5))
print(summary(v3 < 5))
# b
print(sum(v3 >= 1))
# c
print(sum(v3 == 4))
# d
print(sum(v3 != 2))

# Q4
iris[iris$Sepal.Length < mean(iris$Sepal.Length), ]

# Q5
iris$Petal.Length[which(rownames(iris) == "3")]

# Q6
print(v1 + 1)
print(m1 + 2)
