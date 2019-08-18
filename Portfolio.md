ProjectPortfolio
================
Rachel Meade
8/18/2019

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

``` r
library(mosaic)
```

    ## Loading required package: dplyr

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    ## Loading required package: lattice

    ## Loading required package: ggformula

    ## Loading required package: ggplot2

    ## Loading required package: ggstance

    ## 
    ## Attaching package: 'ggstance'

    ## The following objects are masked from 'package:ggplot2':
    ## 
    ##     geom_errorbarh, GeomErrorbarh

    ## 
    ## New to ggformula?  Try the tutorials: 
    ##  learnr::run_tutorial("introduction", package = "ggformula")
    ##  learnr::run_tutorial("refining", package = "ggformula")

    ## Loading required package: mosaicData

    ## Loading required package: Matrix

    ## Registered S3 method overwritten by 'mosaic':
    ##   method                           from   
    ##   fortify.SpatialPolygonsDataFrame ggplot2

    ## 
    ## The 'mosaic' package masks several functions from core packages in order to add 
    ## additional features.  The original behavior of these functions should not be affected by this.
    ## 
    ## Note: If you use the Matrix package, be sure to load it BEFORE loading mosaic.

    ## 
    ## Attaching package: 'mosaic'

    ## The following object is masked from 'package:Matrix':
    ## 
    ##     mean

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     stat

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     count, do, tally

    ## The following objects are masked from 'package:stats':
    ## 
    ##     binom.test, cor, cor.test, cov, fivenum, IQR, median,
    ##     prop.test, quantile, sd, t.test, var

    ## The following objects are masked from 'package:base':
    ## 
    ##     max, mean, min, prod, range, sample, sum

``` r
library(quantmod)
```

    ## Loading required package: xts

    ## Loading required package: zoo

    ## 
    ## Attaching package: 'zoo'

    ## The following objects are masked from 'package:base':
    ## 
    ##     as.Date, as.Date.numeric

    ## Registered S3 method overwritten by 'xts':
    ##   method     from
    ##   as.zoo.xts zoo

    ## 
    ## Attaching package: 'xts'

    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     first, last

    ## Loading required package: TTR

    ## Registered S3 method overwritten by 'quantmod':
    ##   method            from
    ##   as.zoo.data.frame zoo

    ## Version 0.4-0 included new data defaults. See ?getSymbols.

``` r
library(foreach)

mystocks = c("EUSA", "VUG", "PGX", "MDIV", "USCI", "SPLV", "XLK", "BND", "KNOW", "SPY")
myprices = getSymbols(mystocks, from = "2014-08-15")
```

    ## 'getSymbols' currently uses auto.assign=TRUE by default, but will
    ## use auto.assign=FALSE in 0.5-0. You will still be able to use
    ## 'loadSymbols' to automatically load data. getOption("getSymbols.env")
    ## and getOption("getSymbols.auto.assign") will still be checked for
    ## alternate defaults.
    ## 
    ## This message is shown once per session and may be disabled by setting 
    ## options("getSymbols.warning4.0"=FALSE). See ?getSymbols for details.

    ## pausing 1 second between requests for more than 5 symbols
    ## pausing 1 second between requests for more than 5 symbols
    ## pausing 1 second between requests for more than 5 symbols
    ## pausing 1 second between requests for more than 5 symbols
    ## pausing 1 second between requests for more than 5 symbols
    ## pausing 1 second between requests for more than 5 symbols

Adjust all ETFs and create a new object adding ‘a’ to the end.

``` r
for(ticker in mystocks) {
  expr = paste0(ticker, "a = adjustOHLC(", ticker, ")")
  eval(parse(text=expr))
}
```

Combine all the returns in a matrix.

``` r
all_returns = cbind(    ClCl(EUSAa),
                     ClCl(VUGa),
                     ClCl(PGXa),
                     ClCl(MDIVa),
                     ClCl(USCIa),
                     ClCl(SPLVa),
                     ClCl(XLKa),
                     ClCl(BNDa),
                     ClCl(KNOWa),
                     ClCl(SPYa))

all_returns = as.matrix(na.omit(all_returns))
```

Compute the returns from the closing prices

``` r
pairs(all_returns)
```

![](Portfolio_files/figure-gfm/unnamed-chunk-4-1.png)<!-- --> Run the
Monte Carlo simulations to demonstrate many different possible
scenarios.

``` r
initial_wealth = 100000
sim1 = foreach(i=1:5000, .combine='rbind') %do% {
  total_wealth = initial_wealth
  weights = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1)
  holdings = weights * total_wealth
  n_days = 20
  wealthtracker = rep(0, n_days)
  for(today in 1:n_days) {
    return.today = resample(all_returns, 1, orig.ids=FALSE)
    holdings = holdings + holdings*return.today
    total_wealth = sum(holdings)
    wealthtracker[today] = total_wealth
  }
  wealthtracker
}
```

