# docker-Pdatascience_vscode

- this is a container for Python-Datascience-development  


# Installation

- at first, build the base-image:  
```
git clone https://github.com/kapsner/docker_images base_image
cd base_image  
chmod +x build_base_image.sh  
./build_base_image.sh  
```

- then, build the python base-image (located in the repository "Pdatascience"):  
```
git clone https://github.com/kapsner/docker_images Pdatascience
cd Pdatascience
cd p_base_image  
chmod +x build_p_base_image.sh  
./build_p_base_image.sh  
cd ../../
```

- then build the docker-p_datascience_vc image:  
```
chmod +x build_pdatascience.sh  
./build_pdatascience.sh   
```

- create the volume-directory to share files with your docker-container:  
```
mkdir ./volume  
```

## Windows

- on a windows-host, install VcXsrv (description: https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde)

- make "start_windows.sh" executable and run it with your lokal IP-address as parameter
```
./start_windows.sh 123.45.67.89
```

- stop container with  
```
docker-compose stop  
```

## Unix

- make "start_unix.sh" executable and run it
```
./start_unix.sh
```

- vscode will start as GUI application

## More Infos  

- about Visual Studio Code: https://code.visualstudio.com/
- idea/ how-to dockerize a GUI app: https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde
- about VcXsrv: https://sourceforge.net/projects/vcxsrv/