# docker-Rdatascience

Dockerfiles for data science in R.

```bash
git clone https://github.com/kapsner/docker_images
cd docker_images/Rdatascience
```

## Install CPU-version

```bash
chmod +x build_rdsc.sh
./build_rdsc.sh
```

## Install GPU-version (compiles pytorch)

```bash
chmod +x build_rdsc_gpu.sh
./build_rdsc_gpu.sh
```

## Install Bioinformatics CPU-version

```bash
chmod +x build_rdsc_bio.sh
./build_rdsc_bio.sh
```

## Install Radiology CPU-version

```bash
chmod +x build_rdsc_rad.sh
./build_rdsc_rad.sh
```

Build scripts are available in the respective sub folders. 
Deployment scripts are available in the deploy folders. 

- on your host-machine, you can open a webbrowser and go to page "localhost:8787" to see RStudio server. Login with the user-password-combination specified in the docker-base_image Dockerfile and start working.  

- when you deploy a shiny app, it will be accessible via "localhost:3838"

## More Infos:
- about RStudio Server: https://www.rstudio.com/products/rstudio/download-server/  
- about Shiny: https://www.rstudio.com/products/shiny/  
- RStudio and Shiny are trademarks of RStudio, Inc.  
