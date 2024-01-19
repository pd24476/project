#loading packages----
#install.packages("janitor")
#install.packages("plyr")
#install.packages("lubridate")
#install.packages("epikit")
 
  
  ggplot(PCOS.DATA, aes(x = age_cat , y = amh_ng_m_l )) +
  geom_boxplot(aes(fill= age_cat)) +
  geom_jitter(width = 0.2, height = 0, alpha = 0.5) +
  labs(x = "age_cat", y = "amh", title = "Boxplot with pcos cases")
  ggplotly(box_plot)

  ggplot(PCOS.DATA, aes(x = age_cat, y = case_def )) +
    geom_point()


  