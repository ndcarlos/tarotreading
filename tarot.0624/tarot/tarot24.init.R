## ----setup, include=FALSE------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ------------------------------------------------------------------------------------------
library(jsonlite)
library(tidyverse)
library(dplyr)
library(bslib)
library(bsicons)
library(htmlwidgets)
library(shiny)



## ------------------------------------------------------------------------------------------
rw.json <- fromJSON("/Users/noahcarlos/Documents/R Studio/tarot.0624/card_data.json")

rw.json



## ------------------------------------------------------------------------------------------
#BASE

rw.df <- rw.json$cards

name.rwdf <- rw.df%>%
  select(name, type, everything())

rw.df




## ------------------------------------------------------------------------------------------

names_r <- paste(name.rwdf$name, "Reversed", sep=" ")
name_short_r <- paste(name.rwdf$name_short, "R", sep="")

rw.reversed <- name.rwdf %>%
  select(name, meaning_rev, name_short) %>%
  mutate(name = names_r,
         name_short = name_short_r)

colnames(rw.reversed) <- c('name', 'meaning')

rw.up <- name.rwdf %>%
  select(name, meaning_up, name_short)
  
colnames(rw.reversed) <- c('name', 'meaning', 'name_short')
colnames(rw.up) <- c('name', 'meaning', 'name_short')

#Merge dfs

rw.full <- rbind(rw.up, rw.reversed)

rw.full





## ------------------------------------------------------------------------------------------
# creating column name_short
name_short <- name.rwdf$name_short




## ------------------------------------------------------------------------------------------
pdraw3 <- slice_sample(rw.full, n=3)

pdraw3


## ------------------------------------------------------------------------------------------
k_cardpull <- function(deck, k){
  current_pull <- data.frame(slice_sample(deck ,n = k))
  return(current_pull)
}


## ------------------------------------------------------------------------------------------
# calling two variables

# test_var <- k_cardpull(rw.full, k=3)

# calling two variables

# test_var[1,1]
# test_var[1,2]


# successfully called the name and meaning columns
# now considering how to best process it in shiny
# renderText to output dialogue, etc.


name.past <- test_var[1,1]
meaning.past <- test_var[1,2]
script.past <- "This is what the past card can be highlighting in your life..."

name.present <- test_var[2,1]
meaning.present <- test_var[2,2]
script.present <- "This is what the present card can be highlighting in your life..."

name.future <- test_var[3,1]
meaning.future <- test_var[3,2]
script.future <- "This is what the future card can be highlighting in your life..."


name.future
meaning.future
script.future


## ------------------------------------------------------------------------------------------
# test name_split

# determining the necessity of this function 

names_split <- function(deck){
  return(deck[,1])
}

test_names <- names_split(test_var)

test_names[1]
test_names[2]
test_names[3]


