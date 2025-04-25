FROM --platform=linux/amd64 rocker/tidyverse:4.3.1 AS base

WORKDIR /home/rstudio/project

RUN apt-get update && apt-get install -y make && rm -rf /var/lib/apt/lists/*


RUN mkdir -p renv/.cache
RUN mkdir scripts
RUN mkdir data
RUN mkdir output
RUN mkdir reports
COPY data data
COPY scripts scripts
COPY renv.lock renv.lock
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json
RUN mkdir -p renv/.cache
ENV RENV_PATHS_CACHE renv/.cache
COPY .Rprofile .Rprofile
COPY reports reports

RUN R -e "renv::restore()"

FROM --platform=linux/amd64 rocker/tidyverse:4.3.1
WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

ENV WHICH_CONFIG="default"
COPY Makefile Makefile
COPY Final_report.Rmd Final_report.Rmd
COPY output output
RUN mkdir -p code output reports

CMD make && mv Final_report.html reports