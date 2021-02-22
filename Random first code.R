#Setup
```{r}
setwd("~/ST201R/pro/")
sleep<-read.csv("sleep.csv", header = TRUE)
head(sleep)
```


#auto regression for testing and practicising purpose
#null<-lm(Cog~Gender+ClassYear+NumEarlyClass+EarlyClass+GPA+ClassesMissed+PoorSleepQuality+DepressionScore+AnxietyScore+StressScore+DASScore+Happiness+Drinks+WeekdayBed+WeekdayRise+WeekdaySleep+WeekendBed+WeekendRise+WeekendSleep+AverageSleep+AllNighter, data = sleep)
#full<-lm(Cog~Gender+ClassYear+NumEarlyClass+EarlyClass+GPA+ClassesMissed+PoorSleepQuality+DepressionScore+AnxietyScore+StressScore+DASScore+Happiness+Drinks+WeekdayBed+WeekdayRise+WeekdaySleep+WeekendBed+WeekendRise+WeekendSleep+AverageSleep+AllNighter, data = sleep)

```{r}
null<-lm(CognitionZscore~1, data = sleep)
full<-lm(CognitionZscore~., data = sleep)
summary(full)
```

```{r}
Model1 <- lm(CognitionZscore ~ DASScore + GPA +, data = sleep)
summary(Model1)
```

```{r}
step(null, scope = list(lower=null, upper=full), data = sleep, direction = "both")
stepres<-lm(formula = CognitionZscore ~ GPA + Gender + AnxietyStatus + ClassesMissed + StressScore, data = sleep)
summary(stepres)
```

#Select variables intuitively to run a stepwise method - 1st attempt
```{r}
#Model2 <- lm(CognitionZscore~Gender+ClassYear+GPA+ClassesMissed+PoorSleepQuality+DASScore+Happiness+Drinks+AverageSleep+LarkOwl, data = sleep) #Don't use
Model3 <- lm(CognitionZscore~Gender+ClassYear+GPA+ClassesMissed+PoorSleepQuality+DASScore+Happiness+AlcoholUse+AverageSleep+LarkOwl, data = sleep)
#summary(Model2)
summary(Model3)
```

#2nd attempt
```{r}
Model4 <- lm(CognitionZscore ~ Gender + ClassesMissed + DASScore + AverageSleep, data = sleep)
summary(Model4)
```

```{r}
ModelGPA <- lm(GPA ~ Gender + ClassesMissed + DASScore + PoorSleepQuality + AlcoholUse, data = sleep)
summary(ModelGPA)
```

```{r}
GPAReduced<-lm(GPA~ClassYear+ClassesMissed+DepressionScore+AnxietyScore+StressScore+Drinks+AverageSleep, data = sleep)
summary(GPAReduced)
```

#Stepwise methods of the above variables, did both GPA and Cog
```{r}
null1<-lm(CognitionZscore~1, data = sleep)
full1<-lm(CognitionZscore~ClassYear + ClassesMissed + DepressionScore + AnxietyScore + StressScore + Drinks + AverageSleep, data = sleep)
step(null1, scope = list(lower=null1, upper=full1), data = sleep, direction = "both")

```

```{r}
plot(sleep$Gender, sleep$Drinks)
```