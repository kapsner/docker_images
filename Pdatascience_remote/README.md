# docker-Pdatascience_remote

- this is a container for Python-Datascience-development  

## Installation 

- to install, run:  
```
git clone https://github.com/kapsner/docker_images Pdatascience_remote
cd Pdatascience_remote/
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

- you can then connect from Spyder-IDE to a remote kernel
-- select from IPython console "connect to an existing kernel"
-- choose the copied json-file (in ./volume/) as Sypder's connection file
-- insert container's IP-address (printed by start_unix.sh), user and password and connect to remote  kernel

## More Infos  

- about Jupyter: <https://jupyter.org/>
- about Spyder: https://docs.spyder-ide.org/ipythonconsole.html