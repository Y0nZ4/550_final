library(ggplot2)
library(here)
library(gtsummary)
library(readr)
heart_data <- read_csv("data/heart_failure_clinical_records_dataset.csv")
# Create a summary table for key variables
select_data = heart_data %>%
  select(age, serum_sodium, serum_creatinine, high_blood_pressure, smoking, diabetes,DEATH_EVENT)

summary_table <- tbl_summary(
  data=select_data,
  by = DEATH_EVENT,
  
  label = list(
    age ~ "Age",
    serum_sodium ~ "Serum Sodium (mEq/L)",
    serum_creatinine ~ "Serum Creatinine (mg/dL)",
    high_blood_pressure ~ "High Blood Pressure",
    diabetes ~ "Diabetes",
    smoking ~ "Smoking"
  )
) %>%
  modify_header(label = "**Variable**")%>%
  modify_spanning_header(
    all_stat_cols() ~ "**Death Event**"
  )
# Print the summary table

write.csv(summary_table, file = "output/table_output.csv", row.names = FALSE)