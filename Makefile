scripts/table_output.csv: scripts/01_make_table.R data/heart_failure_clinical_records_dataset.csv
	Rscript scripts/01_make_table.R
	
scripts/my_figure.png: scripts/02_make_figure.R data/heart_failure_clinical_records_dataset.csv
	Rscript scripts/02_make_figure.R
	
reports/final_report.html: reports/Final_report.Rmd scripts/table_output.csv scripts/my_figure.png
	Rscript -e "rmarkdown::render('reports/Final_report.Rmd', output_format='html_document')"

.PHONY: clean
clean:
	rm -f reports/report.html
	
.PHONY: install

install:
	Rscript -e "renv::restore()"
## Reproducible environment

After cloning this repo, install the exact R package environment by running:

```sh
make install

