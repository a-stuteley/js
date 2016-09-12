setwd("~/js/poppyramid")
pop = read.csv("population.csv", header = TRUE)
#View(pop)
old = which(pop$age > 75)
tochange = old[!as.logical((1:length(old) - 1) %% 6)]
#pop$people[tochange]
#sort(tochange + rep(seq(0, 4, by = 2), each = length(tochange)))
collap = pop$people[sort(tochange + rep(seq(0, 4, by = 2), each = length(tochange)))]
dim(collap) = c(3, length(tochange))
#colSums(collap)

tochange2 = tochange + 1
collap2 = pop$people[sort(tochange2 + rep(seq(0, 4, by = 2), each = length(tochange2)))]
dim(collap2) = c(3, length(tochange2))
#colSums(collap2)

df = pop

df$people[tochange] = colSums(collap)
df$people[tochange2] = colSums(collap2)

toremove = sort(tochange + rep(2:5, each = length(tochange)))
df = df[-toremove, ]
dfm = df[df$sex == 1,]
dff = df[df$sex != 1,]
df2 = dfm[,-3]
df2$people = dfm$people + dff$people
#df2$std = rep(1:3, each = dim(df2)[1] / 3)

#write.csv(df, file = "mydata.csv", quote = FALSE, row.names = FALSE)
write.csv(df2, file = "mydata2.csv", quote = FALSE, row.names = FALSE)
