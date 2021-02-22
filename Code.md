---
title: "ST201 Project Full Notes"
output: html_document
---



#Setup
##sleepnew is the new dataset with edited value

```r
setwd("~/ST201R/pro/")
sleepnew<-read.csv("sleepnew.csv", header = TRUE)
head(sleepnew)
```

```
##   Gender ClassYear Lark Owl NumEarlyClass EarlyClass ClassesMissed
## 1      0         1    0   0             2          1             0
## 2      0         1    0   0             3          1             0
## 3      0         1    0   1             5          1             0
## 4      1         1    0   0             4          1             0
## 5      0         1    0   0             0          0             0
## 6      0         1    0   1             3          1             0
##   CognitionZscore PoorSleepQuality DepressionScore DepressionScoreSq
## 1            1.03                5              12               144
## 2            0.01                5               8                64
## 3           -0.51                8               4                16
## 4            0.92                4               1                 1
## 5            0.09                6              10               100
## 6            0.18                6               1                 1
##   StressScore DepressionStatus AnxietyStatus Stress Happiness AlcoholUse
## 1          20                2             1      1        29          3
## 2          10                3             3      2        15          3
## 3          14                3             2      2        20          2
## 4           2                3             3      2        32          2
## 5          24                2             2      1        19          4
## 6           1                3             3      2        28          2
##   Drinks WeekdayBed WeekdayRise WeekdaySleep WeekendBed WeekendRise
## 1      3       24.4        8.75         8.25      24.00        9.00
## 2      1       22.9        8.30         9.40      27.25       11.50
## 3      5       24.4        8.17         7.17      26.50       10.75
## 4      6       23.8        8.45         8.80      24.13       10.54
## 5      0       23.0        8.73         9.88      23.13        9.25
## 6      8       24.9        8.25         7.65      25.75        9.63
##   WeekendSleep AverageSleep AllNighter
## 1         9.25         8.54          0
## 2         8.25         9.07          0
## 3         9.75         7.90          0
## 4        10.04         9.15          0
## 5         9.75         9.85          0
## 6         7.13         7.50          0
```

#All the important plot

```r
head(sleepnew) 
```

```
##   Gender ClassYear Lark Owl NumEarlyClass EarlyClass ClassesMissed
## 1      0         1    0   0             2          1             0
## 2      0         1    0   0             3          1             0
## 3      0         1    0   1             5          1             0
## 4      1         1    0   0             4          1             0
## 5      0         1    0   0             0          0             0
## 6      0         1    0   1             3          1             0
##   CognitionZscore PoorSleepQuality DepressionScore DepressionScoreSq
## 1            1.03                5              12               144
## 2            0.01                5               8                64
## 3           -0.51                8               4                16
## 4            0.92                4               1                 1
## 5            0.09                6              10               100
## 6            0.18                6               1                 1
##   StressScore DepressionStatus AnxietyStatus Stress Happiness AlcoholUse
## 1          20                2             1      1        29          3
## 2          10                3             3      2        15          3
## 3          14                3             2      2        20          2
## 4           2                3             3      2        32          2
## 5          24                2             2      1        19          4
## 6           1                3             3      2        28          2
##   Drinks WeekdayBed WeekdayRise WeekdaySleep WeekendBed WeekendRise
## 1      3       24.4        8.75         8.25      24.00        9.00
## 2      1       22.9        8.30         9.40      27.25       11.50
## 3      5       24.4        8.17         7.17      26.50       10.75
## 4      6       23.8        8.45         8.80      24.13       10.54
## 5      0       23.0        8.73         9.88      23.13        9.25
## 6      8       24.9        8.25         7.65      25.75        9.63
##   WeekendSleep AverageSleep AllNighter
## 1         9.25         8.54          0
## 2         8.25         9.07          0
## 3         9.75         7.90          0
## 4        10.04         9.15          0
## 5         9.75         9.85          0
## 6         7.13         7.50          0
```

```r
summary(sleepnew)
```

