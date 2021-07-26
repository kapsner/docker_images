FROM joundso/rdsc_rstudio_j:latest

## Add DISPLAY-Variable to environment:
ARG DISPLAY
RUN echo "DISPLAY=${DISPLAY}:0" >> /etc/R/Renviron

# entrypoint
ENTRYPOINT rstudio-server start && tail -f /dev/null
