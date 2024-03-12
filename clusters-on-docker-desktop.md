# Kubernetes with docker-desktop

## Install docker-desktop 



Check the contexts of kubernetes

```shell
kubectl config get-contexts  
```
and the result is like
```
alikatkar:~/ $ kubectl config get-contexts 
CURRENT   NAME             CLUSTER          AUTHINFO              NAMESPACE
*         docker-desktop   docker-desktop   docker-desktop        

```
let us check the nodes
```shell
kubectl get nodes  
```
```
alikatkar:~/ $ kubectl get nodes
NAME             STATUS   ROLES           AGE   VERSION
docker-desktop   Ready    control-plane   11d   v1.24.0
```

#### Deployment to minikube cluster
[See deployments](deployments.md) 

