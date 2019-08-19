#PM Exercise_Assoc. Rules

library(tidyverse)
library(arules)
library(arulesViz)

#Read in data as transactions class
groc = read.transactions("groceries.txt", format="basket", sep= ",")
summary(groc)
#plot item frequency dist
itemFrequencyPlot(groc, topN = 15)

# Run initial rules ------------------------
grocrules = apriori(groc, parameter=list(support=.005, confidence=.1, maxlen=5))
#inspect all rules and subsets
inspect(grocrules) #over 1582 rules using 5 items
inspect(subset(grocrules, subset=lift > 3)) #85 rules
inspect(subset(grocrules, subset=confidence > 0.6)) #22 rules
inspect(subset(grocrules, subset=lift > 3 & confidence > 0.5)) #only 8 rules and all lead to "other vegetables"
#inspect(subset(grocrules, subset=confidence > 0.01 & support > 0.005))

#plot initial rule
plot(grocrules)

#Try other combos ---------------------------
#Rules_one ----------------------------------
rules_one = apriori(groc, parameter=list(support=.009, confidence=.1, maxlen=5))
summary(rules_one)
cat("Number of Rules",length(rules_one))
inspect(subset(rules_one, subset=lift > 3)) #14 rules; good variety
inspect(subset(rules_one, subset=confidence > 0.6)) #1 rule; butter and yogurt -> whole milk
inspect(subset(rules_one, subset=confidence > 0.3))
plot(rules_one)
#Printed Summary
cat("Rules_one summary: Number of Rules",length(rules_one),". Subsetting reduces number of rules by too much.
    Consider increasing max length and reducing support threshold")

#Rules_two ----------------------------------
rules_two = apriori(groc, parameter=list(support=.005, confidence=.1, maxlen=3))
summary(rules_two)
cat("Number of Rules",length(rules_two)) #1534 rules
inspect(subset(rules_one, subset=lift > 2)) #139 rules; good variety
inspect(subset(rules_one, subset=confidence > 0.5)) #23 rules ; mostly whole milk
inspect(subset(rules_one, subset=confidence > 0.3)) #165 rules
inspect(subset(rules_one, subset=confidence > 0.4)) #81 rules
plot(rules_two)
#Printed Summary
cat("Rules_two summary: Number of Rules",length(rules_two),". limiting confidence too 
    much leads to a single rule, while confidence .3 gives 165. Looking at levels of .4
    and .5 we see that there is a steep drop off at each level")

#Rules_three ---------------------------------
rules_three = apriori(groc, parameter=list(support=.005, confidence=.2, maxlen=5))
summary(rules_three)
cat("Number of Rules",length(rules_three)) #873 rules
inspect(subset(rules_three, subset=lift > 3)) #65 rules; good variety
inspect(subset(rules_three, subset=confidence > 0.5)) #100ish rules
inspect(subset(rules_three, confidence > 0.3 & lift >3)) #39 rules; root vegetables
plot(rules_three)
#Printed Summary
cat("Rules_three summary: Number of Rules",length(rules_three),". Choosing to move forward with
    this model bc of the more reasonable number of rules (873 vs 1500) and being able to 
    draw actionable insights.")

#Final Choice ---------------------------------
#Note: highest confidence rule across = butter and yogurt -> whole milk with 64% conf

#rules that lead to x item
milkrules <- subset(rules_three, rhs %pin% "whole milk")
inspect(milkrules) #229 rules

tropfruitrules <- subset(rules_three, rhs %pin% "tropical fruit")
inspect(tropfruitrules) #52 rules

sausagerules <- subset(rules_three, rhs %pin% "sausage")
inspect(sausagerules) #12 rules - odd rules

#plot to graph and export
plot(head(rules_three, 20, by='lift'), method='graph')
saveAsGraph(head(rules_three, n = 1000, by = "lift"), file = "groceryrules_three.graphml")


