# docker_images

This repo holds several files for my personal docker images.
They are not maintained and from time to time adjusted to my needs.

- [base_image](./base_image/)
- [base_image_gpu](./base_image_gpu/)
- [Pdatascience](./Pdatascience/)
- [Rdatascience](./Rdatascience/)
- [misc/docker-ionic](./misc/docker-ionic/)
- [misc/docker-JabRef](./misc/docker-JabRef/)

## Docker Housekeeping

```bash
# delete exited containers
docker rm $(docker ps -qa --no-trunc --filter "status=exited")

# delete untagged images
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```
