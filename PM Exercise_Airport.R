rm(list=ls())

library(tidyverse)
library(ggmap)
library(lubridate)
library(ggplot2)
library(data.table)
library(ggrepel)
library(dplyr)

#Data
data = read.csv("ABIA.csv")
codes = read.csv("airport-codes.csv")
attach(data)

#Get airport coordinates and get only important info from codes file --------
#grab important info from codes file
codes_crop = codes[,10:12]
codes_crop = codes_crop[,c(1,3)]
codes_crop = distinct(codes_crop, codes_crop$iata_code,.keep_all=TRUE)
#merge for destination coords
data2 = merge(data,codes_crop,by.x=("Dest"),by.y=("iata_code"),all.x=TRUE)
data2 = data2[,-31]
names(data2)[30] = "dest_coord"
#merge for origin coords
data2 = merge(data2,codes_crop,by.x=("Origin"),by.y=("iata_code"),all.x=TRUE)
data2 = data2[,-32]
names(data2)[31] = "origin_coord"
#split coords into long and lat
data3 = separate(data2, dest_coord,c("dest_lat","dest_long"),
                 sep = ",",remove=FALSE)
data3 = separate(data3, origin_coord,c("origin_lat","origin_long"),
                 sep = ",",remove=FALSE)

#subset data to Austin departures
aus = data3[which(data3$Origin=="AUS"),]

#how many destinations from aus?
length(unique(aus$Dest)) #52 different locations

#groupby locations and get count of flights
grouped = summarize(group_by(aus,Dest,dest_long,dest_lat),count=n())
grouped$count = as.numeric(grouped$count)
grouped$dest_long = as.numeric(as.character(grouped$dest_long))
grouped$dest_lat = as.numeric(as.character(grouped$dest_lat))

#plot usa map
usa_bb = c(-124.848974, 24.396308, -66.885444, 49.384358)
usa_map = ggmap(get_stamenmap(bbox=usa_bb, scale=2, zoom=5,
                              maptype = "terrain"), extent="normal")

#layer aus destinations with size as number of flights----------
#scale down circle sizes to fit on map
circle_scale_amt = 0.0045
#plot
usa_map + 
  geom_point(aes(x = dest_long, y = dest_lat),data=grouped, 
                          col= "orange",alpha=.6,size = grouped$count*circle_scale_amt)+
               scale_size_continuous(range=c(1,5573))

#color circles by mean arrival delay to those locations---------
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
  scale_color_gradient(low="blue",high="red",limits=c(0,.25))
  
#ATL sucks, miami is great :), not super surprising


