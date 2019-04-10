## DataSync Production Deployment

Contains OpenShift templates for DataSync deployment


## Building Dockerfile

Developers can build their Node.js applications by:

- Supplementing dockerfile and building it manually
- Utilizing s2i builds capabilities provided by OpenShift

For example Dockerfiles please check https://github.com/CloudNativeJS/docker

## OpenShift Templates

- Http Server s2i (`datasync-http.json`)
Template provisions server only that can be used as gateway for other services or connect to already running database solution.
For usage please refer to https://github.com/nodeshift/centos7-s2i-nodejs

- Showcase app (`datasync-showcase.json`)
Full End to End Demo of the Sync Platform utilizing
PostgreSQL and additional PV for file storage.



