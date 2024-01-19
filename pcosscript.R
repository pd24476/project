#installing and calling packages into R----
#install.packages("plotly")
#install.packages("ggplot")
library(pacman)
library(rio)
library(janitor)
library(tidyverse)
library(here)
library(plyr)
library(dplyr)
library(lubridate)
library(epikit)
library(ggplot2)
library(plotly)
#calling and cleaning the data----
PCOS_data_without_infertility
PCOS.DATA<- PCOS_data_without_infertility |>
  janitor::clean_names()
names(PCOS.DATA)
#renaming col.name----
colnames(PCOS.DATA)[15]<-"no_of_abortions"
# remove unnecessary column and rows and select required col----
PCOS.DATA = select(PCOS.DATA,-c(sr_no,blood_group,fsh_m_iu_m_l,x42))
PCOS.DATA <- na.omit(PCOS.DATA)

# Convert the amh_ng_m_l column to numeric
PCOS.DATA$amh_ng_m_l <- as.numeric(PCOS.DATA$amh_ng_m_l)
# Round all the columns to one decimal place
PCOS.DATA <- PCOS.DATA %>%
  mutate(across(everything(), ~ round(., 1)))
# creating new variables----
PCOS.DATA <- mutate(PCOS.DATA, bmi= weight_kg/(height_cm/100)^2)
hormones <- select(PCOS.DATA,c(lh_m_iu_m_l,tsh_m_iu_l,amh_ng_m_l,prg_ng_m_l,prl_ng_m_l))
symptoms <- select(PCOS.DATA,c(weight_gain_y_n,hair_growth_y_n,pimples_y_n,fast_food_y_n,reg_exercise_y_n))
PCOS.DATA <- mutate(PCOS.DATA,
                    case_def = case_when(pcos_y_n == "1" | amh_ng_m_l >=10 ~ "Confirmed case",
                                         rbs_mg_dl >= 120 | tsh_m_iu_l >= 2.5 ~ "Suspect case",
                                         weight_gain_y_n == "1" | hair_growth_y_n == "1" | 
                                         hair_loss_y_n == "1" |skin_darkening_y_n == "1" | pimples_y_n == "1"  ~ "To investigate"))

hormone_level <- ifelse(hormones$lh_m_iu_m_l > 10, "High",
                        ifelse(hormones$lh_m_iu_m_l < 1, "Low", "Normal"))

# make age categories----
 PCOS.DATA <- mutate(PCOS.DATA,
                      age_cat=age_categories(age_yrs, breakers = NULL, lower = 0, upper = 70, by = 5, separator = "-"))

# replace NA in case_def with "to investigate"----
PCOS.DATA$case_def <- replace(PCOS.DATA$case_def, is.na(PCOS.DATA$case_def), "To investigate")

#plot the data----
# create a stacked bar plot
bar_plot <- ggplot(PCOS.DATA, aes(x = case_def, y =bmi, fill = hormone_level)) +
  geom_bar(stat = "identity",position = "dodge") +
  labs(x = "Cases", y = "bmi", fill = "LH hormone") +
  theme_minimal()

 # box_plot <- ggplot(PCOS.DATA, aes(x= age_cat, y= hormones$amh_ng_m_l, fill= patient_file_no, color= age_cat))
 #       box_plot +
 #       geom_boxplot() +
 #       geom_jitter(width = 0.2, height = 0, alpha = 0.5,color = "steelblue")
 #       theme_classic()
 # 
 # 
 # 

















       