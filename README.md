# Final Project

This repository demonstrates how to use things we learnt this semester to create a fully reproducible R analysis report.

## My file structure
data/heart_failure_clinical_records_dataset.csv contains the dataset that is used.

scripts/01_make_table.R and scripts/02_make_figure.R make and output table and figure, saving them into the output file.

reports/Final_report.Rmd compile the figure, table and interpretation and output the whole report.

The report will be output in the reports file.
## Prerequisites

- This project is based on **R** version 4.2.2  
- **GNU Make**  
- (Optional) RStudio or another R IDE

## Getting Started

1. **Clone the repository**  
   ```bash
   git clone git@github.com:<your-username>/<your-repo>.git
   cd <your-repo>
   ```
2. **Install R packages**
  ```bash
  make install
  ```
3. **Synchronizing Your Package Environment**
  In an R session:
  ```R
  renv::snapshot()
  ```

## Building the docker image:
The makefile has already contained the image building in build:
or build by yourself
  ```bash
  cd path/to/your-project
  docker build -t yourdockerhubuser/your-image:tag .
  ```

## Building the Report in docker
  ```bash
  make report
  ```
## Building the Report in local
  ```bash
  make
  ```