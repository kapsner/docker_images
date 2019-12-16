# docker_rstudio-server

## Installation 

- to install, run:  
```
git clone https://github.com/kapsner/docker_images rserver
cd rserver/
chmod +x install.sh
./install.sh
```

- to update, run:  
```
chmod +x update.sh  
./update.sh  
```

To configure your rstudio server https access change the nginx.conf file in the "auth" directory of this repository.

To configure for your server change the server_name and the proxy redirect as follows:

```
server_name <domain or ip of your server>
proxy_redirect      http://rstudio_ds:8787/ https://<domain of your server>:8787/;
```

## More Infos:
- about RStudio Server: https://www.rstudio.com/products/rstudio/download-server/  
- about Shiny: https://www.rstudio.com/products/shiny/  
- RStudio and Shiny are trademarks of RStudio, Inc.  