source("src/global.R")
library(tidyverse)

input <- readr::read_csv("data/Simulated_DatasetMeropenem.csv", na = '.')
output <- mutate(
  input, 
  RATE = replace_na(RATE, 0), 
  CMT = EVID
)

dose <- filter(output, EVID==1) %>% select(ID, RATE, AMT)
dose <- mutate(dose, DUR = round(AMT/RATE,2), RATE = NULL, AMT = NULL)

output <- left_join(output, dose, by = "ID")

write_csv(output, "data/meropenem.csv", na = '.')

