add2=function(x,y) {
    x+y
}

add2(2,3)



filter=function(x,n=3) {
    x[x>n]
}

print(filter(c(1,2,4,6,7,9)))
print(filter(c(1,2,4,6,7,9),7))