Histogram of the ending wealth amounts generated by the simulations.

``` r
hist(sim1[,n_days], 25)
```

![](Portfolio_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->
Profit/loss

``` r
mean(sim1[,n_days])
```

    ## [1] 100718.9

``` r
hist(sim1[,n_days]- initial_wealth, breaks=30)
```

![](Portfolio_files/figure-gfm/unnamed-chunk-7-1.png)<!-- --> Calculate
Value at Risk at the 5% level.

``` r
temp = sim1[,n_days]- initial_wealth
quantile(temp,p=0.05)
```

    ##        5% 
    ## -3683.952

We repeat the above process twice more with different portfolios. Since
we are using a subset of the same ETFs as the first example, we will
just adjust the weights of each ETF and re-run the simulations.

``` 
```

This portfolio focuses on the Tech Sector (30% weight on XLK -
Technology Select Secotr SPDR Fund) and drop COmmodity Index Fund (USCI)
& Bonds (BND).

``` r
initial_wealth = 100000
sim1 = foreach(i=1:5000, .combine='rbind') %do% {
  total_wealth = initial_wealth
  weights = c(0.1, 0.1, 0.1, 0.1, 0, 0.1, 0.3, 0, 0.1, 0.1)
  holdings = weights * total_wealth
  n_days = 20
  wealthtracker = rep(0, n_days)
  for(today in 1:n_days) {
    return.today = resample(all_returns, 1, orig.ids=FALSE)
    holdings = holdings + holdings*return.today
    total_wealth = sum(holdings)
    wealthtracker[today] = total_wealth
  }
  wealthtracker
}

hist(sim1[,n_days], 25)
```

![](Portfolio_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->
Profit/loss

``` r
mean(sim1[,n_days])
```

    ## [1] 101004.1

``` r
hist(sim1[,n_days]- initial_wealth, breaks=30)
```

![](Portfolio_files/figure-gfm/unnamed-chunk-10-1.png)<!-- --> 5% Value
at Risk

``` r
temp = sim1[,n_days]- initial_wealth
quantile(temp,p=0.05)
```

    ##        5% 
    ## -4797.403

Change weights to focus on Bonds, & Commodity Index and drop EUSA, VUG,
SPY, XLK, and PGX

``` r
initial_wealth = 100000
sim1 = foreach(i=1:5000, .combine='rbind') %do% {
  total_wealth = initial_wealth
  weights = c(0, 0, 0.1, 0, 0.35, 0.1, 0, 0.35, 0.1, 0)
  holdings = weights * total_wealth
  n_days = 20
  wealthtracker = rep(0, n_days)
  for(today in 1:n_days) {
    return.today = resample(all_returns, 1, orig.ids=FALSE)
    holdings = holdings + holdings*return.today
    total_wealth = sum(holdings)
    wealthtracker[today] = total_wealth
  }
  wealthtracker
}

hist(sim1[,n_days], 25)
```

![](Portfolio_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->
Profit/loss

``` r
mean(sim1[,n_days])
```

    ## [1] 100203.2

``` r
hist(sim1[,n_days]- initial_wealth, breaks=30)
```

![](Portfolio_files/figure-gfm/unnamed-chunk-13-1.png)<!-- --> 5% Value
at Risk

``` r
temp = sim1[,n_days]- initial_wealth
quantile(temp,p=0.05)
```

    ##        5% 
    ## -2290.154

Finally, we try to make a poorly diversified portfolio, leaving only
Commodities, Tech, and Insider Sentiment.

``` r
initial_wealth = 100000
sim1 = foreach(i=1:5000, .combine='rbind') %do% {
  total_wealth = initial_wealth
  weights = c(0, 0, 0, 0, 0.4, 0, 0.4, 0, 0.2, 0)
  holdings = weights * total_wealth
  n_days = 20
  wealthtracker = rep(0, n_days)
  for(today in 1:n_days) {
    return.today = resample(all_returns, 1, orig.ids=FALSE)
    holdings = holdings + holdings*return.today
    total_wealth = sum(holdings)
    wealthtracker[today] = total_wealth
  }
  wealthtracker
}

hist(sim1[,n_days], 25)
```

![](Portfolio_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->
Profit/loss

``` r
mean(sim1[,n_days])
```

    ## [1] 100639.7

``` r
hist(sim1[,n_days]- initial_wealth, breaks=30)
```

![](Portfolio_files/figure-gfm/unnamed-chunk-16-1.png)<!-- --> 5% Value
at Risk

``` r
temp = sim1[,n_days]- initial_wealth
quantile(temp,p=0.05)
```

    ##        5% 
    ## -4699.501

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
