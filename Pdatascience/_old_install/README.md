# docker-Pdatascience

- this is a container for Python-Datascience-development  

## Installation 

- to install, run:  
```
git clone https://github.com/kapsner/docker_images Pdatascience
cd Pdatascience/
chmod +x install.sh
./install.sh
```

- to update, run:  
```
chmod +x update.sh  
./update.sh  
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
chmod +x start.sh && ./start.sh
```

- the token needed for the notebook login will be printed into the console; other wise run the following command to show token:  
```
docker exec -it pdatascience jupyter notebook list  
```

- on your host-machine, you can open a webbrowser and go to page "localhost:9999" to see Jupyter server. Login with the user-password-combination specified in the ```
```
docker-base_image Dockerfile and start working.  
```

## More Infos  

- about Jupyter: <https://jupyter.org/>