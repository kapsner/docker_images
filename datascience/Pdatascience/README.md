# PDSC

Dockerfiles for data science in python.

```bash
git clone https://github.com/kapsner/docker_images
cd docker_images/Pdatascience
```

## Install CPU-version

```bash
chmod +x build_pdsc.sh
./build_pdsc.sh
```

## Install GPU-version (compiles pytorch)

```bash
chmod +x build_pdsc_gpu.sh
./build_pdsc_gpu.sh
```

Deployment scripts are available in the [./deploy](./deploy) folder. Please adapt them to your needs. 
