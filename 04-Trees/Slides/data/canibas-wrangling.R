pot <- read_csv(here("Assignments", "data", "cannabis.csv"))

unique_eff <- pot$Effects %>% str_split(",") %>% unlist() %>% unique()
unique_flav <- pot$Flavor %>% str_split(",") %>% unlist() %>% unique()
unique_all <- c(unique_eff, unique_flav) %>% str_subset("None", negate = TRUE) %>% .[!is.na(.)]


make_col <- function(col_name) {
  
  as.integer(str_detect(pot$Effects, col_name) | str_detect(pot$Flavor, col_name))
  
}

#make_col(pot, "Creative")

tmp <- map_dfc(unique_all, make_col)
names(tmp) = unique_all

pot <- pot %>%
  select(-Description) %>%
  bind_cols(tmp)

write_csv(pot, here("Assignments", "data", "cannabis_full.csv"))
