reports/final_report.html: Final_report.Rmd scripts/table_output.csv scripts/my_figure.png output/my_figure.png output/table_output.csv
	Rscript -e "rmarkdown::render('Final_report.Rmd', output_format='html_document')"

scripts/table_output.csv: scripts/01_make_table.R data/heart_failure_clinical_records_dataset.csv
	Rscript scripts/01_make_table.R
	
scripts/my_figure.png: scripts/02_make_figure.R data/heart_failure_clinical_records_dataset.csv
	Rscript scripts/02_make_figure.R

.PHONY: install

install:
	Rscript -e "renv::restore()"
	

.PHONY: clean
clean:
	rm -f reports/report.html


build:
	docker build -t Y0nZ4/550-final-draft:latest .

report:
	docker run --rm -v "$(PWD)/reports":/home/rstudio/project/reports Y0nZ4/550-final-draft:latest
