install.packages("neuralnet")
library(neuralnet)
creditset<-read.csv("E:/Materials/SIT Tumkur/Session V Classification/creditset.csv")
View(creditset)

set.seed(1234567890)
trainset<-creditset[1:800,]
testset<-creditset[801:2000,]
creditnet<-neuralnet(default10yr~LTI+age, trainset, hidden=4, lifesign="minimal", linear.output = FALSE, threshold = 0.1)
plot(creditnet, rep="best")
temp_test<-subset(testset, select=c("LTI", "age"))
creditnet.results<-compute(creditnet, temp_test)
results<-data.frame(actual = testset$default10yr, prediction=creditnet.results$net.result)
results[100:115,]
results$prediction<-round(results$prediction)
results[100:115,]
table(results$actual, results$prediction)

