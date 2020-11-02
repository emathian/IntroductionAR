
# Exercise 1: Objects -----------------------------------------------------------------

# 1.1 create an integer i (value between 0 and 10)

i = 1
# use of typeof to get the type of a variable
typeof(i)
print(i)

# 1.3 Convert the variable i (created question 1) to a character variable and save the output in a new variable
i = as.character(i)
typeof(i)
print(i)

# 1.4 Assign the string "hello" to a new variable and count the number of characters of the variable using R
str_var = "hello"
typeof(str_var)
nchar(str_var)

# 1.5 Create the vector v1 and v2 from 1 to 5 (with 2 ways)

v1 = 1:5
print(v1)
v2 = c(1,2,3,4,5)
print(v2)

# 1.6 Create a categorical variable using the as.factor function 

factor_var=c("red","red","yellow","yellow","blue","red","yellow","blue")
factor_var=as.factor(factor_var)

# second option, use the factor function
factor_var=factor(c("red","red","yellow","yellow","blue","red","yellow","blue"))
print(factor_var)

# other example with numbers
factor_var=factor(c(1,1,1,2,4,5,1,2,4,5,6,2,4))
print(factor_var)

# 1.7 Create the list l containing i, v1, v2, and the word "hello"

l = list(i, v1, v2, "hello")
print(l)

# 1.8 create two matrices m1 and m2 with 5 columns and 2 lines, with the numbers from 1 to 10.
# m1 is filled by columns, and m2 by rows.

m1 = matrix(1:10, ncol=5, nrow=2)
m2 = matrix(1:10, ncol=5, nrow=2, byrow=T)

# 1.9 Ceate the dataframe d with columns ID, SEX, AGE and SMOKING for 5 samples:
# sample one is called id1, is a female of 24 years old who doesn't smoke
# sample two is called id2, is a male of 32 years old who doesn't smoke
# sample three is called id3, is a female of 61 years old who smoke
d = data.frame(ID=c("id1","id2","id3"), SEX=c("F","M","F"),AGE=c(24,32,61) ,SMOKING=c(0,0,1), stringsAsFactors=F)

# 1.10 Use of useful pre-implemented functions
print(v1)
length(v1)
sum(v1)
mean(v1)

levels(factor_var)

table(v1)
table(factor_var)

summary(v1)
summary(factor_var)

# 1.10 The iris data frame
help(iris)
# Visualize the first rows of the data frame named iris using the function head
head(iris)

# 1.11 Retrieve the dimensions of the iris data frame
dim(iris)
ncol(iris)
nrow(iris)

# 1.12 Retieve the names of the columns of the iris data frame
colnames(iris)

# 1.13 Save the data frame in a txt file
write.table(x = iris, file="iris_dataFrame.txt",quote=F,row.names = F,col.names = T,sep="\t")
# 1.13 Save the data frame in a csv file
write.csv(x = iris, file="iris_dataFrame.csv",row.names = F) 

# 1.14 Load the data saved in the txt and csv files in R
txt_data=read.table(file="iris_dataFrame.txt",header = T,sep="\t")
head(txt_data)
csv_data=read.csv(file="iris_dataFrame.csv",header = T,sep=",") 
head(csv_data)

# Exercise 2. Accessors and operators

# Retrieve the third element of the Petal.Length column in the iris data frame
# Use the column name:
iris$Petal.Length[3]
iris[3,"Petal.Length"]

# list the colnames of the iris data frame to see which column is the Petal.Length column
colnames(iris)
iris[3,3]


# 2.2 Create a vector v3, which contains the same elements as v1, except the 3rd which is 2 times higher
v3 = v1
v3[3] = v3[3] * 2
print(v1); print(v3)

# 2.3 How many elements of v3 are lower than 5?
v3 < 5
summary(v3<5)

# 2.3 How many elements of v3 are higher or equal to 1?
v3 >= 1
summary(v3 >= 1)

# 2.3 How many elements of v3 are equal to 4?
v3 == 4
summary(v3 == 4)

# 2.3 How many elements of v3 are different from 2?
v3 != 2
summary(v3 != 2)

# 2.4 Extract the rows of the iris data frame that have a Sepal.Length below the averaged sepal length
mean(iris$Sepal.Length)
iris[which(iris$Sepal.Length < 5.843),]

# 2.5 Retrieve the third element of the Petal.Length column in the iris data frame using the which function
iris[3,which(colnames(iris) == "Petal.Length")]

# 2.6 Vectorized operations: add 1 to each elements of v1 and 2 to each element of m1
print(v1)
v1 + 1
print(m1)
m1 + 2
