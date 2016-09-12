setwd("~/js/barchart")
refpopext = read.delim("~/js/barchart/refpopext.tsv")
ref = t(refpopext[1, ])
refdata = ref[-c(1, length(ref[, 1])),]
names(refdata) = gsub("X", "", names(refdata))
names(refdata) = gsub("[[:punct:]]", "-", names(refdata))
df = data.frame(refdata)
colnames(df) = paste("age", "freq", sep = "\t")
write.table(df, sep = "\t", file = "mydata.tsv", quote = FALSE)
  