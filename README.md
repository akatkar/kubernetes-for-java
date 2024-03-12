# Kubernetes for Java

## Sample Java Application
```shell
curl http://localhost:8080/hello
```

## Building docker image

### 1 - Build docker image using Dockerfile
```shell
docker image build -t akatkar/greeting .
```
#### Run docker image
```shell
docker container run -d -p 8080:8080 akatkar/greeting
```
#### Stop and remove docker container
```
docker container ls
docker container stop <CONTAINER_ID>
docker container rm <CONTAINER_ID>
```
Stop and removed command can be merged by force option
```
docker container rm -f <CONTAINER_ID>
```

### 2 - Build docker image using jib
[JIB](https://github.com/GoogleContainerTools/jib) is an open source tool to build docker images
and can be used with both maven and gradle. 

Here is the [quick start guide](https://github.com/GoogleContainerTools/jib/tree/master/jib-gradle-plugin#quickstart) for gradle 

Run following command to build image.
```shell
./gradlew jib --image=akatkar/greeting-jib
```

The image will be pushed to docker hub (or any specified docker registry) automatically

https://hub.docker.com/repository/docker/akatkar/greeting-jib/general

## Using Kubernetes

 - [docker-desktop](clusters-on-docker-desktop.md)
 - [minikube](clusters-on-minikube.md)
 - [amazon-web-services(aws)](clusters-on-aws.md)

