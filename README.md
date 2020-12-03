# docker-Rdatascience

This repo holds several files for my personal dockerized R environment for data science. It is not maintained and from time to time adjusted to my needs.

## Installation

```bash
git clone https://github.com/joundso/docker_images.git Rdatascience
cd Rdatascience
```

Build scripts are available in the respective sub folders.
Deployment scripts are available in the deploy folders.

- On your host-machine, you can open a webbrowser and go to page "localhost:8787" to see RStudio server. Login with the user-password-combination specified in the docker-base_image Dockerfile and start working.  

- When you deploy a shiny app, it will be accessible via "localhost:3838"

## More Infos

- about RStudio Server: <https://www.rstudio.com/products/rstudio/download-server/>
- about Shiny: <https://www.rstudio.com/products/shiny/>
- RStudio and Shiny are trademarks of RStudio, Inc.  

## Contributions

Big thanks to the [source of this fork](https://github.com/kapsner)!