```
##      Gender         ClassYear          Lark             Owl        
##  Min.   :0.0000   Min.   :1.000   Min.   :0.0000   Min.   :0.0000  
##  1st Qu.:0.0000   1st Qu.:2.000   1st Qu.:0.0000   1st Qu.:0.0000  
##  Median :0.0000   Median :2.000   Median :0.0000   Median :0.0000  
##  Mean   :0.4032   Mean   :2.478   Mean   :0.1621   Mean   :0.1937  
##  3rd Qu.:1.0000   3rd Qu.:3.000   3rd Qu.:0.0000   3rd Qu.:0.0000  
##  Max.   :1.0000   Max.   :4.000   Max.   :1.0000   Max.   :1.0000  
##  NumEarlyClass     EarlyClass    ClassesMissed   CognitionZscore    
##  Min.   :0.000   Min.   :0.000   Min.   : 0.00   Min.   :-1.62e+00  
##  1st Qu.:0.000   1st Qu.:0.000   1st Qu.: 0.00   1st Qu.:-4.80e-01  
##  Median :2.000   Median :1.000   Median : 1.00   Median :-1.00e-02  
##  Mean   :1.732   Mean   :0.664   Mean   : 2.15   Mean   :-3.95e-05  
##  3rd Qu.:3.000   3rd Qu.:1.000   3rd Qu.: 3.00   3rd Qu.: 4.40e-01  
##  Max.   :5.000   Max.   :1.000   Max.   :20.00   Max.   : 1.96e+00  
##  PoorSleepQuality DepressionScore  DepressionScoreSq  StressScore    
##  Min.   : 1.000   Min.   : 0.000   Min.   :   0.00   Min.   : 0.000  
##  1st Qu.: 4.000   1st Qu.: 1.000   1st Qu.:   1.00   1st Qu.: 3.000  
##  Median : 6.000   Median : 3.000   Median :   9.00   Median : 8.000  
##  Mean   : 6.257   Mean   : 5.202   Mean   :  62.92   Mean   : 9.466  
##  3rd Qu.: 8.000   3rd Qu.: 7.000   3rd Qu.:  49.00   3rd Qu.:14.000  
##  Max.   :18.000   Max.   :35.000   Max.   :1225.00   Max.   :37.000  
##  DepressionStatus AnxietyStatus       Stress        Happiness    
##  Min.   :1.000    Min.   :1.000   Min.   :1.000   Min.   : 0.00  
##  1st Qu.:3.000    1st Qu.:2.000   1st Qu.:2.000   1st Qu.:24.00  
##  Median :3.000    Median :3.000   Median :2.000   Median :28.00  
##  Mean   :2.787    Mean   :2.652   Mean   :1.779   Mean   :26.11  
##  3rd Qu.:3.000    3rd Qu.:3.000   3rd Qu.:2.000   3rd Qu.:30.00  
##  Max.   :3.000    Max.   :3.000   Max.   :2.000   Max.   :35.00  
##    AlcoholUse        Drinks         WeekdayBed     WeekdayRise    
##  Min.   :1.000   Min.   : 0.000   Min.   :21.80   Min.   : 5.500  
##  1st Qu.:2.000   1st Qu.: 3.000   1st Qu.:24.20   1st Qu.: 8.000  
##  Median :2.000   Median : 5.000   Median :24.80   Median : 8.500  
##  Mean   :2.534   Mean   : 5.569   Mean   :24.85   Mean   : 8.586  
##  3rd Qu.:3.000   3rd Qu.: 8.000   3rd Qu.:25.50   3rd Qu.: 9.150  
##  Max.   :4.000   Max.   :24.000   Max.   :29.10   Max.   :12.020  
##   WeekdaySleep      WeekendBed     WeekendRise     WeekendSleep   
##  Min.   : 3.000   Min.   :21.50   Min.   : 5.25   Min.   : 4.000  
##  1st Qu.: 7.200   1st Qu.:24.88   1st Qu.: 9.25   1st Qu.: 7.250  
##  Median : 7.950   Median :25.50   Median :10.25   Median : 8.250  
##  Mean   : 7.866   Mean   :25.58   Mean   :10.20   Mean   : 8.217  
##  3rd Qu.: 8.600   3rd Qu.:26.25   3rd Qu.:11.00   3rd Qu.: 9.250  
##  Max.   :10.970   Max.   :30.25   Max.   :15.00   Max.   :12.750  
##   AverageSleep      AllNighter    
##  Min.   : 4.950   Min.   :0.0000  
##  1st Qu.: 7.430   1st Qu.:0.0000  
##  Median : 8.000   Median :0.0000  
##  Mean   : 7.966   Mean   :0.1344  
##  3rd Qu.: 8.590   3rd Qu.:0.0000  
##  Max.   :10.620   Max.   :1.0000
```

```r
attach(sleepnew)
hist(CognitionZscore)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)

```r
boxplot(CognitionZscore,horizontal=T,xlab="CognitionZscore")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-2.png)

```r
#3outliers
boxplot(NumEarlyClass,horizontal=T,xlab="NumEarlyClass")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-3.png)

```r
hist(NumEarlyClass)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-4.png)

```r
#3 outliers
hist(PoorSleepQuality)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-5.png)

```r
boxplot(PoorSleepQuality,horizontal=T,xlab="PoorSleepQuality")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-6.png)

```r
summary(PoorSleepQuality)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   1.000   4.000   6.000   6.257   8.000  18.000
```

```r
boxplot(DepressionScore,horizontal=T,xlab="DepressionScore")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-7.png)

```r
summary(DepressionScore)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   0.000   1.000   3.000   5.202   7.000  35.000
```

```r
boxplot(StressScore, horizontal=T,xlab="StressScore")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-8.png)

```r
summary(StressScore)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   0.000   3.000   8.000   9.466  14.000  37.000
```

```r
#6outliers?
boxplot(Happiness,horizontal=T,xlab="Happiness")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-9.png)

```r
#2outliers?
boxplot(AlcoholUse,horizontal=T,xlab="AlcoholUse")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-10.png)

```r
#4 outliers
boxplot(AverageSleep,horizontal=T,xlab="AverageSleep")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-11.png)

```r
summary(AverageSleep)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   4.950   7.430   8.000   7.966   8.590  10.620
```

```r
#4outliers

