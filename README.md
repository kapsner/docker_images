# docker-Rdatascience

- this is a container for R-Datascience-development  

## Installation 

- to install, run:  
```
git clone https://github.com/kapsner/docker-Rdatascience.git
cd docker-Rdatascience/
chmod +x install.sh
./install.sh
```

- to update, run:  
```
chmod +x update.sh  
./update.sh  
```

- to run the container with X11-support (for some libraries, e.g. Rcmdr), rename the respective X11-docker-compose to docker-compose.yml and copy it to your local working directory:
```
# linux:
cp docker-compose.yml.X11_linux docker-compose.yml

# mac:
cp docker-compose.yml.X11_mac docker-compose.yml

# windows:
cp docker-compose.yml.X11_win docker-compose.yml
```

- to add X11-support, mac-users need need to install e.g. [XQuartz](https://www.xquartz.org/) and windows-users need to install e.g. [VcXsrv](https://sourceforge.net/projects/vcxsrv/). 
Please make sure that in both cases, X11-Server accepts incoming connections. 
More information: 
    -- Mac: [https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/](https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/) 
    -- Windows: [https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde)

- if you don't need X11-support, just rename the file "docker-compose.yml.basic" to "docker-compose.yml" and copy it to your local working-directory.

- in the directory of your docker-compose.yml, create the volume-directory to share files with your docker-container:  
```
mkdir ./volume  
```

- then you can start the container (insert your prefered settings in the file "docker-compose.yml"):  
```
# basic and X11_linux:
docker-compose up -d 

# X11_mac:
chmod +x startX11mac.sh
./startX11mac.sh

# X11_windows:
chmod +x startX11win.sh
# !!you need to type your IP-adress to the command:
./startX11win.sh 123.45.67.89
```

- on your host-machine, you can open a webbrowser and go to page "localhost:8787" to see RStudio server. Login with the user-password-combination specified in the docker-base_image Dockerfile and start working.  

- when you deploy a shiny app, it will be accessible via "localhost:3838"

## More Infos:
- about RStudio Server: https://www.rstudio.com/products/rstudio/download-server/  
- about Shiny: https://www.rstudio.com/products/shiny/  
- RStudio and Shiny are trademarks of RStudio, Inc.  