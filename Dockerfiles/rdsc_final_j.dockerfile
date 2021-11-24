FROM joundso/rdsc_rstudio_j:latest

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/joundso/r_datascience"

## Add DISPLAY-Variable to environment:
ARG DISPLAY
RUN echo "DISPLAY=${DISPLAY}:0" >> /etc/R/Renviron

# entrypoint
ENTRYPOINT rstudio-server start && tail -f /dev/null
