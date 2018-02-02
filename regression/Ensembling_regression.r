library(FSelector)
dataset <- read.csv('regressionDataset.csv')
target  <- names(dataset)[1]   # i.e. RMSD
inputs <- setdiff(names(dataset),target)
formula <- as.formula(paste(target, "~", paste(c(inputs), collapse = "+")))
formula
f <- chi.squared(formula,dataset)
f3 <- linear.correlation(formula, dataset)
f3
write.csv(f3,'linear.csv')
f4 <- rank.correlation(formula, dataset)
f4
correlationMatrix <- cor(dataset)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)
highlyCorrelated
