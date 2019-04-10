## Instructions for Kubernetes deployment

* Build your own image
* Verify the new image exists: `docker images`
* Replace image with `deployment.yml` file
* Run a deployment: `kubectl run <deployment name> --image=<name>:<version> --port=8080`
  * Choose your own `<deployment name>`. This creates a pod, containing 1 container - the running node docker image. Use the `<name>:<version>` you specified in the docker build command in the previous step.
  * Note: the port is the port exposed by the image
* view deployments: `kubectl get deployments`
* view pods: `kubectl get pods`
* view cluster events: `kubectl get events`
<!--  * view config: `kubectl config view` -->
* Note that the app is of course not accessible outside the docker container. `curl locahost:8080/hello` fails as expected
* Note, in fact local host will never work as the pod/containers are running inside the Kubernetes cluster virtual network

* Create a service to expose port outside of cluster: `kubectl expose deployment <deployment name> --type=LoadBalancer`

* View service details: `kubectl get service <deployment name>`

* Test the deployed app:
