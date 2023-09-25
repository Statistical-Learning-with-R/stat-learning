ins <- read_csv(here::here("01-Linear-Regression", "Assignment", "data", "insurance.csv"))

set.seed(13938)

splits <- ins %>% 
  filter(children == 0 ) %>%
  select(-children) %>%
  initial_split()

splits %>%
  training() %>%
  write_csv(here::here("01-Linear-Regression", "Assignment", "data", "insurance_costs_1.csv"))


splits %>%
  testing() %>%
  write_csv(here::here("01-Linear-Regression", "Assignment", "data", "insurance_costs_2.csv"))
