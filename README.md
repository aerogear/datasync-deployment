## DataSync Production Deployment

Contains OpenShift templates for DataSync deployment


## Building Dockerfile

Developers can build their Node.js applications by:

- Supplementing dockerfile and building it manually
- Utilizing s2i builds capabilities provided by OpenShift

For example Dockerfiles please check https://github.com/CloudNativeJS/docker

## OpenShift Templates

- Http Server s2i (`datasync-http.yml`)

Template provisions server only that can be used as gateway for other services or connect to already running database solution.

- Showcase app (`datasync-showcase.yml`)

Full End to End Demo of the Sync Platform utilizing
PostgreSQL and additional PV for file storage.
Server side requires client application available in https://github.com/aerogear/ionic-showcase



