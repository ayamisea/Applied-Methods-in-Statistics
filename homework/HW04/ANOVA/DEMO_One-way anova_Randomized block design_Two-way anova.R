#####################
##  One-way anova  ##
#####################
## http://www.r-tutor.com/elementary-statistics/analysis-variance/completely-randomized-design

one<- fastfood.1
r = c(t(as.matrix(one))) # response data 
f = c("Item1", "Item2", "Item3")   # treatment levels 
k = 3                    # number of treatment levels 
n = 6                    # observations per treatment
tm = gl(k, 1, n*k, factor(f))   # matching treatments
av = aov(r ~ tm)
summary(av) 
# H0: each mean are equal
# p-value = 0.112 > 0.05 => means are equal at 0.05 level

F<-2.541
qf(1-0.05, k-1, n-k) # 9.552094
# H0: each mean are equal
# 2.541 < 9.552094 => means are equal at 0.05 level

###############################
##  Randomized Block Design  ##
###############################
## http://www.r-tutor.com/elementary-statistics/analysis-variance/randomized-block-design

RBD<-read.table("D:/2015???j/2016 ?U??_��?βέp???k/HW_4/HW_4-DEMO/fastfood-2.txt",header=TRUE)
r = c(t(as.matrix(RBD))) # response data 
f = c("Item1", "Item2", "Item3")   # treatment levels 
k = 3                    # number of treatment levels 
b = 6                    # number of control blocks
tm = gl(k, 1, b*k, factor(f))   # matching treatment 
blk = gl(b, k, k*b)             # blocking factor 
av = aov(r ~ tm + blk)
summary(av) 
# H0: treatment effects are equal
# p-value = 0.0319 < 0.05 => treatment effects are different at 0.05 level.

F_TR<-4.959
qf(1-0.05, k-1, (k-1)*(b-1)) # 4.102821
# H0: treatment effects are equal
# 4.959 > 4.102821 => treatment effects are different at 0.05 level.

F_bl<-2.061
qf(1-0.05, b-1, (k-1)*(b-1))
# H0: bolck effects are equal
# 2.061 < 3.325835 => block effects are equal at 0.05 level.

#####################
##  Two-way aonva  ##
#####################
## http://www.r-tutor.com/elementary-statistics/analysis-variance/factorial-design

two<-read.csv("D:/2015???j/2016 ?U??_��?βέp???k/HW_4/HW_4-DEMO/fastfood-3.csv",header=TRUE)
r = c(t(as.matrix(two))) # response data
f1 = c("Item1", "Item2", "Item3") # 1st factor levels 
f2 = c("East", "West")            # 2nd factor levels 
k1 = length(f1)          # number of 1st factors 
k2 = length(f2)          # number of 2nd factors 
n = 4                    # observations per treatment
tm1 = gl(k1, 1, n*k1*k2, factor(f1)) 
tm2 = gl(k2, n*k1, n*k1*k2, factor(f2))
av = aov(r ~ tm1 * tm2)  # include interaction
summary(av) 
# H0: no interaction
# p-value = 0.01132 < 0.05 => interaction exists

