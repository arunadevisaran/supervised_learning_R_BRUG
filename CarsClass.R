mtcars<-read.csv("E:/Materials/SIT Tumkur/Session V Classification/mtcars.csv")
View(mtcars)

trainset<-mtcars[1:20,]
testset<-mtcars[21:32,]
mtcarsnet<-neuralnet(mpg~disp+hp+wt+drat, trainset, hidden=3, lifesign="minimal", linear.output = FALSE, threshold = 0.1)
plot(mtcarsnet, rep="best")
temp_test<-subset(testset, select=c("disp", "hp", "wt", "drat"))
mtcarsnet.results<-compute(mtcarsnet, temp_test)
results<-data.frame(actual = testset$mpg, prediction=mtcarsnet.results$net.result)
results
error<-results$actual - results$prediction
rmse<-function(error)
{
  sqrt(mean(error^2))
}
rmse(error)
results$prediction<-round(results$prediction)
results
table(results$actual, results$prediction)