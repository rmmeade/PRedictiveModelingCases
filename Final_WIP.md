\#STA 380: Predictive Modeling II Case Studies

## By: Rachel Meade, Ian Hatfield, Curtis Krawczyk, LaShay Fontenot

## Green Buildings

Real estate investors and developers invest in green buildings, whether
they are LEED- or EnergyStar-certified with the hopes of being able to
generate additional revenues in rent, or (in cases in which utilities
are not reimbursed by tenants) to save enough money in utilities to
effectively generate higher profits by reducing utility expenses.
Although these hopes may be realized in individual cases, there is not
enough support in the Green Buildings dataset to conclude that investing
in a Green Building will typically generate higher rents or utilities
savings. In fact, based on some simple analysis, it appears that some
green buildings may even generate lower rents than similar non-green
buildings.

The previous analysis provided in the case study was flawed because it
looked only at green versus non-green buildings in aggregate. It
concluded that green buildings generated higher rents by comparing
median price per square foot of green and non-green buildings. This
analysis does not look at many other potential hidden variables that
could account for the difference in price, other than green
vs. non-green.

The graph below demonstrates that proportionally more green buildings
are Class A than non-green buildings.

![](Final_WIP_files/figure-gfm/unnamed-chunk-6-1.png)<!-- --> The
percentage of Class A green buildings is \~79.8%.

The percentage of Class A non-green buildings is \~37%.

The percentage of Class B green buildings is \~19.15%.

The percentage of Class B non-green buildings is \~48.5%.

The percentage of Class C green buildings is \~1%.

The percentage of Class C non-green buildings is \~14.5%.

Green buildings could generate higher rents overall not because they are
green, but because they are nicer buildings, on average. This analysis
suggests that green buildings could generate higher rents on average
because they are more likely to be Class A Buildings.

When the effects of building class and green vs. non-green are
separated, the conclusion that green buildings generate higher rents is
unsupported.

![](Final_WIP_files/figure-gfm/unnamed-chunk-7-1.png)<!-- --> The above
graph demonstrates that when separated by class, only Class C green
buildings generate higher rents than their non-green counterparts. This
supports the conclusion that the effect captured in the previous report
was actually related to having nicer buildings on average in the green
population, compared to the non-green population.

A multiple regression provides additional evidence to further separate
the effects of Building Class and Green status. As demonstrated by the
coefficients below, a Class A generates the greatest rent premiums,
followed by Class B buildings. Green buildings actually have a negative
relationship to price (although the statistical significance is less
certain than building class). This would suggest that green buildings
typically have lower rents than their non-green peers.

    ## 
    ## Call:
    ## lm(formula = Rent ~ class_a + class_b + green_rating, data = green)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -23.536  -8.947  -2.663   5.559 217.464 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)   23.9471     0.4416  54.228  < 2e-16 ***
    ## class_a        8.5888     0.5233  16.413  < 2e-16 ***
    ## class_b        2.4936     0.5050   4.938 8.06e-07 ***
    ## green_rating  -1.2576     0.6079  -2.069   0.0386 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 14.71 on 7890 degrees of freedom
    ## Multiple R-squared:  0.04798,    Adjusted R-squared:  0.04762 
    ## F-statistic: 132.5 on 3 and 7890 DF,  p-value: < 2.2e-16

This still leaves the question of lower utility expense. Based on a
little external research, a typical office building utilizes about 17.3
kilowatt hours per square foot per year. At 2.9 cents per kilowatt hour,
this is about 50 cents per square foot per year. Even if there was a 50%
savings in electricity expenses, this would not outweigh the
approximately two dollar difference in rent for Class A green
vs. non-green buildings. Gas expense savings were similarly negligible.

In conclusion, although there may still be moral and reputational
benefits to investing in green properties, there is insufficient
evidence to conclude that green buildings will result in better
financial investment returns. Instead of investing in green
certification, the developer may realize better returns by upgrading the
building’s class (e.g. from a Class B to a Class A building).

\#Fligths at Austin-Bergstrom Airport

The below plots are created by first subsetting the dataset to focus on
flights departing from the Austin airport. These destinations are then
plotted on a map of the US with the size of the marker reflecting the
amount of flights to that location. Markers are then colored based on
the average delay time of flights to those locations on a blue/red
scale. This final plot could be helpful for Austinites that travel
frequently and are curious about flight patterns for their destination.

``` r
#Plot USA map
usa_bb = c(-124.848974, 24.396308, -66.885444, 49.384358)
usa_map = ggmap(get_stamenmap(bbox=usa_bb, scale=2, zoom=5,
                              maptype = "terrain"), extent="normal")
```

    ## Source : http://tile.stamen.com/terrain/5/4/10.png

    ## Source : http://tile.stamen.com/terrain/5/5/10.png

    ## Source : http://tile.stamen.com/terrain/5/6/10.png

    ## Source : http://tile.stamen.com/terrain/5/7/10.png

    ## Source : http://tile.stamen.com/terrain/5/8/10.png

    ## Source : http://tile.stamen.com/terrain/5/9/10.png

    ## Source : http://tile.stamen.com/terrain/5/10/10.png

    ## Source : http://tile.stamen.com/terrain/5/4/11.png

    ## Source : http://tile.stamen.com/terrain/5/5/11.png

    ## Source : http://tile.stamen.com/terrain/5/6/11.png

    ## Source : http://tile.stamen.com/terrain/5/7/11.png

    ## Source : http://tile.stamen.com/terrain/5/8/11.png

    ## Source : http://tile.stamen.com/terrain/5/9/11.png

    ## Source : http://tile.stamen.com/terrain/5/10/11.png

    ## Source : http://tile.stamen.com/terrain/5/4/12.png

    ## Source : http://tile.stamen.com/terrain/5/5/12.png

    ## Source : http://tile.stamen.com/terrain/5/6/12.png

    ## Source : http://tile.stamen.com/terrain/5/7/12.png

    ## Source : http://tile.stamen.com/terrain/5/8/12.png

    ## Source : http://tile.stamen.com/terrain/5/9/12.png

    ## Source : http://tile.stamen.com/terrain/5/10/12.png

    ## Source : http://tile.stamen.com/terrain/5/4/13.png

    ## Source : http://tile.stamen.com/terrain/5/5/13.png

    ## Source : http://tile.stamen.com/terrain/5/6/13.png

    ## Source : http://tile.stamen.com/terrain/5/7/13.png

    ## Source : http://tile.stamen.com/terrain/5/8/13.png

    ## Source : http://tile.stamen.com/terrain/5/9/13.png

    ## Source : http://tile.stamen.com/terrain/5/10/13.png

``` r
#Layer AUS destinations with size as number of flights
#scale down circle sizes to fit on map
circle_scale_amt = 0.0035
#plot
usa_map + 
  geom_point(aes(x = dest_long, y = dest_lat),data=grouped, 
                          col= "orange",alpha=.6,size = grouped$count*circle_scale_amt)+
               scale_size_continuous(range=c(1,5573))
```

    ## Warning in min(x): no non-missing arguments to min; returning Inf

    ## Warning in max(x): no non-missing arguments to max; returning -Inf

