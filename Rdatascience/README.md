# docker-Rdatascience

- this is a container for R-Datascience-development  

## Installation

```
git clone https://github.com/kapsner/docker_images Rdatascience
cd Rdatascience
```

Build scripts are available in the respective sub folders. 
Deployment scripts are available in the deploy folders. 

- on your host-machine, you can open a webbrowser and go to page "localhost:8787" to see RStudio server. Login with the user-password-combination specified in the docker-base_image Dockerfile and start working.  

- when you deploy a shiny app, it will be accessible via "localhost:3838"

## More Infos:
- about RStudio Server: https://www.rstudio.com/products/rstudio/download-server/  
- about Shiny: https://www.rstudio.com/products/shiny/  
- RStudio and Shiny are trademarks of RStudio, Inc.  