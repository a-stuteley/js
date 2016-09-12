setwd("~/js/poppyramid")
refpopext = read.delim("~/js/barchart/refpopext.tsv")
ref = t(refpopext)
refdata = ref[-c(1, length(ref[, 1])),]
names(refdata) = gsub("X", "", names(refdata))
names(refdata) = gsub("[[:punct:]]", "-", names(refdata))
df = data.frame(refdata)
#flipping order
df = df[17:1,]
melted = as.numeric(as.matrix(df))
dim(melted) = NULL

yrs = 10:0 * 90
ag = seq(0, 80, 5)

pop = data.frame(year = rep(yrs, each = 17), age = rep(ag, 11), people = format(melted, nsmall = 4))
#pop$people

write.csv(pop, file = "mydata4.csv", quote = FALSE, row.names = FALSE)
