

#Exercices 2
rm(a)

v1=seq(1,5,1)
print(a)
print(a[3])
class(a)

v2=v1+3


v3=seq(1,6,1)
v4=v3^2
v5=v4/2

joursemaine= c("lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche")
class(joursemaine)
print(joursemaine[c(2,7)])

a= c(TRUE,TRUE,FALSE)
class(a)

b= c(1.2,18.3,9.85)
class(b)
print(b[-3])

moi=c("janvier","fevrier","mars","avril","mai","juin","juillet","aout","septembre","octobre","novembre","decembre")
print(moi[c(1,2,3)])

d=c(-15,-17,-13)
class(d)
print(d[c(1,3)])

e=c("pomme","bannane","fraise","artichaut","kiwi")
class(e)
print(e[c(3:5)])      

f=c(1,2,3,NA,4)
class(f)

g=seq(1,10,1)
length(g)
h=seq(2,20,2)
length(h)
i=seq(0,-5,-1)
length(i)
j=seq(10,1,-1)
length(j)
k=seq(0,1,0.1)
length(k)
l=seq(1,10,2)
length(l)
m=c(rep(4,2))
n=c(rep(c("A","B"),2))
o=c(rep(c(1,2),2))
p=c(rep(c(TRUE,FALSE),2))

#Exercice 3

q=runif(5,min=0,max=5)
r=runif(10,min=-5,max=5)
s=runif(1000,min=10,max=20)
t=runif(15,min=50,max=100)

u=rnorm(20,mean=-2,sd=3)

echantillon=rnorm(2000,mean=-2,sd=3)
moyenne <- mean(echantillon)
ecart_type <- sd(echantillon)
print(paste("Moyenne : ", moyenne))
print(paste("Écart-type : ", ecart_type))
hist(echantillon)
#avec graph

quantile(echantillon, probs = c(0.25))
quantile(echantillon, probs = c(0.50))
quantile(echantillon, probs = c(0.75))

#quantile 

quantile(echantillon, probs = seq(0,1,0.1))

#decile

quantile(echantillon, probs = seq(0,1,0.01))

#sum #round
v=rnorm(3000,mean=2400,sd=300)
print(mean(v))
w=round(v,2)
print(sum(w))
print(median(w))
quantile(w, probs = c(0.99))
quantile(w, probs = c(0.20))

x=sample(x = c(1,2,3,4,5,6), size = 12, replace= TRUE)
print(unique(x))

print(sort(table(x)))

prop.table(table(x))
simmulation=sample(x = c(1,2,3,4,5,6), size = 1000000, replace= TRUE)
print(prop.table(sort(table(simmulation))))