boxplot(ClassesMissed,horizontal=T,xlab="ClassesMissed")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-12.png)

```r
detach(sleepnew)
```

#New data input after removing outliers

```r
sleep.out<-(read.csv("sleepnoout.csv", header = T))
```
The cook distance test relating to outlier removal is on Xingdian's place, I will ask him to add the code from that part.
##New model based on outlier-removed dataset

```r
out.1<-lm(CognitionZscore ~ Gender + EarlyClass + ClassesMissed + EarlyClass*ClassesMissed + DepressionScore + DepressionScoreSq , data=sleep.out)
summary(out.1)
```

```
## 
## Call:
## lm(formula = CognitionZscore ~ Gender + EarlyClass + ClassesMissed + 
##     EarlyClass * ClassesMissed + DepressionScore + DepressionScoreSq, 
##     data = sleep.out)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.60325 -0.44993 -0.02257  0.45127  1.55673 
## 
## Coefficients:
##                           Estimate Std. Error t value Pr(>|t|)   
## (Intercept)               0.125614   0.125125   1.004  0.31652   
## Gender                   -0.275341   0.092514  -2.976  0.00324 **
## EarlyClass                0.277653   0.118009   2.353  0.01951 * 
## ClassesMissed             0.033177   0.027889   1.190  0.23547   
## DepressionScore          -0.080969   0.034323  -2.359  0.01920 * 
## DepressionScoreSq         0.004946   0.002525   1.959  0.05140 . 
## EarlyClass:ClassesMissed -0.077856   0.034587  -2.251  0.02537 * 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.6641 on 220 degrees of freedom
## Multiple R-squared:  0.09861,	Adjusted R-squared:  0.07403 
## F-statistic: 4.011 on 6 and 220 DF,  p-value: 0.0007816
```

```r
#Interaction term includes EarlyClass*ClassesMissed, as more early class may results in more classes missed
```
Beware that for some reason this is a bit different from the one on the Google Docs. 

#Model with original dataset

```r
final.1<-lm(CognitionZscore ~ Gender + EarlyClass*ClassesMissed + DepressionScore + DepressionScoreSq, data=sleepnew)
summary(final.1)
```

```
## 
## Call:
## lm(formula = CognitionZscore ~ Gender + EarlyClass * ClassesMissed + 
##     DepressionScore + DepressionScoreSq, data = sleepnew)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.54055 -0.42698 -0.02081  0.45098  1.58354 
## 
## Coefficients:
##                            Estimate Std. Error t value Pr(>|t|)    
## (Intercept)               0.1328781  0.1140331   1.165 0.245043    
## Gender                   -0.3064042  0.0887468  -3.453 0.000654 ***
## EarlyClass                0.2435795  0.1105120   2.204 0.028444 *  
## ClassesMissed             0.0135694  0.0214241   0.633 0.527079    
## DepressionScore          -0.0448798  0.0185918  -2.414 0.016512 *  
## DepressionScoreSq         0.0018062  0.0007833   2.306 0.021950 *  
## EarlyClass:ClassesMissed -0.0630698  0.0272606  -2.314 0.021515 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.6744 on 246 degrees of freedom
## Multiple R-squared:  0.1114,	Adjusted R-squared:  0.08971 
## F-statistic: 5.139 on 6 and 246 DF,  p-value: 5.379e-05
```

# 3.28 Try the above model with AlcoholUse

```r
final.2<-lm(CognitionZscore ~ Gender + EarlyClass*ClassesMissed + DepressionScore + DepressionScoreSq + AlcoholUse, data=sleepnew)
summary(final.2)
```

```
## 
## Call:
## lm(formula = CognitionZscore ~ Gender + EarlyClass * ClassesMissed + 
##     DepressionScore + DepressionScoreSq + AlcoholUse, data = sleepnew)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.52327 -0.43769 -0.01859  0.43036  1.55786 
## 
## Coefficients:
##                            Estimate Std. Error t value Pr(>|t|)   
## (Intercept)              -0.0782263  0.1799831  -0.435  0.66421   
## Gender                   -0.2873538  0.0894056  -3.214  0.00148 **
## EarlyClass                0.2381302  0.1102821   2.159  0.03180 * 
## ClassesMissed             0.0135911  0.0213682   0.636  0.52534   
## DepressionScore          -0.0443125  0.0185471  -2.389  0.01764 * 
## DepressionScoreSq         0.0017742  0.0007816   2.270  0.02407 * 
## AlcoholUse                0.0807442  0.0533538   1.513  0.13147   
## EarlyClass:ClassesMissed -0.0619050  0.0272002  -2.276  0.02372 * 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.6726 on 245 degrees of freedom
## Multiple R-squared:  0.1196,	Adjusted R-squared:  0.09446 
## F-statistic: 4.755 on 7 and 245 DF,  p-value: 4.974e-05
```


#residual analysis

```r
pairs(sleep.out)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)

```r
pairs(sleepnew)
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png)

#Leverage - Hat values

#Influencence



