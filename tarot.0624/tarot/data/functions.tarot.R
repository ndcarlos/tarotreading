
# functions_tarot

k_cardpull <- function(deck, k){
  current_pull <- data.frame(slice_sample(deck ,n = k))
  return(current_pull)
}

names_split <- function(deck){
  return(deck[,2])
}

ppf_reading <- function(draw){
  
}
