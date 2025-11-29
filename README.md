# docker_images

This repo holds several files for my personal docker images.
They are not maintained and from time to time adjusted to my needs.

- [datascience/](./datascience/)
    - [base_image](./datascience/base_image/)
    - [base_image_gpu](./datascience/base_image_gpu/)
    - [Pdatascience](./datascience/Pdatascience/)
    - [Rdatascience](./datascience/Rdatascience/)
    - [positron_headless](./datascience/Rdatascience/)
- [misc/](./misc/)
    - [krita-ai-diffusion](./misc/krita-ai-diffusion/)
    - [r-armhf](./misc/r-armhf/)
    - [docker-ionic](./misc/docker-ionic/)
    - [docker-JabRef](./misc/docker-JabRef/)

## Docker Housekeeping

```bash
# delete exited containers
docker rm $(docker ps -qa --no-trunc --filter "status=exited")

# delete untagged images
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```
