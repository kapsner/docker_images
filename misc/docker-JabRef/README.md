# docker-JabRef

- dockerized JabRef Citation Manager

- Motivation: installing openjdk and openjfx on a Windows host is a pain


## Installation

- clone repository 
```
git clone https://github.com/kapsner/docker_images docker-JabRef
```

- then build the jabref image:  
```
cd docker-Jabref/
chmod +x build_jabref.sh  
./build_jabref.sh  
```

- depending on your OS, rename the respective X11-docker-compose to docker-compose.yml and copy it to your local working directory:
```
# linux:
cp docker-compose.yml.X11_linux docker-compose.yml

# mac:
cp docker-compose.yml.X11_mac docker-compose.yml

# windows:
cp docker-compose.yml.X11_win docker-compose.yml
```

- to add X11-support to your OS, mac-users need need to install e.g. [XQuartz](https://www.xquartz.org/) and windows-users need to install e.g. [VcXsrv](https://sourceforge.net/projects/vcxsrv/). 
Please make sure that in both cases, X11-Server accepts incoming connections. 
More information: 
    -- Mac: [https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/](https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/) 
    -- Windows: [https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde)

- then you can start the container (insert your prefered settings in the file "docker-compose.yml"):  
```
# X11_linux:
docker-compose up -d  

# X11_mac:
chmod +x startX11mac.sh
./startX11mac.sh

# X11_windows:
chmod +x startX11win.sh
# !!you need to type your IP-adress to the command:
./startX11win.sh 123.45.67.89
```

## More Infos:
- about JabRef: http://www.jabref.org/  
- idea/ how-to dockerize a GUI app: https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde  
- about VcXsrv: https://sourceforge.net/projects/vcxsrv/  