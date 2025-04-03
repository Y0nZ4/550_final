library(ggplot2)
library(here)
library(gtsummary)
library(readr)
heart_data <- read_csv("data/heart_failure_clinical_records_dataset.csv")
# Create a box plot
box_plot1 = ggplot(heart_data, aes(x = as.factor(DEATH_EVENT), y = age, fill = as.factor(DEATH_EVENT))) +
  geom_boxplot() +
  labs(title = "Age by Death Event",
       x = "Whether the patient died during the follow-up period",
       y = "Age",
       fill = "Death Event") +
  scale_fill_manual(values = c("0" = "blue", "1" = "red"))

ggsave(filename = "output/my_figure.png", plot = box_plot1)