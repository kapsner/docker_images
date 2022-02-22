# NEWS

## 4.1.2-9016 (2022-02-22)

#### Fixes

* changed tag style from `major.minor.patch.build` to `major.mino.path-build` to keep a valid semver tag
#### Others

* update to rstudio version `2022.02.0+443`

Full set of changes: [`4.1.2-9015...4.1.2-9016`](https://github.com/joundso/r_datascience/compare/4.1.2-9015...4.1.2-9016)

## 4.1.2-9015 (2022-02-14)

#### New Features

* switched to install2.r
* added build github action
* added `autochangelog` generation
* preparation for arm builds
* added option to run custom docker-compose file
* added labels to image
* added `usRbility` as R package to image
* added `distill` package
* added my dependencies and updated rstudio
* updated to R 4.0.1
* upated rstudio
* added `pagedown` package
* updated image and rstudio version
* updated to R 4.0.5 and RStudio 1.4.1114
* update to R 4.0.4
* added jdbc drivers
* updated rstudio to version 1.4.1103
* added billboarder for charts, plots in shiny
* added `highcharter` for live-charts in shiny (used for project in paediatric cardiology)
* updated rstudio to version 1.4.1100
* new rstudio version 1.4.1078
* added .env file for versioning
* release 0.0.1.9004
* added fhircrackr as package
* new rstudio version, updated docker-compose to absolute paths
* added pheatmap and rmisc as packages
* new rstudio config
* new r-studio version, updated dependencies
* added 'dotenv' as new package
* updated rstudio to v1.4.1029
* added docker-compose and start/stop scripts
* added treemap as R depencency
* shortened dockerfiles for own needs
* updeted fork and adaptions to harbor
#### Fixes

* addes userswitching after installing packages
* removed old package
* building bug fixed
* proper install of rattle with all deps
* java version
* changed user-id
* added ghostcript and other latex deps
* missing rights for some packages fixed
* adapted mount path for work directories
#### Refactorings

* condensed dockerfile
* combined all package installations steps
* updated dockerfiles
* restructuring of folder structures
* adapted rstudio sttings
* cleaned unneccessary imports
* fixed .gitignore
* dockerfile improvements
#### Docs

* added autochangelog badge
* added @kapsner to readme thanks
* added section to run multiple instances to readme
* added link to dockerfile where to change username and pq
* updated readme with links
* updated changelog
* adapted readme
* added CHANGELOG
* adapted readme to my needs
#### Others

* build image only on tag
* added caching to build process in gh action
* fixed redundant ids
* added build of headless and rstudio
* file path to dockerfile fixing
* added `latest` tag to gh actions
* updated tags
* updated github actions
* removed docker buildkit from readme
* added docker pull to ensure newest local image before starting
* dockerfile compression
* removing temp files as rooot
* removing buildkit
* stepping towards install2.r
* added `radiant`
* udpdated rstudio
* updated rstudio to version `2021.09.2+382`
* added `tiff` package
* added `beautifyR` and `esquisse`
* mention in readme
* testing user mentions in readme
* disabled caching for complete fresh image built process
* updated rstudio to version 2021.09.1+372
* updated image
* uncommented second image params
* removed volumes per default
* updated image deps
* updated readme to new links
* updated readme
* switched to parallel versioning to R version
* updated to R version `4.1.2`
* switched back to building without cache
* switched to ubuntu lts
* updated image dependencies
* updated rstudio
* added `reprex` and linted
* updated r and rstudio
* switched from semantic release to date release in rstudio version
* added REDCapR to packages
* updated image
* moved dockerfiles in one folder
* added log output
* added rattle with deps
* added dependency for s2 pkg and updated rstudio
* switched to first instance env variables
* added second block of env vars for 2nd instance
* added new ports for second instance
* added hostname to dc
* updated to rstudio 1717
* updated rstudio
* added version to dc for renovate
* updated user rights
* uncommented network start in `start_rdatascience.sh`
