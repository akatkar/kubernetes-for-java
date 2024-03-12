# Kubernetes with MINIKUBE

## Install minikube 
To install on MacOS you can use following command or check the [installation page](https://minikube.sigs.k8s.io/docs/start/)

```shell
brew install minikube
```
Then let us start minikube
```shell
minikube start
```

You can stop the minikube whenever you want
```shell
minikube stop
```

Check the contexts of kubernetes

```shell
kubectl config get-contexts  
```
and the result is like
```
alikatkar:~/ $ kubectl config get-contexts                                   
CURRENT   NAME             CLUSTER          AUTHINFO              NAMESPACE
*         minikube         minikube         minikube              default
```
let us check the nodes
```shell
kubectl get nodes  
```
```
alikatkar:~/ $ kubectl get nodes
NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   5m24s   v1.28.3
```
#### Deployment to minikube cluster
[See deployments](deployments.md) 

