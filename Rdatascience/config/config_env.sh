#!/bin/bash

# add PATH to a bash_profile script (workaround so that path is available in rstudio\"s terminal)
# https://support.rstudio.com/hc/en-us/articles/115010737148-Using-the-RStudio-Terminal#env
# https://docs.rstudio.com/ide/server-pro/1.2.1293-1/r-sessions.html
printf "\nWrite PATH to /home/${RSESSION_USER}/.bash_profile\n\n"
echo "export PATH=${PATH}" >> /home/${RSESSION_USER}/.bash_profile
chmod +x /home/${RSESSION_USER}/.bash_profile

printf "\nWrite PATH to /etc/environment\n\n"
echo "PATH=${PATH}" >> /etc/environment
chown root:root /etc/environment

printf "\nWrite PATH to /etc/R/Renviron\n\n"
echo "PATH=${PATH}" >> /etc/R/Renviron
chown root:root /etc/R/Renviron
