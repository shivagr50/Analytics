x=1
x= 1:20
x="This is R Language"
#Printing out some text and variable
print(paste("Hi!", x))

#R objects have attributes. these can be accessed using attributes()
# 1. Name/dimention Name
# 2. Dimentions (matrices, arrays etc.)
# 3. Class
# 4. Length
# 5. other udf metadata

#R uses c() function to concatinate things into a vector. The datatype of the vector is based n a common minimum denominator.
x=c(1,2)
print(class(x))

# R has as.xxx() functions that help convert one data type into another.
x=c(0,1,0)
print(as.logical(x))
print(as.character(x))


#Lists: these are special type of vectors that store elements of different ckasses.
x=c("a","b",1)
print(class(x))
print(x)
x=list("a","b",FALSE,1)
print(class(x))
print(x)

#Matrices: matrix are vectors with  a dimention attribute.
x=matrix(nrow=2,ncol=3)
print(x)
print(attributes(x)) #notice the name of dimention appears
print(dim(x))

# Matrices are filed column wise in R. 
xnum=1:6
x=matrix(xnum,nrow=2,ncol=3)
print(x)
#when number of observationes are lesser in the vector that has data
xnum=1:5
x=matrix(xnum,nrow=2,ncol=3)
print(x)
#when number of observationes are more in the vector that has data
xnum=1:7
x=matrix(xnum,nrow=2,ncol=3)
print(x)

#matrix operations. column and row binding.
xnum=1:7
x=matrix(xnum,nrow=2,ncol=3)
print(x)
ynum=10:15
y=matrix(ynum,nrow=2,ncol=3)
print(y)
#Cbind and Rbind
print(cbind(x,y))
print(rbind(x,y))

# Fractor : this is a special type of vector that stores categorical data and it can either be ordered or un-ordered
# This can be interpreted as a integer vector where each number has a label assigned.
x=c("yes","no","sometimes","often","yes","no")
print(class(x)) #vector
print(factor(x)) #conversion of vector to a factor type of vector
print(as.factor(x))

x=as.factor(x) #second method of doing the same thing
attributes(x) #can oberse two attibutes to the factor object
print(unclass(x)) #tells you internal encoding for all levels. This happens on alphabetically starting from 1

x=c("yes","no","sometimes","often","yes","no")
x=factor(x,levels=c("often","yes","sometimes","no")) #way to change mapping if essential for model building.
print(unclass(x) )

# missing vales: Missing values are denoted by nan for undefined mathematical values and na for everything else.
# is.na() and is.nan() can be used to check if there are missing values are present.

x=c(1,2,3,NA,4,NaN)
is.na(x)
is.nan(x)
sum(is.na(x))
sum(is.nan(x))


# DataFrames : used to store tabular data, represented by a special type of list whose each element has same length. 
# Each element of this list can be visualised as a column of a table.
# unlike matrices, dataframes do not need each element to be of same datatype/class. The dataframe list can have different dtype for each element(column)
# Dataframe have attributes like row.names(denoting row serial number), names(column names), class(instance of which class)

x=matrix(xnum,nrow=2,ncol=3)
attributes(as.data.frame(x))
read.table(),read.csv() #methods generally used to create a dataframe.

x=data.frame(foo= 1:4,bar=c(T,F,T,F))
attributes(x)
nrow(x)
ncol(x)

#Names: This is a attribute just like class that can be added to vector/matrix elements or row/columns that make the object much more readable and 
# Self explanatory.

#names on vector elements
x=1:3
attributes(x)
names(x)=c("observation_1","observation_2","observation_3")
attributes(x)
print(x)
names(x)

x=1:3
attributes(x)
names(x)=c("observation_1","observation_2")
attributes(x)
print(x)
names(x)

# names attributes on a list
x1="Hi, Welcome"
x2=matrix(xnum,nrow=2,ncol=3)
x3=c(1,2,3)
x=list(a=x1,b=x2,c=x3)
x
attributes(x)

#names attribute on a matrix
x2
class(x2)
attributes(x2)
dimnames(x2)=list(c("Row_1","Row_2"),c("Column_1","Column_2","column_3"))
x2
attributes(x2)

#what happens when name length is inappropriate for a matrix.
rm(x2)
x2=matrix(xnum,nrow=2,ncol=3)
x2
class(x2)
attributes(x2)
dimnames(x2)=list(c("Row_1","Row_2"),c("Column_1","Column_2",))
x2
attributes(x2)


#Reading tabular data. Some of the key functions used:
# read.table(),read.csv()   https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/read.table
# readlines() for reading lines of a text file
# source() for reading r code files(inverse of dump)
# dget() for reading r code files(inverse of dput)
# load() to read saved workspace
# unserialize() for reading single R objects in binary form.
# Writing data to R : we use : Write.table(),writeLines(), dump(),dput(),save(),serialize()

#tips to read a large dataset while using above functions:
# 1. set comment.char ="" turn off the interpretation of comments altogether.
# 2. read documentation and pass most vales in the parameters. nrows to set max upper limit,colclasses
# 3. Make a rough calculation of how much space is required to import data and compare with available RAM.
# 4. Use of H2O package should be explored.

#Text formating: 
#This is particularly useful if you want to share a data file which needs to be used by some other person
# retains the logic of data type and concersions that one may have done on the data.
y=read.csv(file.choose())
y
dput(y,file="y.R")          #puts the df y in y.R file.
y=dget("y.R")               #reads the dput 
y

#dump and source. This is similar to dput and dget but this can store multiple objects in the formatted form.
x
y
x1
dump(c("x","x1","y"),file="env1.R") #Note that object names go in double inverted commas.
rm(x,y,x1)
x
source("env1.R")                    # sourcing back the data to locl environment from the formatted text file env1.R
x
y
x1

#setting up interfaces with outside R environment.
# You use a connection which helps communicate with interfaces like a file, gzip,bzip file/url or sql tables and more.
# for accessing a file you can use file() function.
#file()=function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"),raw = FALSE, method = getOption("url.method", "default"))
con=file("y.R","r")
x=dget(con)
x
con=url("https://archive.ics.uci.edu/ml/datasets.php","r")
x=readLines(con)
x

#Subsetting : When you want to select a subset of a R object, you use this concept. Rule of thumbs:
#  [] returns object of the same class as the orignal class. This can be used to select more than one element.
#  [[]] used to extract elements of a list or a dataframe. 
#  Can be used to extract a single element The class of returned obj may not necessarily be same  as that of the orignal.
#  $ to extract elements of a list or a df by "name" attribute.

# Subsetting matrix
x=matrix(xnum,nrow=2,ncol=3)
x
x[1,]
x[,1]

#subsetting dataframes
x1=data.frame(x)
x1
x1[1]
x1[[1]]
x1[[1]][1]

# Subsetting vectors
x0=c(1,2,3,4,5,6,7)
x0[1]
x[1:2]
x[x>3]

# Subsetting lists
lst=list(a=x,b=x0,c=x1)
attributes(lst)
lst$a
lst['a']
lst[1]
lst[c("a","b")] #cannot use double bracket subsetting for multiple items
lst [c(1,3)]

# removing missing values in a vector
x=c(1,2,3,Nan,5,6,NA)
x=x[!is.na(x)]

#when working in R, if you perform an arithmetic operation on a vector, these occur on a element by element basis