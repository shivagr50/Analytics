# control structures: if,else,for,while,repeat,break,next,return

x=1

y=if(x==1){
    print(paste("The value of x is: ",x))
} else if (x==2) {
   print(paste("The value of x is: ",x))
}
print(y)

for(i in 1:10){
print(i)
}

x=c("a","b")
for(i in x){
print(i)
}

for(i in seq_along(x)){
print(x[i])
}

for(i in seq_along(x)) print(x[i])

for(i in seq_len(10))print(i)

x=matrix(1:10,nrow=2,ncol=5)
x
for(i in seq_len(nrow(x))){
    for(j in seq_len(ncol(x))){
        print(x[i,j])
    }
}

#while loop , one must ensure that end condition will always occur so that loop terminates at some point.
counter=0
while(counter!=10){
    print(counter)
    counter=counter+1
}

#Repeat, repeat initiates an infinite loop. Only breal statement can be used to come out of the condition.
# Next is used to skip to next iteration while retun and break can stop the looping altogether at runtime.
# retun will retun the value when called through a function and breal will simply stop the associated loops.

