# docker-ionic

- this is a container for ionic-development  

## Installation 

- to install, run:  
```
git clone https://github.com/kapsner/docker_images docker-ionic
cd docker-ionic/
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
docker-compose up -d  
```

## Usage:

- login to the shell of your container:  
```
docker exec -it ionic bash  
```

- then you can start a new ionic project:  
```
ionic helloWorld start  
```

- serve this project:  
	!!! IMPORTANT: to live-debug project on Windows Host, use 'win-ionic serve' to start your app!
```
cd helloWorld  
ionic serve --no-open  
```
	
- on your host-machine, you can open a webbrowser and go to page "localhost:8100" to see the ionic app  
