library(readr)
library(dplyr)
library(ggrepel)
library(leaflet)
library(leaflet.extras)
library(ggplot2)
library(scales)
library(MASS)
library(pls)
library(WOCR)
library(pracma)
library(car)
library(DT)
library(KernSmooth)
library(raster)
library(rgdal)
df <- read.csv("owid_covid_data_PROCESSED.csv", header = TRUE, sep=",", na.strings = "")
dim(df)
summary(df)
glimpse(df)

options(scipen=999)  # turn off scientific notation like 1e+06

ggplot(df, aes(x=date, y=new_cases))

new_date <- as.Date(df$date, format = "%m/%d/%Y")

ggplot(data=df, aes(x=new_date, y=new_cases)) +
  geom_line(color = "#F2CA27", size = 0.1) +
  scale_x_date(breaks = date_breaks("1 year"), labels = date_format("%Y"))

ggplot(data=df, aes(x=new_date, y=new_cases_smoothed)) +
  geom_line(color = "#F2CA27", size = 0.1) +
  scale_x_date(breaks = date_breaks("1 year"), labels = date_format("%Y"))

ggplot(data=df, aes(x=new_date, y=new_vaccinations_smoothed)) +
  geom_line(color = "#F2CA27", size = 0.1) +
  scale_x_date(breaks = date_breaks("1 year"), labels = date_format("%Y"))

ggplot(data=df, aes(x=new_date)) +
  geom_line(aes(y = new_cases_smoothed, color="New Cases")) +
  geom_line(aes(y = new_vaccinations_smoothed, color="Administered Vaccines")) +
  scale_x_date(breaks = date_breaks("1 year"), labels = date_format("%Y")) +
  labs(x="Date", y="Cases & Vaccines") +
  ggtitle("COVID-19 New cases & Administered vaccines in the USA") +
  theme_classic() + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
