library(abind)
library(ggplot2)
aset = c(-10:-1,1:10)
x = matrix(data = as.integer(NA), ncol = length(aset), nrow = 10)
z = abind(x,x,x,x,x, along = 3)
dimnames(z) = list("difference" = 1:10, "lower" = aset, "starter" = c("below","lower","between","higher","above"))


for (a in 1:length(aset)){
  for (j in 1:10){
    b = aset[a]+j
    starter = c(aset[a]-.5, aset[a], (aset[a]+b)/2, b, b+.5)
    for (s in 1:length(starter)){
      converge = starter[s]
      for (i in 1:200){
        converge = (aset[a] + b) - (aset[a]*b/converge)
      }
      z[j,a,s] = converge
    }
  }
}

str(z)
summary(z)

print(z)

################################
i = sqrt(complex(real = -1,imaginary = 0))
a = -2-i
b = -2+i

starter = c(a, b, a+i, a-i, b+i, b-i, a+1, a-1, b+1, b-1)
iter = 10000
z = as.list(numeric(length(starter)))
names(z) = starter
for (s in 1:length(starter)){
  converge = rep(as.integer(NA), times = iter)
  converge[1] = starter[s]
  for (j in 2:iter){
    converge[j] = a+b - (a*b/converge[j-1])
  }
  z[[s]] = converge
}
x1 = unlist(lapply(X = z, FUN = function(x){x[iter-2]}))
x2 = unlist(lapply(X = z, FUN = function(x){x[iter-1]}))
x3 = unlist(lapply(X = z, FUN = function(x){x[iter]}))
output = data.frame(initial = names(x), final1 = round(x1,2), final2 = round(x2,2), final3 = round(x3,2))
View(output)

round(x3[5],1)

x = c(a,b)

ggplot(data = data.frame(Real = Re(x), Imaginary = Im(x)),aes(Real,Imaginary)) + geom_path()