![](Final_WIP_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->
![](Rplot%20map%20of%20aus%20flights.png)<!-- -->

``` r
#get delays
grouped2 = summarize(group_by(aus,Dest,dest_long,dest_lat), count= n(),
                     delay = mean(ArrDelay, na.rm = T))
grouped2$count = as.numeric(grouped2$count)
grouped2$dest_long = as.numeric(as.character(grouped2$dest_long))
grouped2$dest_lat = as.numeric(as.character(grouped2$dest_lat))

#scale delay so that all positive values (for graphing purposes)
grouped2$scdelay = as.numeric(rescale(grouped2$delay))
grouped2 = grouped2[-39,]

#build plot, where darker = higher avg delays
usa_map + 
  geom_point(aes(x = dest_long, y = dest_lat,col= grouped2$scdelay),data=grouped2, 
             alpha=.6,size = grouped2$count*circle_scale_amt)+
  scale_size_continuous(range=c(1,5573))+
  scale_color_gradient(low="blue",high="red",limits=c(0,.25)) +
  labs(title = "Flights and Delays out of AUS", 
       subtitle = "Flights out of AUS to US destinations, where the size reflects
       the # of flights, and the color reflects the mean delay",
       x= "Longitude",y="Latitude",colour="Mean Delay (scaled)")
```

    ## Warning in min(x): no non-missing arguments to min; returning Inf

    ## Warning in max(x): no non-missing arguments to max; returning -Inf

![](Final_WIP_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->
![](Rplot%20final%20map%20w%20titles.png)<!-- -->

In summary we see that flights from AUS to ATL are typically delayed
longer than flights to other locations. On the other hand, flights to
Miami are great (for more than one reason, I’d say). These results are
not incredibly surprising because ATL is a huge airport hosting
thousands of flights, and is more susceptible to regular and weather
delays than Miami. In addition, it is not surprising that a majority of
flights out of AUS are to Dallas and Houston - I would assume that this
is largely due to business travel.

# Portfolio Modeling

We will construct four portfolios of exchange-traded funds (ETFs) and
use bootstrap resampling to analyze the short-term tail risk of these
portfolios.

We will assume we have $100,000 in capital. We will construct portfolios
using between 3 and 10 ETFs, with different weights.

We will assume that the portfolios are rebalanced each day at zero
transaction cost.

First, we prepare to run the Monte Carlo simulations by calling the
necessary libraries, defining the ETFs we will use to build each
portfolio, and import 5 years of historical returns that we will draw
from in the simulations.

Adjust all ETFs and create a new object adding ‘a’ to the end.

Combine all the returns in a matrix.

Compute the returns from the closing prices
![](Final_WIP_files/figure-gfm/unnamed-chunk-18-1.png)<!-- --> Run the
Monte Carlo simulations to demonstrate many different possible
scenarios.

Histogram of the ending wealth amounts generated by the simulations.
![](Final_WIP_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->
Profit/loss

    ## [1] 100719.5

![](Final_WIP_files/figure-gfm/unnamed-chunk-21-1.png)<!-- --> Calculate
Value at Risk at the 5% level.

    ##        5% 
    ## -3710.869

We repeat the above process twice more with different portfolios. Since
we are using a subset of the same ETFs as the first example, we will
just adjust the weights of each ETF and re-run the simulations.

``` 
```

This portfolio focuses on the Tech Sector (30% weight on XLK -
Technology Select Secotr SPDR Fund) and drop COmmodity Index Fund (USCI)
& Bonds (BND).

![](Final_WIP_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->
Profit/loss

    ## [1] 101088.2

![](Final_WIP_files/figure-gfm/unnamed-chunk-24-1.png)<!-- --> 5% Value
at Risk

    ##       5% 
    ## -4735.94

Change weights to focus on Bonds, & Commodity Index and drop EUSA, VUG,
SPY, XLK, and PGX
![](Final_WIP_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->
Profit/loss

    ## [1] 100239.3

![](Final_WIP_files/figure-gfm/unnamed-chunk-27-1.png)<!-- --> 5% Value
at Risk

    ##       5% 
    ## -2246.98

Finally, we try to make a poorly diversified portfolio, leaving only
Commodities, Tech, and Insider Sentiment.
![](Final_WIP_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->
Profit/loss

    ## [1] 100642.3

![](Final_WIP_files/figure-gfm/unnamed-chunk-30-1.png)<!-- --> 5% Value
at Risk

    ##        5% 
    ## -4780.586

The first portfolio is the most diversified, which would suggest that it
would have a better sharpe ratio than some of the other portfolios we
constructed. We would expect it to have good returns compared to the
amount of value at risk. After running the Monte Carlo simulations, the
outcome matched expectations.

The second portfolio is more aggressive. It emphasizes the technology
sector, but it is still fairly diversified. Because it retains some
diversification and emphasizes an industry that has been strong in the
past few years, we would expect slightly higher returns than the highly
diverse portfolio above, but at the expense of greater value at risk.
Again, the simulations confirmed our expectations.

The third portfolio was intended to be low risk. 70% of the wealth is
invested in bonds and commodities, and includes smaller amounts of
preffered equities, the low volatility S\&P index, and insider
sentiment. As expected, this portfolio generated the lowest returns on
average, and had the lowest value at risk.

Finally, we attempted to construct a portfolio that was poorly
diversified, and therefore higher risk. It invests 40% in Commodities,
40% in Tech, and the remaining 20% in Insider Sentiment. As suspected,
it had the highest value at risk, but surprisingly, it was only slightly
higher than the technology portfolio. On average, it generated lower
returns than the technology portfolio. Therefore, as suspected, this
portfolio would likely be a poor investment choice.

It is important to note, however, that all of these results could be
impacted by only using the past five years’ history to draw from in the
Monte Carlo simulations. In the past five years (2014-2019), the market
has generally been bullish and market returns have been generally
positive. With uncertainty in the market growing and rumors of an
impending recession, the past five years of returns are not necessarily
indicative of the most probable future outcomes.

\#Market Segmentation

``` r
rm(list=ls())
df <- read.csv(file=".\\data\\social_marketing.csv", header=TRUE, sep=",")
library(ggplot2)
library(dplyr)
library(purrr)
library(factoextra)
```

    ## Warning: package 'factoextra' was built under R version 3.6.1

    ## Welcome! Related Books: `Practical Guide To Cluster Analysis in R` at https://goo.gl/13EFCZ

``` r
df=df[,-1]
```

In order to use k-means clustering on the twitter followers a value of k
needs to be chosen. The elbow plot below is somewhat ambiguous as to
where the elbow is, but a value of 7 was chosen for k.

    ## Warning: did not converge in 10 iterations

![](Final_WIP_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

    ## # A tibble: 7 x 37
    ##   Cluster chatter current_events travel photo_sharing uncategorized tv_film
    ##     <int>   <dbl>          <dbl>  <dbl>         <dbl>         <dbl>   <dbl>
    ## 1       1    4.06           1.68   6.50          2.26         0.731    1.17
    ## 2       2    4.00           1.72   1.46          6.01         1.21     1.01
    ## 3       3    3.53           1.64   1.21          2.09         0.720    1.02
    ## 4       4    4.04           1.54   1.32          2.43         0.960    1.04
    ## 5       5    4.11           1.43   1.52          2.65         0.846    1.44
    ## 6       6    2.93           1.36   1.12          1.51         0.718    1.04
    ## 7       7   10.00           1.85   1.20          5.68         0.902    1.06
    ## # ... with 30 more variables: sports_fandom <dbl>, politics <dbl>,
    ## #   food <dbl>, family <dbl>, home_and_garden <dbl>, music <dbl>,
    ## #   news <dbl>, online_gaming <dbl>, shopping <dbl>,
    ## #   health_nutrition <dbl>, college_uni <dbl>, sports_playing <dbl>,
    ## #   cooking <dbl>, eco <dbl>, computers <dbl>, business <dbl>,
    ## #   outdoors <dbl>, crafts <dbl>, automotive <dbl>, art <dbl>,
    ## #   religion <dbl>, beauty <dbl>, parenting <dbl>, dating <dbl>,
    ## #   school <dbl>, personal_fitness <dbl>, fashion <dbl>,
    ## #   small_business <dbl>, spam <dbl>, adult <dbl>

**Below we will examine the 7 customer segments that were identified
using k-means clustering:**

**Customer segment 1, Politics:**  
Looking at the mean values of customer segment 1 the categories that
stand out are Travel, Politics, and News. These categories depict a
customer base of individuals who follow world events and travel.

**Customer segment 2, Fashion:**  
Looking at the mean values of customer segment 2 the categories that
stand out are Photo Sharing, Music, Cooking, Beauty, and Fashion. These
categories depict a customer base of individuals interested in
fashion/beauty.

**Customer segment 3, Family:**  
Looking at the mean values of customer segment 3 the categories that
stand out are Sports Fandom, Food, Religion, Family and Parenting. These
categories depict a customer base of parents and family oriented
individuals.

**Customer segment 4, Health Conscious:**  
Looking at the mean values of customer segment 4 the categories that
stand out are Food, Health, Cooking, Outdoors, and Fitness. These
categories depict a customer base of health conscious individuals.

**Customer segment 5, College Students/Young Adults:**  
Looking at the mean values of customer segment 5 the categories that
stand out are tv/Film, online gaming, College/Uni, and Sports Playing.
These categories depict a customer base of college students/young
adults.

**Customer segment 6, N/A:**  
Looking at the mean values of customer segment 6 no categories standout.
This is a very uninterpretable customer segment and it is possible that
this segment is a collection of customers from many segments. For every
value of K, there was an uninterpretable segment.

**Customer segment 7, Pop Culture:**  
Looking at the mean values of customer segment 7 the categories that
stand out are Chatter, Current Events, Photo Sharing, and Shopping.
These categories depict a customer base of pop culture influenced
individuals.

\#Author Attribution

To start the analysis of author attribution we created readerPlain, this
wraps another function around readPlain to read plain text documents in
English. Using readerPlain, the train .txt files and test .txt files are
read in and stored in corresponding large lists. Making the large lists
vectors, two separate corpora are made, one for train and one for test.
Next is pre-processing, the pre-processing/tokenization steps are as
follows, make everything lower case, remove numbers, remove punctuation,
remove excess white-space, and remove stop words, ‘en’. Having processed
both corpus’, document term matrices were created and words that
appeared in \<90% of documents were removed. Using the DTMs, TFIDF
matrices were created and saved as train and test. The TFIDF matrices
were converted to data frames and an empty author column was created,
the author column was then populated using a for loop that assigned a
unique author id to each document. The author columns were then changed
to be type ‘factor’. At this point, the pre-model processing has been
completed and we now will prepare the data for a naive bayes model. A X
train matrix and X test matrix were created using all predictors from
the corresponding matrices and a y train and Y test list were created
from the author columns of the corresponding matrices. There are columns
in X train that do not appear in X test, these columns were ignored. A
naive bayes model was then fit using X train and the model was used to
predict X test. The results were then put into a confusion matrix where
the accuracy of the model was seen to be
    36%.

    ## Warning: predict.naive_bayes(): Only 742 feature(s) out of 801 defined in the naive_bayes object "naive.fit" are used for prediction.

    ## Warning: predict.naive_bayes(): More features in the newdata are provided
    ## as there are probability tables in the object. Calculation is performed
    ## based on features to be found in the tables.

    ## Confusion Matrix and Statistics
    ## 
    ##              Y_Test
    ## naive_predict  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
    ##            1  24  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
    ##            2   0  9  0  0  0  0  0  0  0  0  0  0  0  0  1  0  0  1  0  0
    ##            3   1  0 26  0  6  0  2  0  8  0  1  0  1  0  0  1  4  1  4 11
    ##            4   0  0  0  2  0  0  0  0  0  0  0  0  2  7  0  0  0  1  0  0
    ##            5   0  0  0  0 15  0  0  0  0  0  0  0  0  0  1  0  2  0  0  0
    ##            6   1  1  0  0  0 26  2  6  0  2  0  0  0  0  0  0  0  1  0  0
    ##            7   0  0  1  0  7  0  4  2  0  1  2  0  3  0  0  0  1  0  0  0
    ##            8   0  0  0  0  0  0  0  3  0  0  0  0  0  0  0  0  0  0  0  0
    ##            9   0  0  0  0  0  1  0  1 12  0  0  0  0  0  1  0  1  1  2  0
    ##            10  1  0  0  0  0  0  0  0  0 27  1  0  0  0  0  0  0  0  0  0
    ##            11  1  0  0  0  0  0  0  0  0  0 35  0  0  0  0  0  0  0  0  0
    ##            12  0  7  0  3  1  0  0  0  0  0  1 23  0  0  1  0  0  1  0  0
    ##            13  0  1  0  0  0  1  7  0  0  0  0  0 10  0  0  0  0  0  0  0
    ##            14  0  4  0 12  0  0  2  1  0  1  0  4  4 11  2  2  0  2  0  0
    ##            15  0  9  0  0  0  0  0  0  0  0  0  0  2  0 13  0  0  4  0  0
    ##            16  0  0  0  0  1  0  0  0  0  0  0  0  0  0  1 24  0  0  0  0
    ##            17  1  2 11  0  1  0  3  1  2  0  1  0  1  0  3  1 22  0  3  2
    ##            18  0  1  0  0  0  0  0  0  0  0  0  0  1  0  2  0  0 12  0  0
    ##            19  0  1  1  0  1  0  0  0  1  0  0  0  0  0  0  1  0  0 18  5
    ##            20  0  0  0  0  0  0  0  0  2  0  0  0  0  0  0  0  1  0  0 21
    ##            21  3  0  0  2  0  0  3  0  0  0  0  0  3  0  3  0  0  2  0  0
    ##            22  0  0  0  0  2  0  2  0  1  2  0  0  0  0  0  0  0  1  2  0
    ##            23  0  0  0  0  0  5  0  3  0  1  0  0  2  0  0  0  0  0  0  0
    ##            24  0  1  1  0  1  0  2  0  2  0  0  0  1  0  0  1  2  0  1  0
    ##            25  1  3  1  0  2  1  1  0  4  2  0  0  0  0  1  4  5  0  5  1
    ##            26  0  0  0  0  0  0  0  2  0  0  0  0  0  0  0  0  0  0  0  0
    ##            27  1  0  0  0  0  0  2  1  0  0  0  0  0  0  0  0  0  0  0  0
    ##            28  0  0  0  0  0  0  0  0  0  0  0  0  1  1  0  0  0  0  0  0
    ##            29  0  6  0  0  2  0  0  0  0  0  1  0  3  0  5  0  0  0  0  0
    ##            30  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0
    ##            31  0  0  0  0  3  0  1  0  3  0  1  0  0  0  0  0  2  0  1  0
    ##            32  0  0  0  0  0  3  0  2  0  2  0  0  0  0  1  0  0  0  2  0
    ##            33  1  1  0  0  0  0  0  0  2  0  0  1  0  0  1  1  0  0  1  0
    ##            34  1  0  0  0  0  0  0  0  1  0  0  0  1  0  2  1  0  0  0  0
    ##            35  0  0  0  7  0  0  0  0  0  0  0  1  5  7  0  2  0  4  0  0
    ##            36  1  0  0  0  0  1  2  1  0  3  0  0  0  0  0  0  0  0  0  0
    ##            37  2  0  0  0  0  3  5  9  0  0  1  0  0  0  0  0  0  0  0  0
    ##            38  1  0  0  3  0  0  0  0  0  0  0  1  0  2  0  0  0  0  0  0
    ##            39  2  0  0  0  1  0  0  1  0  0  1  0  0  0  1  2  0  2  0  1
    ##            40  0  0  0  0  0  1  0  3  0  0  0  0  0  0  0  0  0  0  0  0
    ##            41  0  0  0  0  0  0  0  0  4  1  0  0  0  0  0  0  0  0  0  0
    ##            42  1  0  1  0  0  1  5  2  0  6  1  0  1  0  0  1  0  0  0  1
    ##            43  4  4  0  0  5  0  5  0  1  0  1 11  1  2  2  5  1  2  1  0
    ##            44  0  0  0 12  0  0  0  1  0  0  0  3  2 13  6  0  0  9  0  0
    ##            45  0  0  8  0  0  1  0  0  4  0  0  0  1  0  0  0  9  0  6  1
    ##            46  1  0  0  3  0  0  0  0  0  0  0  0  1  2  0  3  0  1  0  0
    ##            47  0  0  0  0  0  4  0  0  0  1  0  0  0  0  0  0  0  0  0  0
    ##            48  0  0  0  0  1  0  0  1  3  0  0  0  2  0  0  1  0  1  4  7
    ##            49  1  0  0  0  0  2  2 10  0  1  0  0  0  0  0  0  0  0  0  0
    ##            50  1  0  0  6  0  0  0  0  0  0  2  6  2  5  3  0  0  4  0  0
    ##              Y_Test
    ## naive_predict 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40
    ##            1   0  0  1  2  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
    ##            2   0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0
    ##            3   3  5  1  3  7  0  0  0  0  0  2  0  0  1  0  0  1  0  3  2
    ##            4   0  0  0  0  0  0  0  0  0  0  0  0  0  0  2  0  0  0  0  0
    ##            5   0  2  0  3  0  0  0  0  0  0  1  0  0  1  0  0  0  0  2  0
    ##            6   0  0  8  2  0  2  1  0  0  1  0  6  0  1  1  2  4  0  0  4
    ##            7   0  0  2  2  0  2  7  0  0  1  1  0  0  0  0  0  0  0  0  1
    ##            8   0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
    ##            9   0  1  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0
    ##            10  0  0  1  0  0  9  3  0  0  0  0  7  0  2  0  5  0  0  1  2
    ##            11  0  0  0  1  0  0  1  0  2  0  1  0  0  0  0  0  0  0  2  0
    ##            12  0  0  0  0  0  0  0  2  1  0  0  0  0  0  0  0  0  0  0  0
    ##            13  1  0  0  1  0  0  1  1  0  0  0  0  0  3  0  0  0  0  0  0
    ##            14 11  0  0  0  0  0  0  3  1  0  1  2  3  0 17  0  0  4  1  0
    ##            15  1  0  0  0  0  0  0  0  0  0  2  0  0  0  1  0  0  0  0  0
    ##            16  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
    ##            17  1  3  0  0  0  0  0  0  1  3  1  0  2  4  0  0  0  0  4  0
    ##            18  0  0  0  0  0  0  1  0  0  2  0  0  1  0  0  0  0  0  0  0
    ##            19  0  1  0  0  0  0  0  0  0  2  0  1  0  0  0  0  0  0  1  0
    ##            20  0  6  0  0  3  0  0  0  0  0  0  0  0  0  0  0  2  0  0  1
    ##            21 16  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0
    ##            22  0 20  0  1  4  0  0  0  0  3  1  1  0  1  0  1  1  0  0  0
    ##            23  0  0 13  1  1  2  1  0  1  0  1  2  0  3  0  0  8  0  0  1
    ##            24  0  0  0 12  0  0  1  0  0  0  6  0  0  0  0  0  0  0  3  1
    ##            25  0  4  1  3 25  1  1  0  0  2  0  0  0  1  0  4  3  0  1  5
    ##            26  0  0  0  0  0 13  0  0  0  0  0  1  0  0  0  0  3  0  0  0
    ##            27  0  0  0  0  0  0 26  0  0  0  0  0  0  0  0  0  0  0  0  0
    ##            28  0  0  0  1  0  0  0 32  0  0  0  0  1  0  1  0  0  0  0  0
    ##            29  2  0  0  0  0  0  0  0 34  0  2  0  5  0  1  0  0  0  1  1
    ##            30  0  0  0  0  0  0  0  0  0 19  0  0  0  2  0  1  0  0 11  0
    ##            31  0  0  0  2  0  0  0  0  2  1 16  0  1  1  0  0  0  0  0  0
    ##            32  0  0  4  0  0  4  2  0  0  1  0 13  0  1  0  1  1  0  0  0
    ##            33  2  0  0  2  0  0  0  0  1  0  0  0 33  0  0  0  0  0  1  0
    ##            34  0  0  0  1  0  1  1  0  0  1  4  0  0 18  0  0  3  0  0  0
    ##            35  2  0  0  0  0  0  0  1  0  2  2  0  1  0  6  0  0  4  0  0
    ##            36  0  2  3  1  2  0  0  0  0  0  1  2  0  1  0 25  1  0  0  0
    ##            37  0  0  3  0  0  2  0  1  0  0  0  5  0  1  0  0 15  0  1  7
    ##            38  2  0  0  0  0  0  0  0  0  0  0  0  0  0  3  0  0 14  0  0
    ##            39  0  0  0  0  3  0  0  0  2  7  1  0  0  0  0  0  0  0 14  0
    ##            40  0  0  1  0  0  0  0  0  0  0  0  0  0  1  0  0  1  0  0 21
    ##            41  0  0  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0
    ##            42  0  0  6  1  2  4  1  0  0  2  0  7  0  3  0  5  2  0  1  0
    ##            43  1  2  1  1  0  0  1  6  1  0  4  0  0  0  0  0  0  9  1  0
    ##            44  6  0  0  3  0  0  0  1  3  0  0  0  1  1  7  0  0  5  0  0
    ##            45  0  3  1  1  1  0  0  0  0  0  1  0  0  1  0  0  1  0  0  1
    ##            46  1  0  0  0  0  0  0  3  0  0  0  0  1  0  5  0  0 13  0  1
    ##            47  0  0  3  0  0 10  1  0  0  1  0  2  0  0  0  5  4  0  0  0
    ##            48  0  1  0  4  1  0  0  0  0  0  0  0  0  0  0  0  0  0  2  0
    ##            49  0  0  1  0  0  0  1  0  0  0  1  1  0  0  0  0  0  0  0  2
    ##            50  1  0  0  2  0  0  0  0  1  1  0  0  1  2  6  0  0  1  0  0
    ##              Y_Test
    ## naive_predict 41 42 43 44 45 46 47 48 49 50
    ##            1   4  0  0  0  0  0  1  1  2  0
    ##            2   0  0  0  0  1  0  0  0  0  0
    ##            3   5  2  1  0 16  2  1  3  1  0
    ##            4   0  0  1  1  0  0  0  0  0  3
    ##            5   0  0  0  0  0  0  0  3  0  0
    ##            6   0  2  0  0  0  0  2  0  1  0
    ##            7   0  0  0  0  0  0  0  1  2  0
    ##            8   0  0  0  0  0  0  0  0  7  0
    ##            9   0  0  0  0  0  0  0  2  0  0
    ##            10  0  5  0  0  0  0 11  0  0  0
    ##            11  0  0  0  0  0  0  0  0  0  1
    ##            12  0  0  2  3  0  0  0  0  0  0
    ##            13  0  0  0  0  0  0  0  0  2  0
    ##            14  3  0  4 16  0  3  0  0  0  7
    ##            15  0  0  0  0  0  0  0  0  0  0
    ##            16  0  0  1  0  0  0  0  2  0  0
    ##            17  0  0  0  0  5  0  0  0  0  0
    ##            18  0  0  0  0  0  0  0  0  0  0
    ##            19  0  0  0  0  0  0  0  6  0  0
    ##            20  0  0  0  0  0  0  0  1  0  0
    ##            21  0  0  0  1  0  0  0  0  3  0
    ##            22  0  0  0  0  0  0  0  0  0  0
    ##            23  0  1  0  0  0  0  2  0  1  0
    ##            24  0  0  0  0  0  1  0  3  0  0
    ##            25  1  4  0  0  0  1  0  2  1  0
    ##            26  0  1  0  0  0  0  1  0  0  0
    ##            27  0  0  0  0  0  0  0  0  0  0
    ##            28  0  0  0  1  0  0  0  0  0  1
    ##            29  0  0  0  0  1  0  0  0  1  0
    ##            30  0  0  0  0  0  0  0  0  0  0
    ##            31  0  0  0  0  0  0  0  1  0  0
    ##            32  0  3  0  0  0  0  1  0  2  0
    ##            33  0  0  0  0  0  0  0  0  0  0
    ##            34  3  0  0  0  0  0  1  0  1  0
    ##            35  0  0  2  6  0  4  1  0  0  5
    ##            36  5  0  0  0  0  0  1  0  0  0
    ##            37  0  0  0  0  0  0  0  0  3  0
    ##            38  2  0  6  2  0  7  0  0  0  0
    ##            39  0  0  0  0  0  0  0  1  0  0
    ##            40  0  0  0  0  0  0  0  0  0  0
    ##            41 18  0  0  0  0  0  2  0  0  0
    ##            42  0 23  0  0  0  0 12  0  5  0
    ##            43  1  0 26  0  0 11  0  1  0  4
    ##            44  2  0  1 10  0  3  0  0  3 11
    ##            45  0  0  1  0 24  0  0  5  0  0
    ##            46  0  1  4  7  2 18  0  1  0  2
    ##            47  0  7  0  0  0  0 14  0  1  0
    ##            48  0  0  0  0  1  0  0 17  1  0
    ##            49  0  1  0  0  0  0  0  0 13  0
    ##            50  6  0  1  3  0  0  0  0  0 16
    ## 
    ## Overall Statistics
    ##                                           
    ##                Accuracy : 0.3604          
    ##                  95% CI : (0.3416, 0.3796)
    ##     No Information Rate : 0.02            
    ##     P-Value [Acc > NIR] : < 2.2e-16       
    ##                                           
    ##                   Kappa : 0.3473          
    ##                                           
    ##  Mcnemar's Test P-Value : NA              
    ## 
    ## Statistics by Class:
    ## 
    ##                      Class: 1 Class: 2 Class: 3 Class: 4 Class: 5 Class: 6
    ## Sensitivity            0.4800   0.1800   0.5200   0.0400   0.3000   0.5200
    ## Specificity            0.9947   0.9984   0.9596   0.9931   0.9939   0.9796
    ## Pos Pred Value         0.6486   0.6923   0.2080   0.1053   0.5000   0.3421
    ## Neg Pred Value         0.9894   0.9835   0.9899   0.9807   0.9858   0.9901
    ## Prevalence             0.0200   0.0200   0.0200   0.0200   0.0200   0.0200
    ## Detection Rate         0.0096   0.0036   0.0104   0.0008   0.0060   0.0104
    ## Detection Prevalence   0.0148   0.0052   0.0500   0.0076   0.0120   0.0304
    ## Balanced Accuracy      0.7373   0.5892   0.7398   0.5165   0.6469   0.7498
    ##                      Class: 7 Class: 8 Class: 9 Class: 10 Class: 11
    ## Sensitivity            0.0800   0.0600   0.2400    0.5400    0.7000
    ## Specificity            0.9853   0.9971   0.9955    0.9804    0.9963
    ## Pos Pred Value         0.1000   0.3000   0.5217    0.3600    0.7955
    ## Neg Pred Value         0.9813   0.9811   0.9847    0.9905    0.9939
    ## Prevalence             0.0200   0.0200   0.0200    0.0200    0.0200
    ## Detection Rate         0.0016   0.0012   0.0048    0.0108    0.0140
    ## Detection Prevalence   0.0160   0.0040   0.0092    0.0300    0.0176
    ## Balanced Accuracy      0.5327   0.5286   0.6178    0.7602    0.8482
    ##                      Class: 12 Class: 13 Class: 14 Class: 15 Class: 16
    ## Sensitivity             0.4600    0.2000   0.22000    0.2600    0.4800
    ## Specificity             0.9910    0.9927   0.95510    0.9922    0.9980
    ## Pos Pred Value          0.5111    0.3571   0.09091    0.4063    0.8276
    ## Neg Pred Value          0.9890    0.9838   0.98361    0.9850    0.9895
    ## Prevalence              0.0200    0.0200   0.02000    0.0200    0.0200
    ## Detection Rate          0.0092    0.0040   0.00440    0.0052    0.0096
    ## Detection Prevalence    0.0180    0.0112   0.04840    0.0128    0.0116
    ## Balanced Accuracy       0.7255    0.5963   0.58755    0.6261    0.7390
    ##                      Class: 17 Class: 18 Class: 19 Class: 20 Class: 21
    ## Sensitivity             0.4400    0.2400    0.3600    0.4200    0.3200
    ## Specificity             0.9771    0.9967    0.9914    0.9935    0.9914
    ## Pos Pred Value          0.2821    0.6000    0.4615    0.5676    0.4324
    ## Neg Pred Value          0.9884    0.9847    0.9870    0.9882    0.9862
    ## Prevalence              0.0200    0.0200    0.0200    0.0200    0.0200
    ## Detection Rate          0.0088    0.0048    0.0072    0.0084    0.0064
    ## Detection Prevalence    0.0312    0.0080    0.0156    0.0148    0.0148
    ## Balanced Accuracy       0.7086    0.6184    0.6757    0.7067    0.6557
    ##                      Class: 22 Class: 23 Class: 24 Class: 25 Class: 26
    ## Sensitivity             0.4000    0.2600    0.2400    0.5000    0.2600
    ## Specificity             0.9906    0.9853    0.9890    0.9731    0.9967
    ## Pos Pred Value          0.4651    0.2653    0.3077    0.2747    0.6190
    ## Neg Pred Value          0.9878    0.9849    0.9846    0.9896    0.9851
    ## Prevalence              0.0200    0.0200    0.0200    0.0200    0.0200
    ## Detection Rate          0.0080    0.0052    0.0048    0.0100    0.0052
    ## Detection Prevalence    0.0172    0.0196    0.0156    0.0364    0.0084
    ## Balanced Accuracy       0.6953    0.6227    0.6145    0.7365    0.6284
    ##                      Class: 27 Class: 28 Class: 29 Class: 30 Class: 31
    ## Sensitivity             0.5200    0.6400    0.6800    0.3800    0.3200
    ## Specificity             0.9984    0.9971    0.9873    0.9939    0.9922
    ## Pos Pred Value          0.8667    0.8205    0.5231    0.5588    0.4571
    ## Neg Pred Value          0.9903    0.9927    0.9934    0.9874    0.9862
    ## Prevalence              0.0200    0.0200    0.0200    0.0200    0.0200
    ## Detection Rate          0.0104    0.0128    0.0136    0.0076    0.0064
    ## Detection Prevalence    0.0120    0.0156    0.0260    0.0136    0.0140
    ## Balanced Accuracy       0.7592    0.8186    0.8337    0.6869    0.6561
    ##                      Class: 32 Class: 33 Class: 34 Class: 35 Class: 36
    ## Sensitivity             0.2600    0.6600    0.3600   0.12000    0.5000
    ## Specificity             0.9878    0.9943    0.9910   0.97714    0.9890
    ## Pos Pred Value          0.3023    0.7021    0.4500   0.09677    0.4808
    ## Neg Pred Value          0.9849    0.9931    0.9870   0.98195    0.9898
    ## Prevalence              0.0200    0.0200    0.0200   0.02000    0.0200
    ## Detection Rate          0.0052    0.0132    0.0072   0.00240    0.0100
    ## Detection Prevalence    0.0172    0.0188    0.0160   0.02480    0.0208
    ## Balanced Accuracy       0.6239    0.8271    0.6755   0.54857    0.7445
    ##                      Class: 37 Class: 38 Class: 39 Class: 40 Class: 41
    ## Sensitivity             0.3000    0.2800    0.2800    0.4200    0.3600
    ## Specificity             0.9824    0.9882    0.9898    0.9971    0.9967
    ## Pos Pred Value          0.2586    0.3256    0.3590    0.7500    0.6923
    ## Neg Pred Value          0.9857    0.9853    0.9854    0.9883    0.9871
    ## Prevalence              0.0200    0.0200    0.0200    0.0200    0.0200
    ## Detection Rate          0.0060    0.0056    0.0056    0.0084    0.0072
    ## Detection Prevalence    0.0232    0.0172    0.0156    0.0112    0.0104
    ## Balanced Accuracy       0.6412    0.6341    0.6349    0.7086    0.6784
    ##                      Class: 42 Class: 43 Class: 44 Class: 45 Class: 46
    ## Sensitivity             0.4600    0.5200   0.20000    0.4800    0.3600
    ## Specificity             0.9710    0.9637   0.96204    0.9812    0.9788
    ## Pos Pred Value          0.2447    0.2261   0.09709    0.3429    0.2571
    ## Neg Pred Value          0.9888    0.9899   0.98331    0.9893    0.9868
    ## Prevalence              0.0200    0.0200   0.02000    0.0200    0.0200
    ## Detection Rate          0.0092    0.0104   0.00400    0.0096    0.0072
    ## Detection Prevalence    0.0376    0.0460   0.04120    0.0280    0.0280
    ## Balanced Accuracy       0.7155    0.7418   0.58102    0.7306    0.6694
    ##                      Class: 47 Class: 48 Class: 49 Class: 50
    ## Sensitivity             0.2800    0.3400    0.2600    0.3200
    ## Specificity             0.9841    0.9878    0.9906    0.9780
    ## Pos Pred Value          0.2642    0.3617    0.3611    0.2286
    ## Neg Pred Value          0.9853    0.9865    0.9850    0.9860
    ## Prevalence              0.0200    0.0200    0.0200    0.0200
    ## Detection Rate          0.0056    0.0068    0.0052    0.0064
    ## Detection Prevalence    0.0212    0.0188    0.0144    0.0280
    ## Balanced Accuracy       0.6320    0.6639    0.6253    0.6490

\#Association Rules

    ## transactions as itemMatrix in sparse format with
    ##  9835 rows (elements/itemsets/transactions) and
    ##  169 columns (items) and a density of 0.02609146 
    ## 
    ## most frequent items:
    ##       whole milk other vegetables       rolls/buns             soda 
    ##             2513             1903             1809             1715 
    ##           yogurt          (Other) 
    ##             1372            34055 
    ## 
    ## element (itemset/transaction) length distribution:
    ## sizes
    ##    1    2    3    4    5    6    7    8    9   10   11   12   13   14   15 
    ## 2159 1643 1299 1005  855  645  545  438  350  246  182  117   78   77   55 
    ##   16   17   18   19   20   21   22   23   24   26   27   28   29   32 
    ##   46   29   14   14    9   11    4    6    1    1    1    1    3    1 
    ## 
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   1.000   2.000   3.000   4.409   6.000  32.000 
    ## 
    ## includes extended item information - examples:
    ##             labels
    ## 1 abrasive cleaner
    ## 2 artif. sweetener
    ## 3   baby cosmetics

![](Final_WIP_files/figure-gfm/unnamed-chunk-48-1.png)<!-- -->

The final thresholds we selected were support=.005, confidence=.2, and
maxlen=5. These were selected by trying out various combinations of the
three and inspecting the results (code not included). We selected our
final thresholds due to the reasonable amount of rules produced (873)
compared to other combos that produced upwards of 1500 rules. Subsets of
873 rules also produced actionable insights for a grocer.

    ## Apriori
    ## 
    ## Parameter specification:
    ##  confidence minval smax arem  aval originalSupport maxtime support minlen
    ##         0.2    0.1    1 none FALSE            TRUE       5   0.005      1
    ##  maxlen target   ext
    ##       5  rules FALSE
    ## 
    ## Algorithmic control:
    ##  filter tree heap memopt load sort verbose
    ##     0.1 TRUE TRUE  FALSE TRUE    2    TRUE
    ## 
    ## Absolute minimum support count: 49 
    ## 
    ## set item appearances ...[0 item(s)] done [0.00s].
    ## set transactions ...[169 item(s), 9835 transaction(s)] done [0.00s].
    ## sorting and recoding items ... [120 item(s)] done [0.00s].
    ## creating transaction tree ... done [0.00s].
    ## checking subsets of size 1 2 3 4 done [0.00s].
    ## writing ... [873 rule(s)] done [0.00s].
    ## creating S4 object  ... done [0.00s].

    ## set of 873 rules
    ## 
    ## rule length distribution (lhs + rhs):sizes
    ##   1   2   3   4 
    ##   1 265 559  48 
    ## 
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   1.000   2.000   3.000   2.749   3.000   4.000 
    ## 
    ## summary of quality measures:
    ##     support           confidence          lift            count       
    ##  Min.   :0.005084   Min.   :0.2000   Min.   :0.8991   Min.   :  50.0  
    ##  1st Qu.:0.005796   1st Qu.:0.2517   1st Qu.:1.5570   1st Qu.:  57.0  
    ##  Median :0.007219   Median :0.3156   Median :1.9415   Median :  71.0  
    ##  Mean   :0.010254   Mean   :0.3459   Mean   :2.0134   Mean   : 100.9  
    ##  3rd Qu.:0.010269   3rd Qu.:0.4249   3rd Qu.:2.3571   3rd Qu.: 101.0  
    ##  Max.   :0.255516   Max.   :0.7000   Max.   :4.0855   Max.   :2513.0  
    ## 
    ## mining info:
    ##  data ntransactions support confidence
    ##  groc          9835   0.005        0.2

    ## Number of Rules 873

    ##      lhs                        rhs                         support confidence     lift count
    ## [1]  {herbs}                 => {root vegetables}       0.007015760  0.4312500 3.956477    69
    ## [2]  {sliced cheese}         => {sausage}               0.007015760  0.2863071 3.047435    69
    ## [3]  {berries}               => {whipped/sour cream}    0.009049314  0.2721713 3.796886    89
    ## [4]  {beef}                  => {root vegetables}       0.017386884  0.3313953 3.040367   171
    ## [5]  {onions,                                                                                
    ##       root vegetables}       => {other vegetables}      0.005693950  0.6021505 3.112008    56
    ## [6]  {onions,                                                                                
    ##       other vegetables}      => {root vegetables}       0.005693950  0.4000000 3.669776    56
    ## [7]  {chicken,                                                                               
    ##       whole milk}            => {root vegetables}       0.005998983  0.3410405 3.128855    59
    ## [8]  {frozen vegetables,                                                                     
    ##       other vegetables}      => {root vegetables}       0.006100661  0.3428571 3.145522    60
    ## [9]  {beef,                                                                                  
    ##       other vegetables}      => {root vegetables}       0.007930859  0.4020619 3.688692    78
    ## [10] {beef,                                                                                  
    ##       whole milk}            => {root vegetables}       0.008032537  0.3779904 3.467851    79
    ## [11] {curd,                                                                                  
    ##       whole milk}            => {whipped/sour cream}    0.005897306  0.2256809 3.148329    58
    ## [12] {curd,                                                                                  
    ##       tropical fruit}        => {yogurt}                0.005287239  0.5148515 3.690645    52
    ## [13] {margarine,                                                                             
    ##       whole milk}            => {domestic eggs}         0.005185562  0.2142857 3.377404    51
    ## [14] {butter,                                                                                
    ##       whole milk}            => {domestic eggs}         0.005998983  0.2177122 3.431409    59
    ## [15] {domestic eggs,                                                                         
    ##       whole milk}            => {butter}                0.005998983  0.2000000 3.609174    59
    ## [16] {butter,                                                                                
    ##       other vegetables}      => {whipped/sour cream}    0.005795628  0.2893401 4.036397    57
    ## [17] {other vegetables,                                                                      
    ##       whipped/sour cream}    => {butter}                0.005795628  0.2007042 3.621883    57
    ## [18] {butter,                                                                                
    ##       whole milk}            => {whipped/sour cream}    0.006710727  0.2435424 3.397503    66
    ## [19] {whipped/sour cream,                                                                    
    ##       whole milk}            => {butter}                0.006710727  0.2082019 3.757185    66
    ## [20] {butter,                                                                                
    ##       other vegetables}      => {root vegetables}       0.006609049  0.3299492 3.027100    65
    ## [21] {domestic eggs,                                                                         
    ##       other vegetables}      => {whipped/sour cream}    0.005083884  0.2283105 3.185012    50
    ## [22] {domestic eggs,                                                                         
    ##       other vegetables}      => {root vegetables}       0.007320793  0.3287671 3.016254    72
    ## [23] {pip fruit,                                                                             
    ##       whipped/sour cream}    => {other vegetables}      0.005592272  0.6043956 3.123610    55
    ## [24] {tropical fruit,                                                                        
    ##       whipped/sour cream}    => {yogurt}                0.006202339  0.4485294 3.215224    61
    ## [25] {other vegetables,                                                                      
    ##       tropical fruit}        => {whipped/sour cream}    0.007829181  0.2181303 3.042995    77
    ## [26] {root vegetables,                                                                       
    ##       yogurt}                => {whipped/sour cream}    0.006405694  0.2480315 3.460127    63
    ## [27] {other vegetables,                                                                      
    ##       yogurt}                => {whipped/sour cream}    0.010167768  0.2341920 3.267062   100
    ## [28] {citrus fruit,                                                                          
    ##       pip fruit}             => {tropical fruit}        0.005592272  0.4044118 3.854060    55
    ## [29] {pip fruit,                                                                             
    ##       tropical fruit}        => {citrus fruit}          0.005592272  0.2736318 3.306105    55
    ## [30] {citrus fruit,                                                                          
    ##       tropical fruit}        => {pip fruit}             0.005592272  0.2806122 3.709437    55
    ## [31] {pip fruit,                                                                             
    ##       root vegetables}       => {tropical fruit}        0.005287239  0.3398693 3.238967    52
    ## [32] {root vegetables,                                                                       
    ##       tropical fruit}        => {pip fruit}             0.005287239  0.2512077 3.320737    52
    ## [33] {pip fruit,                                                                             
    ##       yogurt}                => {tropical fruit}        0.006405694  0.3559322 3.392048    63
    ## [34] {other vegetables,                                                                      
    ##       pip fruit}             => {tropical fruit}        0.009456024  0.3618677 3.448613    93
    ## [35] {other vegetables,                                                                      
    ##       tropical fruit}        => {pip fruit}             0.009456024  0.2634561 3.482649    93
    ## [36] {citrus fruit,                                                                          
    ##       root vegetables}       => {tropical fruit}        0.005693950  0.3218391 3.067139    56
    ## [37] {root vegetables,                                                                       
    ##       tropical fruit}        => {citrus fruit}          0.005693950  0.2705314 3.268644    56
    ## [38] {other vegetables,                                                                      
    ##       tropical fruit}        => {citrus fruit}          0.009049314  0.2521246 3.046248    89
    ## [39] {citrus fruit,                                                                          
    ##       root vegetables}       => {other vegetables}      0.010371124  0.5862069 3.029608   102
    ## [40] {citrus fruit,                                                                          
    ##       other vegetables}      => {root vegetables}       0.010371124  0.3591549 3.295045   102
    ## [41] {rolls/buns,                                                                            
    ##       shopping bags}         => {sausage}               0.005998983  0.3072917 3.270794    59
    ## [42] {root vegetables,                                                                       
    ##       yogurt}                => {tropical fruit}        0.008134215  0.3149606 3.001587    80
    ## [43] {root vegetables,                                                                       
    ##       tropical fruit}        => {other vegetables}      0.012302999  0.5845411 3.020999   121
    ## [44] {other vegetables,                                                                      
    ##       tropical fruit}        => {root vegetables}       0.012302999  0.3427762 3.144780   121
    ## [45] {fruit/vegetable juice,                                                                 
    ##       other vegetables,                                                                      
    ##       whole milk}            => {yogurt}                0.005083884  0.4854369 3.479790    50
    ## [46] {other vegetables,                                                                      
    ##       whole milk,                                                                            
    ##       yogurt}                => {fruit/vegetable juice} 0.005083884  0.2283105 3.158135    50
    ## [47] {other vegetables,                                                                      
    ##       whipped/sour cream,                                                                    
    ##       whole milk}            => {root vegetables}       0.005185562  0.3541667 3.249281    51
    ## [48] {other vegetables,                                                                      
    ##       root vegetables,                                                                       
    ##       whole milk}            => {whipped/sour cream}    0.005185562  0.2236842 3.120474    51
    ## [49] {other vegetables,                                                                      
    ##       whole milk,                                                                            
    ##       yogurt}                => {whipped/sour cream}    0.005592272  0.2511416 3.503514    55
    ## [50] {pip fruit,                                                                             
    ##       root vegetables,                                                                       
    ##       whole milk}            => {other vegetables}      0.005490595  0.6136364 3.171368    54
    ## [51] {other vegetables,                                                                      
    ##       pip fruit,                                                                             
    ##       whole milk}            => {root vegetables}       0.005490595  0.4060150 3.724961    54
    ## [52] {other vegetables,                                                                      
    ##       root vegetables,                                                                       
    ##       whole milk}            => {pip fruit}             0.005490595  0.2368421 3.130836    54
    ## [53] {other vegetables,                                                                      
    ##       whole milk,                                                                            
    ##       yogurt}                => {pip fruit}             0.005083884  0.2283105 3.018056    50
    ## [54] {citrus fruit,                                                                          
    ##       root vegetables,                                                                       
    ##       whole milk}            => {other vegetables}      0.005795628  0.6333333 3.273165    57
    ## [55] {citrus fruit,                                                                          
    ##       other vegetables,                                                                      
    ##       whole milk}            => {root vegetables}       0.005795628  0.4453125 4.085493    57
    ## [56] {other vegetables,                                                                      
    ##       root vegetables,                                                                       
    ##       whole milk}            => {citrus fruit}          0.005795628  0.2500000 3.020577    57
    ## [57] {root vegetables,                                                                       
    ##       tropical fruit,                                                                        
    ##       whole milk}            => {yogurt}                0.005693950  0.4745763 3.401937    56
    ## [58] {tropical fruit,                                                                        
    ##       whole milk,                                                                            
    ##       yogurt}                => {root vegetables}       0.005693950  0.3758389 3.448112    56
    ## [59] {root vegetables,                                                                       
    ##       whole milk,                                                                            
    ##       yogurt}                => {tropical fruit}        0.005693950  0.3916084 3.732043    56
    ## [60] {root vegetables,                                                                       
    ##       tropical fruit,                                                                        
    ##       whole milk}            => {other vegetables}      0.007015760  0.5847458 3.022057    69
    ## [61] {other vegetables,                                                                      
    ##       tropical fruit,                                                                        
    ##       whole milk}            => {root vegetables}       0.007015760  0.4107143 3.768074    69
    ## [62] {other vegetables,                                                                      
    ##       tropical fruit,                                                                        
    ##       whole milk}            => {yogurt}                0.007625826  0.4464286 3.200164    75
    ## [63] {other vegetables,                                                                      
    ##       whole milk,                                                                            
    ##       yogurt}                => {tropical fruit}        0.007625826  0.3424658 3.263712    75
    ## [64] {other vegetables,                                                                      
    ##       whole milk,                                                                            
    ##       yogurt}                => {root vegetables}       0.007829181  0.3515982 3.225716    77
    ## [65] {other vegetables,                                                                      
    ##       rolls/buns,                                                                            
    ##       whole milk}            => {root vegetables}       0.006202339  0.3465909 3.179778    61

    ##       lhs                           rhs                    support confidence     lift count
    ## [1]   {baking powder}            => {whole milk}       0.009252669  0.5229885 2.046793    91
    ## [2]   {oil,                                                                                 
    ##        other vegetables}         => {whole milk}       0.005083884  0.5102041 1.996760    50
    ## [3]   {onions,                                                                              
    ##        root vegetables}          => {other vegetables} 0.005693950  0.6021505 3.112008    56
    ## [4]   {onions,                                                                              
    ##        whole milk}               => {other vegetables} 0.006609049  0.5462185 2.822942    65
    ## [5]   {hygiene articles,                                                                    
    ##        other vegetables}         => {whole milk}       0.005185562  0.5425532 2.123363    51
    ## [6]   {other vegetables,                                                                    
    ##        sugar}                    => {whole milk}       0.006304016  0.5849057 2.289115    62
    ## [7]   {long life bakery product,                                                            
    ##        other vegetables}         => {whole milk}       0.005693950  0.5333333 2.087279    56
    ## [8]   {cream cheese,                                                                        
    ##        yogurt}                   => {whole milk}       0.006609049  0.5327869 2.085141    65
    ## [9]   {chicken,                                                                             
    ##        root vegetables}          => {other vegetables} 0.005693950  0.5233645 2.704829    56
    ## [10]  {chicken,                                                                             
    ##        root vegetables}          => {whole milk}       0.005998983  0.5514019 2.157993    59
    ## [11]  {chicken,                                                                             
    ##        rolls/buns}               => {whole milk}       0.005287239  0.5473684 2.142208    52
    ## [12]  {coffee,                                                                              
    ##        yogurt}                   => {whole milk}       0.005083884  0.5208333 2.038359    50
    ## [13]  {frozen vegetables,                                                                   
    ##        root vegetables}          => {other vegetables} 0.006100661  0.5263158 2.720082    60
    ## [14]  {frozen vegetables,                                                                   
    ##        root vegetables}          => {whole milk}       0.006202339  0.5350877 2.094146    61
    ## [15]  {frozen vegetables,                                                                   
    ##        other vegetables}         => {whole milk}       0.009659380  0.5428571 2.124552    95
    ## [16]  {beef,                                                                                
    ##        yogurt}                   => {whole milk}       0.006100661  0.5217391 2.041904    60
    ## [17]  {curd,                                                                                
    ##        whipped/sour cream}       => {whole milk}       0.005897306  0.5631068 2.203802    58
    ## [18]  {curd,                                                                                
    ##        tropical fruit}           => {yogurt}           0.005287239  0.5148515 3.690645    52
    ## [19]  {curd,                                                                                
    ##        tropical fruit}           => {other vegetables} 0.005287239  0.5148515 2.660833    52
    ## [20]  {curd,                                                                                
    ##        tropical fruit}           => {whole milk}       0.006507372  0.6336634 2.479936    64
    ## [21]  {curd,                                                                                
    ##        root vegetables}          => {other vegetables} 0.005490595  0.5046729 2.608228    54
    ## [22]  {curd,                                                                                
    ##        root vegetables}          => {whole milk}       0.006202339  0.5700935 2.231146    61
    ## [23]  {curd,                                                                                
    ##        yogurt}                   => {whole milk}       0.010066090  0.5823529 2.279125    99
    ## [24]  {curd,                                                                                
    ##        rolls/buns}               => {whole milk}       0.005897306  0.5858586 2.292845    58
    ## [25]  {curd,                                                                                
    ##        other vegetables}         => {whole milk}       0.009862735  0.5739645 2.246296    97
    ## [26]  {pork,                                                                                
    ##        root vegetables}          => {other vegetables} 0.007015760  0.5149254 2.661214    69
    ## [27]  {pork,                                                                                
    ##        rolls/buns}               => {whole milk}       0.006202339  0.5495495 2.150744    61
    ## [28]  {frankfurter,                                                                         
    ##        tropical fruit}           => {whole milk}       0.005185562  0.5483871 2.146195    51
    ## [29]  {frankfurter,                                                                         
    ##        yogurt}                   => {whole milk}       0.006202339  0.5545455 2.170296    61
    ## [30]  {bottled beer,                                                                        
    ##        yogurt}                   => {whole milk}       0.005185562  0.5604396 2.193364    51
    ## [31]  {brown bread,                                                                         
    ##        tropical fruit}           => {whole milk}       0.005693950  0.5333333 2.087279    56
    ## [32]  {brown bread,                                                                         
    ##        root vegetables}          => {whole milk}       0.005693950  0.5600000 2.191643    56
    ## [33]  {domestic eggs,                                                                       
    ##        margarine}                => {whole milk}       0.005185562  0.6219512 2.434099    51
    ## [34]  {margarine,                                                                           
    ##        root vegetables}          => {other vegetables} 0.005897306  0.5321101 2.750028    58
    ## [35]  {margarine,                                                                           
    ##        rolls/buns}               => {whole milk}       0.007930859  0.5379310 2.105273    78
    ## [36]  {butter,                                                                              
    ##        domestic eggs}            => {whole milk}       0.005998983  0.6210526 2.430582    59
    ## [37]  {butter,                                                                              
    ##        whipped/sour cream}       => {other vegetables} 0.005795628  0.5700000 2.945849    57
    ## [38]  {butter,                                                                              
    ##        whipped/sour cream}       => {whole milk}       0.006710727  0.6600000 2.583008    66
    ## [39]  {butter,                                                                              
    ##        citrus fruit}             => {whole milk}       0.005083884  0.5555556 2.174249    50
    ## [40]  {bottled water,                                                                       
    ##        butter}                   => {whole milk}       0.005388917  0.6022727 2.357084    53
    ## [41]  {butter,                                                                              
    ##        tropical fruit}           => {other vegetables} 0.005490595  0.5510204 2.847759    54
    ## [42]  {butter,                                                                              
    ##        tropical fruit}           => {whole milk}       0.006202339  0.6224490 2.436047    61
    ## [43]  {butter,                                                                              
    ##        root vegetables}          => {other vegetables} 0.006609049  0.5118110 2.645119    65
    ## [44]  {butter,                                                                              
    ##        root vegetables}          => {whole milk}       0.008235892  0.6377953 2.496107    81
    ## [45]  {butter,                                                                              
    ##        yogurt}                   => {whole milk}       0.009354347  0.6388889 2.500387    92
    ## [46]  {butter,                                                                              
    ##        other vegetables}         => {whole milk}       0.011489578  0.5736041 2.244885   113
    ## [47]  {newspapers,                                                                          
    ##        root vegetables}          => {other vegetables} 0.005998983  0.5221239 2.698417    59
    ## [48]  {newspapers,                                                                          
    ##        root vegetables}          => {whole milk}       0.005795628  0.5044248 1.974142    57
    ## [49]  {domestic eggs,                                                                       
    ##        whipped/sour cream}       => {other vegetables} 0.005083884  0.5102041 2.636814    50
    ## [50]  {domestic eggs,                                                                       
    ##        whipped/sour cream}       => {whole milk}       0.005693950  0.5714286 2.236371    56
    ## [51]  {domestic eggs,                                                                       
    ##        pip fruit}                => {whole milk}       0.005388917  0.6235294 2.440275    53
    ## [52]  {citrus fruit,                                                                        
    ##        domestic eggs}            => {whole milk}       0.005693950  0.5490196 2.148670    56
    ## [53]  {domestic eggs,                                                                       
    ##        tropical fruit}           => {whole milk}       0.006914082  0.6071429 2.376144    68
    ## [54]  {domestic eggs,                                                                       
    ##        root vegetables}          => {other vegetables} 0.007320793  0.5106383 2.639058    72
    ## [55]  {domestic eggs,                                                                       
    ##        root vegetables}          => {whole milk}       0.008540925  0.5957447 2.331536    84
    ## [56]  {domestic eggs,                                                                       
    ##        yogurt}                   => {whole milk}       0.007727504  0.5390071 2.109485    76
    ## [57]  {domestic eggs,                                                                       
    ##        other vegetables}         => {whole milk}       0.012302999  0.5525114 2.162336   121
    ## [58]  {fruit/vegetable juice,                                                               
    ##        root vegetables}          => {other vegetables} 0.006609049  0.5508475 2.846865    65
    ## [59]  {fruit/vegetable juice,                                                               
    ##        root vegetables}          => {whole milk}       0.006507372  0.5423729 2.122657    64
    ## [60]  {fruit/vegetable juice,                                                               
    ##        yogurt}                   => {whole milk}       0.009456024  0.5054348 1.978094    93
    ## [61]  {pip fruit,                                                                           
    ##        whipped/sour cream}       => {other vegetables} 0.005592272  0.6043956 3.123610    55
    ## [62]  {pip fruit,                                                                           
    ##        whipped/sour cream}       => {whole milk}       0.005998983  0.6483516 2.537421    59
    ## [63]  {citrus fruit,                                                                        
    ##        whipped/sour cream}       => {other vegetables} 0.005693950  0.5233645 2.704829    56
    ## [64]  {citrus fruit,                                                                        
    ##        whipped/sour cream}       => {whole milk}       0.006304016  0.5794393 2.267722    62
    ## [65]  {sausage,                                                                             
    ##        whipped/sour cream}       => {whole milk}       0.005083884  0.5617978 2.198679    50
    ## [66]  {tropical fruit,                                                                      
    ##        whipped/sour cream}       => {other vegetables} 0.007829181  0.5661765 2.926088    77
    ## [67]  {tropical fruit,                                                                      
    ##        whipped/sour cream}       => {whole milk}       0.007930859  0.5735294 2.244593    78
    ## [68]  {root vegetables,                                                                     
    ##        whipped/sour cream}       => {whole milk}       0.009456024  0.5535714 2.166484    93
    ## [69]  {whipped/sour cream,                                                                  
    ##        yogurt}                   => {whole milk}       0.010879512  0.5245098 2.052747   107
    ## [70]  {rolls/buns,                                                                          
    ##        whipped/sour cream}       => {whole milk}       0.007829181  0.5347222 2.092715    77
    ## [71]  {other vegetables,                                                                    
    ##        whipped/sour cream}       => {whole milk}       0.014641586  0.5070423 1.984385   144
    ## [72]  {pip fruit,                                                                           
    ##        sausage}                  => {whole milk}       0.005592272  0.5188679 2.030667    55
    ## [73]  {pip fruit,                                                                           
    ##        root vegetables}          => {other vegetables} 0.008134215  0.5228758 2.702304    80
    ## [74]  {pip fruit,                                                                           
    ##        root vegetables}          => {whole milk}       0.008947636  0.5751634 2.250988    88
    ## [75]  {pip fruit,                                                                           
    ##        yogurt}                   => {whole milk}       0.009557702  0.5310734 2.078435    94
    ## [76]  {other vegetables,                                                                    
    ##        pip fruit}                => {whole milk}       0.013523132  0.5175097 2.025351   133
    ## [77]  {pastry,                                                                              
    ##        tropical fruit}           => {whole milk}       0.006710727  0.5076923 1.986930    66
    ## [78]  {pastry,                                                                              
    ##        root vegetables}          => {other vegetables} 0.005897306  0.5370370 2.775491    58
    ## [79]  {pastry,                                                                              
    ##        root vegetables}          => {whole milk}       0.005693950  0.5185185 2.029299    56
    ## [80]  {pastry,                                                                              
    ##        yogurt}                   => {whole milk}       0.009150991  0.5172414 2.024301    90
    ## [81]  {citrus fruit,                                                                        
    ##        root vegetables}          => {other vegetables} 0.010371124  0.5862069 3.029608   102
    ## [82]  {citrus fruit,                                                                        
    ##        root vegetables}          => {whole milk}       0.009150991  0.5172414 2.024301    90
    ## [83]  {root vegetables,                                                                     
    ##        shopping bags}            => {other vegetables} 0.006609049  0.5158730 2.666112    65
    ## [84]  {sausage,                                                                             
    ##        tropical fruit}           => {whole milk}       0.007219115  0.5182482 2.028241    71
    ## [85]  {root vegetables,                                                                     
    ##        sausage}                  => {whole milk}       0.007727504  0.5170068 2.023383    76
    ## [86]  {root vegetables,                                                                     
    ##        tropical fruit}           => {other vegetables} 0.012302999  0.5845411 3.020999   121
    ## [87]  {root vegetables,                                                                     
    ##        tropical fruit}           => {whole milk}       0.011997966  0.5700483 2.230969   118
    ## [88]  {tropical fruit,                                                                      
    ##        yogurt}                   => {whole milk}       0.015149975  0.5173611 2.024770   149
    ## [89]  {root vegetables,                                                                     
    ##        yogurt}                   => {whole milk}       0.014539908  0.5629921 2.203354   143
    ## [90]  {rolls/buns,                                                                          
    ##        root vegetables}          => {other vegetables} 0.012201322  0.5020921 2.594890   120
    ## [91]  {rolls/buns,                                                                          
    ##        root vegetables}          => {whole milk}       0.012709710  0.5230126 2.046888   125
    ## [92]  {other vegetables,                                                                    
    ##        yogurt}                   => {whole milk}       0.022267412  0.5128806 2.007235   219
    ## [93]  {fruit/vegetable juice,                                                               
    ##        other vegetables,                                                                    
    ##        yogurt}                   => {whole milk}       0.005083884  0.6172840 2.415833    50
    ## [94]  {fruit/vegetable juice,                                                               
    ##        whole milk,                                                                          
    ##        yogurt}                   => {other vegetables} 0.005083884  0.5376344 2.778578    50
    ## [95]  {other vegetables,                                                                    
    ##        root vegetables,                                                                     
    ##        whipped/sour cream}       => {whole milk}       0.005185562  0.6071429 2.376144    51
    ## [96]  {root vegetables,                                                                     
    ##        whipped/sour cream,                                                                  
    ##        whole milk}               => {other vegetables} 0.005185562  0.5483871 2.834150    51
    ## [97]  {other vegetables,                                                                    
    ##        whipped/sour cream,                                                                  
    ##        yogurt}                   => {whole milk}       0.005592272  0.5500000 2.152507    55
    ## [98]  {whipped/sour cream,                                                                  
    ##        whole milk,                                                                          
    ##        yogurt}                   => {other vegetables} 0.005592272  0.5140187 2.656529    55
    ## [99]  {other vegetables,                                                                    
    ##        pip fruit,                                                                           
    ##        root vegetables}          => {whole milk}       0.005490595  0.6750000 2.641713    54
    ## [100] {pip fruit,                                                                           
    ##        root vegetables,                                                                     
    ##        whole milk}               => {other vegetables} 0.005490595  0.6136364 3.171368    54
    ## [101] {other vegetables,                                                                    
    ##        pip fruit,                                                                           
    ##        yogurt}                   => {whole milk}       0.005083884  0.6250000 2.446031    50
    ## [102] {pip fruit,                                                                           
    ##        whole milk,                                                                          
    ##        yogurt}                   => {other vegetables} 0.005083884  0.5319149 2.749019    50
    ## [103] {citrus fruit,                                                                        
    ##        other vegetables,                                                                    
    ##        root vegetables}          => {whole milk}       0.005795628  0.5588235 2.187039    57
    ## [104] {citrus fruit,                                                                        
    ##        root vegetables,                                                                     
    ##        whole milk}               => {other vegetables} 0.005795628  0.6333333 3.273165    57
    ## [105] {root vegetables,                                                                     
    ##        tropical fruit,                                                                      
    ##        yogurt}                   => {whole milk}       0.005693950  0.7000000 2.739554    56
    ## [106] {other vegetables,                                                                    
    ##        root vegetables,                                                                     
    ##        tropical fruit}           => {whole milk}       0.007015760  0.5702479 2.231750    69
    ## [107] {root vegetables,                                                                     
    ##        tropical fruit,                                                                      
    ##        whole milk}               => {other vegetables} 0.007015760  0.5847458 3.022057    69
    ## [108] {other vegetables,                                                                    
    ##        tropical fruit,                                                                      
    ##        yogurt}                   => {whole milk}       0.007625826  0.6198347 2.425816    75
    ## [109] {tropical fruit,                                                                      
    ##        whole milk,                                                                          
    ##        yogurt}                   => {other vegetables} 0.007625826  0.5033557 2.601421    75
    ## [110] {other vegetables,                                                                    
    ##        root vegetables,                                                                     
    ##        yogurt}                   => {whole milk}       0.007829181  0.6062992 2.372842    77
    ## [111] {root vegetables,                                                                     
    ##        whole milk,                                                                          
    ##        yogurt}                   => {other vegetables} 0.007829181  0.5384615 2.782853    77
    ## [112] {other vegetables,                                                                    
    ##        rolls/buns,                                                                          
    ##        root vegetables}          => {whole milk}       0.006202339  0.5083333 1.989438    61
    ## [113] {other vegetables,                                                                    
    ##        rolls/buns,                                                                          
    ##        yogurt}                   => {whole milk}       0.005998983  0.5221239 2.043410    59

    ##      lhs                        rhs                    support confidence     lift count
    ## [1]  {herbs}                 => {root vegetables}  0.007015760  0.4312500 3.956477    69
    ## [2]  {beef}                  => {root vegetables}  0.017386884  0.3313953 3.040367   171
    ## [3]  {onions,                                                                           
    ##       root vegetables}       => {other vegetables} 0.005693950  0.6021505 3.112008    56
    ## [4]  {onions,                                                                           
    ##       other vegetables}      => {root vegetables}  0.005693950  0.4000000 3.669776    56
    ## [5]  {chicken,                                                                          
    ##       whole milk}            => {root vegetables}  0.005998983  0.3410405 3.128855    59
    ## [6]  {frozen vegetables,                                                                
    ##       other vegetables}      => {root vegetables}  0.006100661  0.3428571 3.145522    60
    ## [7]  {beef,                                                                             
    ##       other vegetables}      => {root vegetables}  0.007930859  0.4020619 3.688692    78
    ## [8]  {beef,                                                                             
    ##       whole milk}            => {root vegetables}  0.008032537  0.3779904 3.467851    79
    ## [9]  {curd,                                                                             
    ##       tropical fruit}        => {yogurt}           0.005287239  0.5148515 3.690645    52
    ## [10] {butter,                                                                           
    ##       other vegetables}      => {root vegetables}  0.006609049  0.3299492 3.027100    65
    ## [11] {domestic eggs,                                                                    
    ##       other vegetables}      => {root vegetables}  0.007320793  0.3287671 3.016254    72
    ## [12] {pip fruit,                                                                        
    ##       whipped/sour cream}    => {other vegetables} 0.005592272  0.6043956 3.123610    55
    ## [13] {tropical fruit,                                                                   
    ##       whipped/sour cream}    => {yogurt}           0.006202339  0.4485294 3.215224    61
    ## [14] {citrus fruit,                                                                     
    ##       pip fruit}             => {tropical fruit}   0.005592272  0.4044118 3.854060    55
    ## [15] {pip fruit,                                                                        
    ##       root vegetables}       => {tropical fruit}   0.005287239  0.3398693 3.238967    52
    ## [16] {pip fruit,                                                                        
    ##       yogurt}                => {tropical fruit}   0.006405694  0.3559322 3.392048    63
    ## [17] {other vegetables,                                                                 
    ##       pip fruit}             => {tropical fruit}   0.009456024  0.3618677 3.448613    93
    ## [18] {citrus fruit,                                                                     
    ##       root vegetables}       => {tropical fruit}   0.005693950  0.3218391 3.067139    56
    ## [19] {citrus fruit,                                                                     
    ##       root vegetables}       => {other vegetables} 0.010371124  0.5862069 3.029608   102
    ## [20] {citrus fruit,                                                                     
    ##       other vegetables}      => {root vegetables}  0.010371124  0.3591549 3.295045   102
    ## [21] {rolls/buns,                                                                       
    ##       shopping bags}         => {sausage}          0.005998983  0.3072917 3.270794    59
    ## [22] {root vegetables,                                                                  
    ##       yogurt}                => {tropical fruit}   0.008134215  0.3149606 3.001587    80
    ## [23] {root vegetables,                                                                  
    ##       tropical fruit}        => {other vegetables} 0.012302999  0.5845411 3.020999   121
    ## [24] {other vegetables,                                                                 
    ##       tropical fruit}        => {root vegetables}  0.012302999  0.3427762 3.144780   121
    ## [25] {fruit/vegetable juice,                                                            
    ##       other vegetables,                                                                 
    ##       whole milk}            => {yogurt}           0.005083884  0.4854369 3.479790    50
    ## [26] {other vegetables,                                                                 
    ##       whipped/sour cream,                                                               
    ##       whole milk}            => {root vegetables}  0.005185562  0.3541667 3.249281    51
    ## [27] {pip fruit,                                                                        
    ##       root vegetables,                                                                  
    ##       whole milk}            => {other vegetables} 0.005490595  0.6136364 3.171368    54
    ## [28] {other vegetables,                                                                 
    ##       pip fruit,                                                                        
    ##       whole milk}            => {root vegetables}  0.005490595  0.4060150 3.724961    54
    ## [29] {citrus fruit,                                                                     
    ##       root vegetables,                                                                  
    ##       whole milk}            => {other vegetables} 0.005795628  0.6333333 3.273165    57
    ## [30] {citrus fruit,                                                                     
    ##       other vegetables,                                                                 
    ##       whole milk}            => {root vegetables}  0.005795628  0.4453125 4.085493    57
    ## [31] {root vegetables,                                                                  
    ##       tropical fruit,                                                                   
    ##       whole milk}            => {yogurt}           0.005693950  0.4745763 3.401937    56
    ## [32] {tropical fruit,                                                                   
    ##       whole milk,                                                                       
    ##       yogurt}                => {root vegetables}  0.005693950  0.3758389 3.448112    56
    ## [33] {root vegetables,                                                                  
    ##       whole milk,                                                                       
    ##       yogurt}                => {tropical fruit}   0.005693950  0.3916084 3.732043    56
    ## [34] {root vegetables,                                                                  
    ##       tropical fruit,                                                                   
    ##       whole milk}            => {other vegetables} 0.007015760  0.5847458 3.022057    69
    ## [35] {other vegetables,                                                                 
    ##       tropical fruit,                                                                   
    ##       whole milk}            => {root vegetables}  0.007015760  0.4107143 3.768074    69
    ## [36] {other vegetables,                                                                 
    ##       tropical fruit,                                                                   
    ##       whole milk}            => {yogurt}           0.007625826  0.4464286 3.200164    75
    ## [37] {other vegetables,                                                                 
    ##       whole milk,                                                                       
    ##       yogurt}                => {tropical fruit}   0.007625826  0.3424658 3.263712    75
    ## [38] {other vegetables,                                                                 
    ##       whole milk,                                                                       
    ##       yogurt}                => {root vegetables}  0.007829181  0.3515982 3.225716    77
    ## [39] {other vegetables,                                                                 
    ##       rolls/buns,                                                                       
    ##       whole milk}            => {root vegetables}  0.006202339  0.3465909 3.179778    61

    ## To reduce overplotting, jitter is added! Use jitter = 0 to prevent jitter.

![](Final_WIP_files/figure-gfm/unnamed-chunk-50-1.png)<!-- -->

![](Final_WIP_files/figure-gfm/unnamed-chunk-51-1.png)<!-- -->

    ##       lhs                           rhs              support confidence      lift count
    ## [1]   {}                         => {whole milk} 0.255516014  0.2555160 1.0000000  2513
    ## [2]   {cake bar}                 => {whole milk} 0.005592272  0.4230769 1.6557746    55
    ## [3]   {dishes}                   => {whole milk} 0.005287239  0.3005780 1.1763569    52
    ## [4]   {mustard}                  => {whole milk} 0.005185562  0.4322034 1.6914924    51
    ## [5]   {pot plants}               => {whole milk} 0.006914082  0.4000000 1.5654596    68
    ## [6]   {chewing gum}              => {whole milk} 0.005083884  0.2415459 0.9453259    50
    ## [7]   {pasta}                    => {whole milk} 0.006100661  0.4054054 1.5866145    60
    ## [8]   {herbs}                    => {whole milk} 0.007727504  0.4750000 1.8589833    76
    ## [9]   {processed cheese}         => {whole milk} 0.007015760  0.4233129 1.6566981    69
    ## [10]  {semi-finished bread}      => {whole milk} 0.007117438  0.4022989 1.5744565    70
    ## [11]  {beverages}                => {whole milk} 0.006812405  0.2617188 1.0242753    67
    ## [12]  {ice cream}                => {whole milk} 0.005897306  0.2357724 0.9227303    58
    ## [13]  {detergent}                => {whole milk} 0.008947636  0.4656085 1.8222281    88
    ## [14]  {pickled vegetables}       => {whole milk} 0.007117438  0.3977273 1.5565650    70
    ## [15]  {baking powder}            => {whole milk} 0.009252669  0.5229885 2.0467935    91
    ## [16]  {flour}                    => {whole milk} 0.008439248  0.4853801 1.8996074    83
    ## [17]  {soft cheese}              => {whole milk} 0.007524148  0.4404762 1.7238692    74
    ## [18]  {specialty bar}            => {whole milk} 0.006507372  0.2379182 0.9311284    64
    ## [19]  {misc. beverages}          => {whole milk} 0.007015760  0.2473118 0.9678917    69
    ## [20]  {grapes}                   => {whole milk} 0.007320793  0.3272727 1.2808306    72
    ## [21]  {cat food}                 => {whole milk} 0.008845958  0.3799127 1.4868448    87
    ## [22]  {specialty chocolate}      => {whole milk} 0.008032537  0.2642140 1.0340410    79
    ## [23]  {meat}                     => {whole milk} 0.009964413  0.3858268 1.5099906    98
    ## [24]  {frozen meals}             => {whole milk} 0.009862735  0.3476703 1.3606593    97
    ## [25]  {hard cheese}              => {whole milk} 0.010066090  0.4107884 1.6076815    99
    ## [26]  {butter milk}              => {whole milk} 0.011591256  0.4145455 1.6223854   114
    ## [27]  {candy}                    => {whole milk} 0.008235892  0.2755102 1.0782502    81
    ## [28]  {ham}                      => {whole milk} 0.011489578  0.4414062 1.7275091   113
    ## [29]  {sliced cheese}            => {whole milk} 0.010777834  0.4398340 1.7213560   106
    ## [30]  {oil}                      => {whole milk} 0.011286223  0.4021739 1.5739675   111
    ## [31]  {onions}                   => {whole milk} 0.012099644  0.3901639 1.5269647   119
    ## [32]  {berries}                  => {whole milk} 0.011794611  0.3547401 1.3883281   116
    ## [33]  {hamburger meat}           => {whole milk} 0.014743264  0.4434251 1.7354101   145
    ## [34]  {hygiene articles}         => {whole milk} 0.012811388  0.3888889 1.5219746   126
    ## [35]  {salty snack}              => {whole milk} 0.011184545  0.2956989 1.1572618   110
    ## [36]  {sugar}                    => {whole milk} 0.015048297  0.4444444 1.7393996   148
    ## [37]  {waffles}                  => {whole milk} 0.012709710  0.3306878 1.2941961   125
    ## [38]  {long life bakery product} => {whole milk} 0.013523132  0.3614130 1.4144438   133
    ## [39]  {dessert}                  => {whole milk} 0.013726487  0.3698630 1.4475140   135
    ## [40]  {cream cheese}             => {whole milk} 0.016471784  0.4153846 1.6256696   162
    ## [41]  {chicken}                  => {whole milk} 0.017590239  0.4099526 1.6044106   173
    ## [42]  {white bread}              => {whole milk} 0.017081851  0.4057971 1.5881474   168
    ## [43]  {chocolate}                => {whole milk} 0.016675140  0.3360656 1.3152427   164
    ## [44]  {coffee}                   => {whole milk} 0.018708693  0.3222417 1.2611408   184
    ## [45]  {frozen vegetables}        => {whole milk} 0.020437214  0.4249471 1.6630940   201
    ## [46]  {beef}                     => {whole milk} 0.021250635  0.4050388 1.5851795   209
    ## [47]  {curd}                     => {whole milk} 0.026131164  0.4904580 1.9194805   257
    ## [48]  {napkins}                  => {whole milk} 0.019725470  0.3766990 1.4742678   194
    ## [49]  {pork}                     => {whole milk} 0.022165735  0.3844797 1.5047187   218
    ## [50]  {frankfurter}              => {whole milk} 0.020538892  0.3482759 1.3630295   202
    ## [51]  {bottled beer}             => {whole milk} 0.020437214  0.2537879 0.9932367   201
    ## [52]  {brown bread}              => {whole milk} 0.025216065  0.3887147 1.5212930   248
    ## [53]  {margarine}                => {whole milk} 0.024199288  0.4131944 1.6170980   238
    ## [54]  {butter}                   => {whole milk} 0.027554652  0.4972477 1.9460530   271
    ## [55]  {newspapers}               => {whole milk} 0.027351296  0.3426752 1.3411103   269
    ## [56]  {domestic eggs}            => {whole milk} 0.029994916  0.4727564 1.8502027   295
    ## [57]  {fruit/vegetable juice}    => {whole milk} 0.026639553  0.3684951 1.4421604   262
    ## [58]  {whipped/sour cream}       => {whole milk} 0.032231825  0.4496454 1.7597542   317
    ## [59]  {pip fruit}                => {whole milk} 0.030096594  0.3978495 1.5570432   296
    ## [60]  {pastry}                   => {whole milk} 0.033248602  0.3737143 1.4625865   327
    ## [61]  {citrus fruit}             => {whole milk} 0.030503305  0.3685504 1.4423768   300
    ## [62]  {shopping bags}            => {whole milk} 0.024504321  0.2487100 0.9733637   241
    ## [63]  {sausage}                  => {whole milk} 0.029893238  0.3181818 1.2452520   294
    ## [64]  {bottled water}            => {whole milk} 0.034367056  0.3109476 1.2169396   338
    ## [65]  {tropical fruit}           => {whole milk} 0.042297916  0.4031008 1.5775950   416
    ## [66]  {root vegetables}          => {whole milk} 0.048906965  0.4486940 1.7560310   481
    ## [67]  {soda}                     => {whole milk} 0.040061007  0.2297376 0.8991124   394
    ## [68]  {yogurt}                   => {whole milk} 0.056024403  0.4016035 1.5717351   551
    ## [69]  {rolls/buns}               => {whole milk} 0.056634469  0.3079049 1.2050318   557
    ## [70]  {other vegetables}         => {whole milk} 0.074834774  0.3867578 1.5136341   736
    ## [71]  {oil,                                                                            
    ##        other vegetables}         => {whole milk} 0.005083884  0.5102041 1.9967597    50
    ## [72]  {onions,                                                                         
    ##        other vegetables}         => {whole milk} 0.006609049  0.4642857 1.8170513    65
    ## [73]  {hamburger meat,                                                                 
    ##        other vegetables}         => {whole milk} 0.006304016  0.4558824 1.7841635    62
    ## [74]  {hygiene articles,                                                               
    ##        other vegetables}         => {whole milk} 0.005185562  0.5425532 2.1233628    51
    ## [75]  {other vegetables,                                                               
    ##        sugar}                    => {whole milk} 0.006304016  0.5849057 2.2891155    62
    ## [76]  {long life bakery product,                                                       
    ##        other vegetables}         => {whole milk} 0.005693950  0.5333333 2.0872795    56
    ## [77]  {cream cheese,                                                                   
    ##        yogurt}                   => {whole milk} 0.006609049  0.5327869 2.0851409    65
    ## [78]  {cream cheese,                                                                   
    ##        other vegetables}         => {whole milk} 0.006710727  0.4888889 1.9133395    66
    ## [79]  {chicken,                                                                        
    ##        root vegetables}          => {whole milk} 0.005998983  0.5514019 2.1579934    59
    ## [80]  {chicken,                                                                        
    ##        rolls/buns}               => {whole milk} 0.005287239  0.5473684 2.1422079    52
    ## [81]  {chicken,                                                                        
    ##        other vegetables}         => {whole milk} 0.008439248  0.4715909 1.8456413    83
    ## [82]  {other vegetables,                                                               
    ##        white bread}              => {whole milk} 0.005897306  0.4296296 1.6814196    58
    ## [83]  {chocolate,                                                                      
    ##        soda}                     => {whole milk} 0.005083884  0.3759398 1.4712966    50
    ## [84]  {chocolate,                                                                      
    ##        other vegetables}         => {whole milk} 0.005490595  0.4320000 1.6906964    54
    ## [85]  {coffee,                                                                         
    ##        yogurt}                   => {whole milk} 0.005083884  0.5208333 2.0383589    50
    ## [86]  {coffee,                                                                         
    ##        other vegetables}         => {whole milk} 0.006405694  0.4772727 1.8678779    63
    ## [87]  {frozen vegetables,                                                              
    ##        root vegetables}          => {whole milk} 0.006202339  0.5350877 2.0941455    61
    ## [88]  {frozen vegetables,                                                              
    ##        yogurt}                   => {whole milk} 0.006100661  0.4918033 1.9247454    60
    ## [89]  {frozen vegetables,                                                              
    ##        rolls/buns}               => {whole milk} 0.005083884  0.5000000 1.9568245    50
    ## [90]  {frozen vegetables,                                                              
    ##        other vegetables}         => {whole milk} 0.009659380  0.5428571 2.1245523    95
    ## [91]  {beef,                                                                           
    ##        root vegetables}          => {whole milk} 0.008032537  0.4619883 1.8080601    79
    ## [92]  {beef,                                                                           
    ##        yogurt}                   => {whole milk} 0.006100661  0.5217391 2.0419038    60
    ## [93]  {beef,                                                                           
    ##        rolls/buns}               => {whole milk} 0.006812405  0.5000000 1.9568245    67
    ## [94]  {beef,                                                                           
    ##        other vegetables}         => {whole milk} 0.009252669  0.4690722 1.8357838    91
    ## [95]  {curd,                                                                           
    ##        whipped/sour cream}       => {whole milk} 0.005897306  0.5631068 2.2038024    58
    ## [96]  {curd,                                                                           
    ##        tropical fruit}           => {whole milk} 0.006507372  0.6336634 2.4799360    64
    ## [97]  {curd,                                                                           
    ##        root vegetables}          => {whole milk} 0.006202339  0.5700935 2.2311457    61
    ## [98]  {curd,                                                                           
    ##        yogurt}                   => {whole milk} 0.010066090  0.5823529 2.2791250    99
    ## [99]  {curd,                                                                           
    ##        rolls/buns}               => {whole milk} 0.005897306  0.5858586 2.2928449    58
    ## [100] {curd,                                                                           
    ##        other vegetables}         => {whole milk} 0.009862735  0.5739645 2.2462956    97
    ## [101] {napkins,                                                                        
    ##        yogurt}                   => {whole milk} 0.006100661  0.4958678 1.9406524    60
    ## [102] {napkins,                                                                        
    ##        rolls/buns}               => {whole milk} 0.005287239  0.4521739 1.7696500    52
    ## [103] {napkins,                                                                        
    ##        other vegetables}         => {whole milk} 0.006812405  0.4718310 1.8465809    67
    ## [104] {pork,                                                                           
    ##        root vegetables}          => {whole milk} 0.006812405  0.5000000 1.9568245    67
    ## [105] {pork,                                                                           
    ##        rolls/buns}               => {whole milk} 0.006202339  0.5495495 2.1507441    61
    ## [106] {other vegetables,                                                               
    ##        pork}                     => {whole milk} 0.010167768  0.4694836 1.8373939   100
    ## [107] {frankfurter,                                                                    
    ##        tropical fruit}           => {whole milk} 0.005185562  0.5483871 2.1461946    51
    ## [108] {frankfurter,                                                                    
    ##        root vegetables}          => {whole milk} 0.005083884  0.5000000 1.9568245    50
    ## [109] {frankfurter,                                                                    
    ##        yogurt}                   => {whole milk} 0.006202339  0.5545455 2.1702963    61
    ## [110] {frankfurter,                                                                    
    ##        rolls/buns}               => {whole milk} 0.005998983  0.3121693 1.2217211    59
    ## [111] {frankfurter,                                                                    
    ##        other vegetables}         => {whole milk} 0.007625826  0.4629630 1.8118745    75
    ## [112] {bottled beer,                                                                   
    ##        bottled water}            => {whole milk} 0.006100661  0.3870968 1.5149609    60
    ## [113] {bottled beer,                                                                   
    ##        yogurt}                   => {whole milk} 0.005185562  0.5604396 2.1933637    51
    ## [114] {bottled beer,                                                                   
    ##        rolls/buns}               => {whole milk} 0.005388917  0.3955224 1.5479358    53
    ## [115] {bottled beer,                                                                   
    ##        other vegetables}         => {whole milk} 0.007625826  0.4716981 1.8460609    75
    ## [116] {brown bread,                                                                    
    ##        tropical fruit}           => {whole milk} 0.005693950  0.5333333 2.0872795    56
    ## [117] {brown bread,                                                                    
    ##        root vegetables}          => {whole milk} 0.005693950  0.5600000 2.1916435    56
    ## [118] {brown bread,                                                                    
    ##        soda}                     => {whole milk} 0.005083884  0.4032258 1.5780843    50
    ## [119] {brown bread,                                                                    
    ##        yogurt}                   => {whole milk} 0.007117438  0.4895105 1.9157723    70
    ## [120] {brown bread,                                                                    
    ##        rolls/buns}               => {whole milk} 0.005287239  0.4193548 1.6412077    52
    ## [121] {brown bread,                                                                    
    ##        other vegetables}         => {whole milk} 0.009354347  0.5000000 1.9568245    92
    ## [122] {domestic eggs,                                                                  
    ##        margarine}                => {whole milk} 0.005185562  0.6219512 2.4340988    51
    ## [123] {margarine,                                                                      
    ##        yogurt}                   => {whole milk} 0.007015760  0.4928571 1.9288699    69
    ## [124] {margarine,                                                                      
    ##        rolls/buns}               => {whole milk} 0.007930859  0.5379310 2.1052733    78
    ## [125] {margarine,                                                                      
    ##        other vegetables}         => {whole milk} 0.009252669  0.4690722 1.8357838    91
    ## [126] {butter,                                                                         
    ##        domestic eggs}            => {whole milk} 0.005998983  0.6210526 2.4305820    59
    ## [127] {butter,                                                                         
    ##        whipped/sour cream}       => {whole milk} 0.006710727  0.6600000 2.5830084    66
    ## [128] {butter,                                                                         
    ##        citrus fruit}             => {whole milk} 0.005083884  0.5555556 2.1742495    50
    ## [129] {bottled water,                                                                  
    ##        butter}                   => {whole milk} 0.005388917  0.6022727 2.3570841    53
    ## [130] {butter,                                                                         
    ##        tropical fruit}           => {whole milk} 0.006202339  0.6224490 2.4360468    61
    ## [131] {butter,                                                                         
    ##        root vegetables}          => {whole milk} 0.008235892  0.6377953 2.4961069    81
    ## [132] {butter,                                                                         
    ##        yogurt}                   => {whole milk} 0.009354347  0.6388889 2.5003869    92
    ## [133] {butter,                                                                         
    ##        rolls/buns}               => {whole milk} 0.006609049  0.4924242 1.9271757    65
    ## [134] {butter,                                                                         
    ##        other vegetables}         => {whole milk} 0.011489578  0.5736041 2.2448850   113
    ## [135] {newspapers,                                                                     
    ##        tropical fruit}           => {whole milk} 0.005083884  0.4310345 1.6869177    50
    ## [136] {newspapers,                                                                     
    ##        root vegetables}          => {whole milk} 0.005795628  0.5044248 1.9741415    57
    ## [137] {newspapers,                                                                     
    ##        yogurt}                   => {whole milk} 0.006609049  0.4304636 1.6846834    65
    ## [138] {newspapers,                                                                     
    ##        rolls/buns}               => {whole milk} 0.007625826  0.3865979 1.5130086    75
    ## [139] {newspapers,                                                                     
    ##        other vegetables}         => {whole milk} 0.008337570  0.4315789 1.6890485    82
    ## [140] {domestic eggs,                                                                  
    ##        whipped/sour cream}       => {whole milk} 0.005693950  0.5714286 2.2363709    56
    ## [141] {domestic eggs,                                                                  
    ##        pip fruit}                => {whole milk} 0.005388917  0.6235294 2.4402753    53
    ## [142] {citrus fruit,                                                                   
    ##        domestic eggs}            => {whole milk} 0.005693950  0.5490196 2.1486701    56
    ## [143] {domestic eggs,                                                                  
    ##        tropical fruit}           => {whole milk} 0.006914082  0.6071429 2.3761441    68
    ## [144] {domestic eggs,                                                                  
    ##        root vegetables}          => {whole milk} 0.008540925  0.5957447 2.3315356    84
    ## [145] {domestic eggs,                                                                  
    ##        soda}                     => {whole milk} 0.005185562  0.4180328 1.6360336    51
    ## [146] {domestic eggs,                                                                  
    ##        yogurt}                   => {whole milk} 0.007727504  0.5390071 2.1094846    76
    ## [147] {domestic eggs,                                                                  
    ##        rolls/buns}               => {whole milk} 0.006609049  0.4220779 1.6518648    65
    ## [148] {domestic eggs,                                                                  
    ##        other vegetables}         => {whole milk} 0.012302999  0.5525114 2.1623358   121
    ## [149] {bottled water,                                                                  
    ##        fruit/vegetable juice}    => {whole milk} 0.005795628  0.4071429 1.5934142    57
    ## [150] {fruit/vegetable juice,                                                          
    ##        tropical fruit}           => {whole milk} 0.005998983  0.4370370 1.7104096    59
    ## [151] {fruit/vegetable juice,                                                          
    ##        root vegetables}          => {whole milk} 0.006507372  0.5423729 2.1226571    64
    ## [152] {fruit/vegetable juice,                                                          
    ##        soda}                     => {whole milk} 0.006100661  0.3314917 1.2973422    60
    ## [153] {fruit/vegetable juice,                                                          
    ##        yogurt}                   => {whole milk} 0.009456024  0.5054348 1.9780943    93
    ## [154] {fruit/vegetable juice,                                                          
    ##        rolls/buns}               => {whole milk} 0.005592272  0.3846154 1.5052496    55
    ## [155] {fruit/vegetable juice,                                                          
    ##        other vegetables}         => {whole milk} 0.010472801  0.4975845 1.9473713   103
    ## [156] {pip fruit,                                                                      
    ##        whipped/sour cream}       => {whole milk} 0.005998983  0.6483516 2.5374208    59
    ## [157] {citrus fruit,                                                                   
    ##        whipped/sour cream}       => {whole milk} 0.006304016  0.5794393 2.2677219    62
    ## [158] {sausage,                                                                        
    ##        whipped/sour cream}       => {whole milk} 0.005083884  0.5617978 2.1986792    50
    ## [159] {tropical fruit,                                                                 
    ##        whipped/sour cream}       => {whole milk} 0.007930859  0.5735294 2.2445928    78
    ## [160] {root vegetables,                                                                
    ##        whipped/sour cream}       => {whole milk} 0.009456024  0.5535714 2.1664843    93
    ## [161] {soda,                                                                           
    ##        whipped/sour cream}       => {whole milk} 0.005490595  0.4736842 1.8538337    54
    ## [162] {whipped/sour cream,                                                             
    ##        yogurt}                   => {whole milk} 0.010879512  0.5245098 2.0527473   107
    ## [163] {rolls/buns,                                                                     
    ##        whipped/sour cream}       => {whole milk} 0.007829181  0.5347222 2.0927151    77
    ## [164] {other vegetables,                                                               
    ##        whipped/sour cream}       => {whole milk} 0.014641586  0.5070423 1.9843854   144
    ## [165] {pastry,                                                                         
    ##        pip fruit}                => {whole milk} 0.005083884  0.4761905 1.8636424    50
    ## [166] {citrus fruit,                                                                   
    ##        pip fruit}                => {whole milk} 0.005185562  0.3750000 1.4676184    51
    ## [167] {pip fruit,                                                                      
    ##        sausage}                  => {whole milk} 0.005592272  0.5188679 2.0306669    55
    ## [168] {pip fruit,                                                                      
    ##        tropical fruit}           => {whole milk} 0.008439248  0.4129353 1.6160839    83
    ## [169] {pip fruit,                                                                      
    ##        root vegetables}          => {whole milk} 0.008947636  0.5751634 2.2509877    88
    ## [170] {pip fruit,                                                                      
    ##        yogurt}                   => {whole milk} 0.009557702  0.5310734 2.0784351    94
    ## [171] {pip fruit,                                                                      
    ##        rolls/buns}               => {whole milk} 0.006202339  0.4452555 1.7425737    61
    ## [172] {other vegetables,                                                               
    ##        pip fruit}                => {whole milk} 0.013523132  0.5175097 2.0253514   133
    ## [173] {pastry,                                                                         
    ##        sausage}                  => {whole milk} 0.005693950  0.4552846 1.7818239    56
    ## [174] {pastry,                                                                         
    ##        tropical fruit}           => {whole milk} 0.006710727  0.5076923 1.9869295    66
    ## [175] {pastry,                                                                         
    ##        root vegetables}          => {whole milk} 0.005693950  0.5185185 2.0292995    56
    ## [176] {pastry,                                                                         
    ##        soda}                     => {whole milk} 0.008235892  0.3913043 1.5314279    81
    ## [177] {pastry,                                                                         
    ##        yogurt}                   => {whole milk} 0.009150991  0.5172414 2.0243012    90
    ## [178] {pastry,                                                                         
    ##        rolls/buns}               => {whole milk} 0.008540925  0.4077670 1.5958569    84
    ## [179] {other vegetables,                                                               
    ##        pastry}                   => {whole milk} 0.010574479  0.4684685 1.8334212   104
    ## [180] {bottled water,                                                                  
    ##        citrus fruit}             => {whole milk} 0.005897306  0.4360902 1.7067041    58
    ## [181] {citrus fruit,                                                                   
    ##        tropical fruit}           => {whole milk} 0.009049314  0.4540816 1.7771161    89
    ## [182] {citrus fruit,                                                                   
    ##        root vegetables}          => {whole milk} 0.009150991  0.5172414 2.0243012    90
    ## [183] {citrus fruit,                                                                   
    ##        yogurt}                   => {whole milk} 0.010269446  0.4741784 1.8557678   101
    ## [184] {citrus fruit,                                                                   
    ##        rolls/buns}               => {whole milk} 0.007219115  0.4303030 1.6840550    71
    ## [185] {citrus fruit,                                                                   
    ##        other vegetables}         => {whole milk} 0.013014743  0.4507042 1.7638982   128
    ## [186] {root vegetables,                                                                
    ##        shopping bags}            => {whole milk} 0.005287239  0.4126984 1.6151567    52
    ## [187] {shopping bags,                                                                  
    ##        soda}                     => {whole milk} 0.006812405  0.2768595 1.0835309    67
    ## [188] {shopping bags,                                                                  
    ##        yogurt}                   => {whole milk} 0.005287239  0.3466667 1.3567317    52
    ## [189] {rolls/buns,                                                                     
    ##        shopping bags}            => {whole milk} 0.005287239  0.2708333 1.0599466    52
    ## [190] {other vegetables,                                                               
    ##        shopping bags}            => {whole milk} 0.007625826  0.3289474 1.2873845    75
    ## [191] {sausage,                                                                        
    ##        tropical fruit}           => {whole milk} 0.007219115  0.5182482 2.0282415    71
    ## [192] {root vegetables,                                                                
    ##        sausage}                  => {whole milk} 0.007727504  0.5170068 2.0233832    76
    ## [193] {sausage,                                                                        
    ##        soda}                     => {whole milk} 0.006710727  0.2761506 1.0807566    66
    ## [194] {sausage,                                                                        
    ##        yogurt}                   => {whole milk} 0.008744281  0.4455959 1.7439058    86
    ## [195] {rolls/buns,                                                                     
    ##        sausage}                  => {whole milk} 0.009354347  0.3056478 1.1961984    92
    ## [196] {other vegetables,                                                               
    ##        sausage}                  => {whole milk} 0.010167768  0.3773585 1.4768487   100
    ## [197] {bottled water,                                                                  
    ##        tropical fruit}           => {whole milk} 0.008032537  0.4340659 1.6987817    79
    ## [198] {bottled water,                                                                  
    ##        root vegetables}          => {whole milk} 0.007320793  0.4675325 1.8297580    72
    ## [199] {bottled water,                                                                  
    ##        soda}                     => {whole milk} 0.007524148  0.2596491 1.0161755    74
    ## [200] {bottled water,                                                                  
    ##        yogurt}                   => {whole milk} 0.009659380  0.4203540 1.6451180    95
    ## [201] {bottled water,                                                                  
    ##        rolls/buns}               => {whole milk} 0.008744281  0.3613445 1.4141757    86
    ## [202] {bottled water,                                                                  
    ##        other vegetables}         => {whole milk} 0.010777834  0.4344262 1.7001918   106
    ## [203] {root vegetables,                                                                
    ##        tropical fruit}           => {whole milk} 0.011997966  0.5700483 2.2309690   118
    ## [204] {soda,                                                                           
    ##        tropical fruit}           => {whole milk} 0.007829181  0.3756098 1.4700048    77
    ## [205] {tropical fruit,                                                                 
    ##        yogurt}                   => {whole milk} 0.015149975  0.5173611 2.0247698   149
    ## [206] {rolls/buns,                                                                     
    ##        tropical fruit}           => {whole milk} 0.010981190  0.4462810 1.7465872   108
    ## [207] {other vegetables,                                                               
    ##        tropical fruit}           => {whole milk} 0.017081851  0.4759207 1.8625865   168
    ## [208] {root vegetables,                                                                
    ##        soda}                     => {whole milk} 0.008134215  0.4371585 1.7108848    80
    ## [209] {root vegetables,                                                                
    ##        yogurt}                   => {whole milk} 0.014539908  0.5629921 2.2033536   143
    ## [210] {rolls/buns,                                                                     
    ##        root vegetables}          => {whole milk} 0.012709710  0.5230126 2.0468876   125
    ## [211] {other vegetables,                                                               
    ##        root vegetables}          => {whole milk} 0.023182511  0.4892704 1.9148326   228
    ## [212] {soda,                                                                           
    ##        yogurt}                   => {whole milk} 0.010472801  0.3828996 1.4985348   103
    ## [213] {rolls/buns,                                                                     
    ##        soda}                     => {whole milk} 0.008845958  0.2307692 0.9031498    87
    ## [214] {other vegetables,                                                               
    ##        soda}                     => {whole milk} 0.013929842  0.4254658 1.6651240   137
    ## [215] {rolls/buns,                                                                     
    ##        yogurt}                   => {whole milk} 0.015556685  0.4526627 1.7715630   153
    ## [216] {other vegetables,                                                               
    ##        yogurt}                   => {whole milk} 0.022267412  0.5128806 2.0072345   219
    ## [217] {other vegetables,                                                               
    ##        rolls/buns}               => {whole milk} 0.017895272  0.4200477 1.6439194   176
    ## [218] {fruit/vegetable juice,                                                          
    ##        other vegetables,                                                               
    ##        yogurt}                   => {whole milk} 0.005083884  0.6172840 2.4158327    50
    ## [219] {other vegetables,                                                               
    ##        root vegetables,                                                                
    ##        whipped/sour cream}       => {whole milk} 0.005185562  0.6071429 2.3761441    51
    ## [220] {other vegetables,                                                               
    ##        whipped/sour cream,                                                             
    ##        yogurt}                   => {whole milk} 0.005592272  0.5500000 2.1525070    55
    ## [221] {other vegetables,                                                               
    ##        pip fruit,                                                                      
    ##        root vegetables}          => {whole milk} 0.005490595  0.6750000 2.6417131    54
    ## [222] {other vegetables,                                                               
    ##        pip fruit,                                                                      
    ##        yogurt}                   => {whole milk} 0.005083884  0.6250000 2.4460306    50
    ## [223] {citrus fruit,                                                                   
    ##        other vegetables,                                                               
    ##        root vegetables}          => {whole milk} 0.005795628  0.5588235 2.1870392    57
    ## [224] {root vegetables,                                                                
    ##        tropical fruit,                                                                 
    ##        yogurt}                   => {whole milk} 0.005693950  0.7000000 2.7395543    56
    ## [225] {other vegetables,                                                               
    ##        root vegetables,                                                                
    ##        tropical fruit}           => {whole milk} 0.007015760  0.5702479 2.2317503    69
    ## [226] {other vegetables,                                                               
    ##        tropical fruit,                                                                 
    ##        yogurt}                   => {whole milk} 0.007625826  0.6198347 2.4258155    75
    ## [227] {other vegetables,                                                               
    ##        root vegetables,                                                                
    ##        yogurt}                   => {whole milk} 0.007829181  0.6062992 2.3728423    77
    ## [228] {other vegetables,                                                               
    ##        rolls/buns,                                                                     
    ##        root vegetables}          => {whole milk} 0.006202339  0.5083333 1.9894383    61
    ## [229] {other vegetables,                                                               
    ##        rolls/buns,                                                                     
    ##        yogurt}                   => {whole milk} 0.005998983  0.5221239 2.0434097    59

    ##      lhs                        rhs                  support confidence     lift count
    ## [1]  {grapes}                => {tropical fruit} 0.006100661  0.2727273 2.599101    60
    ## [2]  {ham}                   => {tropical fruit} 0.005388917  0.2070312 1.973016    53
    ## [3]  {sliced cheese}         => {tropical fruit} 0.005287239  0.2157676 2.056274    52
    ## [4]  {berries}               => {tropical fruit} 0.006710727  0.2018349 1.923494    66
    ## [5]  {hygiene articles}      => {tropical fruit} 0.006710727  0.2037037 1.941304    66
    ## [6]  {white bread}           => {tropical fruit} 0.008744281  0.2077295 1.979670    86
    ## [7]  {pip fruit}             => {tropical fruit} 0.020437214  0.2701613 2.574648   201
    ## [8]  {citrus fruit}          => {tropical fruit} 0.019928826  0.2407862 2.294702   196
    ## [9]  {yogurt}                => {tropical fruit} 0.029283172  0.2099125 2.000475   288
    ## [10] {curd,                                                                           
    ##       yogurt}                => {tropical fruit} 0.005287239  0.3058824 2.915071    52
    ## [11] {curd,                                                                           
    ##       other vegetables}      => {tropical fruit} 0.005287239  0.3076923 2.932320    52
    ## [12] {curd,                                                                           
    ##       whole milk}            => {tropical fruit} 0.006507372  0.2490272 2.373239    64
    ## [13] {frankfurter,                                                                    
    ##       whole milk}            => {tropical fruit} 0.005185562  0.2524752 2.406099    51
    ## [14] {brown bread,                                                                    
    ##       whole milk}            => {tropical fruit} 0.005693950  0.2258065 2.151944    56
    ## [15] {butter,                                                                         
    ##       other vegetables}      => {tropical fruit} 0.005490595  0.2741117 2.612295    54
    ## [16] {butter,                                                                         
    ##       whole milk}            => {tropical fruit} 0.006202339  0.2250923 2.145138    61
    ## [17] {domestic eggs,                                                                  
    ##       whole milk}            => {tropical fruit} 0.006914082  0.2305085 2.196755    68
    ## [18] {fruit/vegetable juice,                                                          
    ##       other vegetables}      => {tropical fruit} 0.006609049  0.3140097 2.992524    65
    ## [19] {fruit/vegetable juice,                                                          
    ##       whole milk}            => {tropical fruit} 0.005998983  0.2251908 2.146077    59
    ## [20] {whipped/sour cream,                                                             
    ##       yogurt}                => {tropical fruit} 0.006202339  0.2990196 2.849668    61
    ## [21] {other vegetables,                                                               
    ##       whipped/sour cream}    => {tropical fruit} 0.007829181  0.2711268 2.583849    77
    ## [22] {whipped/sour cream,                                                             
    ##       whole milk}            => {tropical fruit} 0.007930859  0.2460568 2.344931    78
    ## [23] {citrus fruit,                                                                   
    ##       pip fruit}             => {tropical fruit} 0.005592272  0.4044118 3.854060    55
    ## [24] {pip fruit,                                                                      
    ##       root vegetables}       => {tropical fruit} 0.005287239  0.3398693 3.238967    52
    ## [25] {pip fruit,                                                                      
    ##       yogurt}                => {tropical fruit} 0.006405694  0.3559322 3.392048    63
    ## [26] {other vegetables,                                                               
    ##       pip fruit}             => {tropical fruit} 0.009456024  0.3618677 3.448613    93
    ## [27] {pip fruit,                                                                      
    ##       whole milk}            => {tropical fruit} 0.008439248  0.2804054 2.672274    83
    ## [28] {other vegetables,                                                               
    ##       pastry}                => {tropical fruit} 0.005083884  0.2252252 2.146405    50
    ## [29] {pastry,                                                                         
    ##       whole milk}            => {tropical fruit} 0.006710727  0.2018349 1.923494    66
    ## [30] {citrus fruit,                                                                   
    ##       root vegetables}       => {tropical fruit} 0.005693950  0.3218391 3.067139    56
    ## [31] {citrus fruit,                                                                   
    ##       yogurt}                => {tropical fruit} 0.006304016  0.2910798 2.774002    62
    ## [32] {citrus fruit,                                                                   
    ##       other vegetables}      => {tropical fruit} 0.009049314  0.3133803 2.986526    89
    ## [33] {citrus fruit,                                                                   
    ##       whole milk}            => {tropical fruit} 0.009049314  0.2966667 2.827245    89
    ## [34] {other vegetables,                                                               
    ##       sausage}               => {tropical fruit} 0.005998983  0.2226415 2.121782    59
    ## [35] {sausage,                                                                        
    ##       whole milk}            => {tropical fruit} 0.007219115  0.2414966 2.301472    71
    ## [36] {bottled water,                                                                  
    ##       yogurt}                => {tropical fruit} 0.007117438  0.3097345 2.951782    70
    ## [37] {bottled water,                                                                  
    ##       rolls/buns}            => {tropical fruit} 0.005388917  0.2226891 2.122236    53
    ## [38] {bottled water,                                                                  
    ##       other vegetables}      => {tropical fruit} 0.006202339  0.2500000 2.382510    61
    ## [39] {bottled water,                                                                  
    ##       whole milk}            => {tropical fruit} 0.008032537  0.2337278 2.227435    79
    ## [40] {root vegetables,                                                                
    ##       yogurt}                => {tropical fruit} 0.008134215  0.3149606 3.001587    80
    ## [41] {rolls/buns,                                                                     
    ##       root vegetables}       => {tropical fruit} 0.005897306  0.2426778 2.312729    58
    ## [42] {other vegetables,                                                               
    ##       root vegetables}       => {tropical fruit} 0.012302999  0.2596567 2.474538   121
    ## [43] {root vegetables,                                                                
    ##       whole milk}            => {tropical fruit} 0.011997966  0.2453222 2.337931   118
    ## [44] {soda,                                                                           
    ##       yogurt}                => {tropical fruit} 0.006609049  0.2416357 2.302797    65
    ## [45] {other vegetables,                                                               
    ##       soda}                  => {tropical fruit} 0.007219115  0.2204969 2.101344    71
    ## [46] {rolls/buns,                                                                     
    ##       yogurt}                => {tropical fruit} 0.008744281  0.2544379 2.424803    86
    ## [47] {other vegetables,                                                               
    ##       yogurt}                => {tropical fruit} 0.012302999  0.2833724 2.700550   121
    ## [48] {whole milk,                                                                     
    ##       yogurt}                => {tropical fruit} 0.015149975  0.2704174 2.577089   149
    ## [49] {other vegetables,                                                               
    ##       whole milk}            => {tropical fruit} 0.017081851  0.2282609 2.175335   168
    ## [50] {root vegetables,                                                                
    ##       whole milk,                                                                     
    ##       yogurt}                => {tropical fruit} 0.005693950  0.3916084 3.732043    56
    ## [51] {other vegetables,                                                               
    ##       root vegetables,                                                                
    ##       whole milk}            => {tropical fruit} 0.007015760  0.3026316 2.884091    69
    ## [52] {other vegetables,                                                               
    ##       whole milk,                                                                     
    ##       yogurt}                => {tropical fruit} 0.007625826  0.3424658 3.263712    75

    ##      lhs                                 rhs       support     confidence
    ## [1]  {meat}                           => {sausage} 0.005287239 0.2047244 
    ## [2]  {hard cheese}                    => {sausage} 0.005185562 0.2116183 
    ## [3]  {sliced cheese}                  => {sausage} 0.007015760 0.2863071 
    ## [4]  {shopping bags,soda}             => {sausage} 0.005693950 0.2314050 
    ## [5]  {rolls/buns,shopping bags}       => {sausage} 0.005998983 0.3072917 
    ## [6]  {other vegetables,shopping bags} => {sausage} 0.005388917 0.2324561 
    ## [7]  {bottled water,other vegetables} => {sausage} 0.005083884 0.2049180 
    ## [8]  {root vegetables,yogurt}         => {sausage} 0.005185562 0.2007874 
    ## [9]  {soda,yogurt}                    => {sausage} 0.005592272 0.2044610 
    ## [10] {rolls/buns,soda}                => {sausage} 0.009659380 0.2519894 
    ## [11] {other vegetables,soda}          => {sausage} 0.007219115 0.2204969 
    ## [12] {other vegetables,rolls/buns}    => {sausage} 0.008845958 0.2076372 
    ##      lift     count
    ## [1]  2.179074 52   
    ## [2]  2.252452 51   
    ## [3]  3.047435 69   
    ## [4]  2.463060 56   
    ## [5]  3.270794 59   
    ## [6]  2.474249 53   
    ## [7]  2.181135 50   
    ## [8]  2.137169 51   
    ## [9]  2.176270 55   
    ## [10] 2.682160 95   
    ## [11] 2.346956 71   
    ## [12] 2.210078 87

As expected, the most prominent rule emerging from the grocery baskets
was butter and yogurt -\> whole milk with a confidence of 64%. However,
in total there were 229 rules pointing to whole milk because it is such
a popular grocery item. In comparison, the 12 rules for sausage were
quite interesting. Pairings leading to sausage with confidence around
20% included root vegetables and yogurt, other vegetables and shopping
bags, and soda and yogurt. These items are pretty unintuitive when it
comes to sausage trends. In addition, it was surprising to see that
hamburger meat was not largely intertwined in the network.

The graph output from gephi shows the network of grocery items with
nodes with degree less than 3 filtered out. The nodes and edges are
partitioned (and colored) by confidence.

![](Grocery_colorlabel.pdf)<!-- -->
