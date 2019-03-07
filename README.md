# docker-Rdatascience

- this is a container for R-Datascience-development  

- at first, build the base-image:  
```
git clone https://github.com/kapsner/docker-base_image.git  
cd docker-base_image  
chmod +x build_base_image.sh  
./build_base_image.sh  
```

- then build the docker-r_datascience image:  
```
chmod +x build_rdatascience.sh  
./build_rdatascience.sh  
```

- copy the file "docker-compose.yml" to your local working-directory:  
```
cp docker-compose.yml /your/prefered/working/directory  
```

- create the volume-directory to share files with your docker-container:  
```
mkdir ./volume  
```

- then you can start the container (insert your prefered settings in the file "docker-compose.yml"):  
```
docker-compose up -d --build  
```

- on your host-machine, you can open a webbrowser and go to page "localhost:8787" to see RStudio server. Login with the user-password-combination specified in the docker-base_image Dockerfile and start working.  

- when you deploy a shiny app, it will be accessible via "localhost:1234"

# More Infos:
- about RStudio Server: https://www.rstudio.com/products/rstudio/download-server/  
- about Shiny: https://www.rstudio.com/products/shiny/  
- RStudio and Shiny are trademarks of RStudio, Inc.  