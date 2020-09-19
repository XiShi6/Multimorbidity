library(arules)
morb_list=list(c("T90", "X76", "T99"),
               c("P76", "K86"),
               c("K86", "T93"),
               c("L90", "K83", "L84"),
               c("P80", "P79", "P76"),
               c("Y77", "K86"),
               c("K86", "L98"),
               c("S87", "K86", "N88"),
               c("P76", "K86", "L91"),
               c("T90", "D75"),
               c("T93", "K86", "L91"),
               c("B73", "K86"),
               c("K83", "R84", "T92"),
               c("L91", "L84", "L89"),
               c("T90", "F83"),
               c("L84", "K86"),
               c("K86", "R95"),
               c("P75", "A79"),
               c("K75", "D75"),
               c("L84", "L85", "L91"))

names(morb_list) <- paste("Tr",c(1:20), sep = "")
morb_list

trans1 <- as(morb_list, "transactions")
trans1
inspect(trans1)

#write(trans1, file = "D:/projects/Intego/multimorbidity/trans1")
#trans1 = read.transactions("D:/projects/Intego/multimorbidity/trans1", format = "basket", sep=",")

#### hits ####
w <- hits(trans1)
w
## add transaction weight to the dataset
transactionInfo(trans1)[["weight"]] <- w
transactionInfo(trans1)

#### weclat ####
s <- weclat(trans1, parameter = list(support = 0.001),
            control = list(verbose = TRUE))
inspect(sort(s))

r <- ruleInduction(s, confidence= .1)
inspect(sort(r,by = "lift"))
#inspect(r)
typeof(r)


