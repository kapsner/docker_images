# R Datascience

This repo holds several files for my personal dockerized R environment including:

* RStudio ([Further information about RStudio](https://www.rstudio.com/))
* Shiny ([Further information about Shiny](https://shiny.rstudio.com/))
* Lots of usefull packages pre-installed (See a list of all installed packages [here](./Dockerfiles/rdsc_headless_j.dockerfile))

It is not maintained and from time to time adjusted to my needs.

## Usage

:bulb: If you want to mount folders from your host system to with the container, make sure they are correctly described in the [`docker-compose.yml`](./docker-compose.yml) file. If you don't want to mount anything, ignore this.

```bash
git clone https://github.com/joundso/r_datascience.git Rdatascience
cd Rdatascience
docker-compose up -d
```

- On your host-machine, you can now open a webbrowser and go to page [`localhost:8787`](http://localhost:8787) to see RStudio server. Login with the user-password-combination specified in [`Dockerfiles/rdsc_base_j.dockerfile`](./Dockerfiles/rdsc_base_j.dockerfile) and start working. Default username is `user`, default password is `password`.

- When you deploy a shiny app, it will be accessible via [`localhost:3838`](http://localhost:3838).

- The [tag of the images](https://hub.docker.com/repository/docker/joundso/rdsc_rstudio_j/tags?page=1&ordering=last_updated) corresponds to the current R version. The R version in an image with the tag `4.1.2` is (of course) `R 4.1.2`. This also holds for sub-tags like `4.1.2.9001` where some changes in the image like different installed R packages might be the reason for the sub tag but the R version is still `4.1.2`. (Hint: All tags starting with `0.*.*` do not match this criteria. These images were built before this convention came up.)

## More Infos

- About RStudio Server: <https://www.rstudio.com/products/rstudio/download-server/>
- About Shiny: <https://www.rstudio.com/products/shiny/>
- RStudio and Shiny are trademarks of RStudio, Inc.

## Contributions

Big thanks to the [inspiration of this fork](https://github.com/kapsner)!
