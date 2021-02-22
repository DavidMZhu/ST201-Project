Sleep<-read.table("sleepnew.txt",header=T)
attach(Sleep)
lm1<-lm(GPA~Gender,data=Sleep)
#Final Model
#Zscore = Gender + EarlyClass + ClassesMissed + EarlyClass*ClassesMissed + Depression + Depression^2
DepressionSq=Sleep$DepressionScore^2
lmfinal<-lm(CognitionZscore~Gender+EarlyClass+ClassesMissed+EarlyClass*ClassesMissed+DepressionSq+DepressionScore, data=Sleep)
anova(lmfinal)

#Outliers of our final model
lmfinal.stdres = rstandard(lmfinal)
summary(lmfinal.stdres)
help(rstandard)
show(lmfinal.stdres)
outliers = c(lmfinal.stdres>3)
show(outliers)

#outliers of ALL individual models (assuming only 1 x variable)
lm1<-lm(CognitionZscore~GPA,data=Sleep)
lm1.stdres = rstandard(lm1)
show(lm1.stdres>3)

lm2<-lm(CognitionZscore~NumEarlyClass,data=Sleep)
lm2.stdres = rstandard(lm2)
show(lm2.stdres>3)

lm3<-lm(CognitionZscore~ClassesMissed,data=Sleep)
lm3.stdres = rstandard(lm3)
show(lm3.stdres>3)

lm4<-lm(CognitionZscore~DepressionScore,data=Sleep)
lm4.stdres = rstandard(lm4)
show(lm4.stdres>3)

lm5<-lm(CognitionZscore~StressScore,data=Sleep)
lm5.stdres = rstandard(lm5)
show(lm5.stdres>3)

lm6<-lm(CognitionZscore~AnxietyScore,data=Sleep)
lm6.stdres = rstandard(lm6)
show(lm6.stdres>3)

lm7<-lm(CognitionZscore~DASScore,data=Sleep)
lm7.stdres = rstandard(lm7)
show(lm7.stdres>3)

lm8<-lm(CognitionZscore~AlcoholUse,data=Sleep)
lm8.stdres = rstandard(lm8)
show(lm8.stdres>3)

lm9<-lm(CognitionZscore~AverageSleep,data=Sleep)
lm9.stdres = rstandard(lm9)
show(lm9.stdres>3)


#Leverage, by using hat values
#In this case, p=number of indepent variables=28
lmfinal.hat= hatvalues(final.1)
show(lmfinal.hat>0.2292)
#Point 25 172! are highly likely to have high leverage



#Influence, by using cook's distance
plot(lmfinal, which = c(4))
#point 25 172 and 182 should be removed


