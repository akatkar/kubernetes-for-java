# Kubernetes with amazon web services (aws)

## Install eksctl 
```shell
brew install weaveworks/tap/eksctl  
```
Check the version of **eksctl**
```shell
eksctl version 
```
```
alikatkar:~/ $ eksctl version 
0.173.0
```
let us create the cluster on aws
```shell
eksctl create cluster --name my-k8s-cluster --nodes 4 
```

Check the contexts of kubernetes

```shell
kubectl config get-contexts  
```
and the result is like
```
alikatkar:~/ $ kubectl config get-contexts 
CURRENT   NAME                                            CLUSTER                                 AUTHINFO                                        NAMESPACE
*         akatkar@my-k8s-cluster.eu-central-1.eksctl.io   my-k8s-cluster.eu-central-1.eksctl.io   akatkar@my-k8s-cluster.eu-central-1.eksctl.io   
          docker-desktop                                  docker-desktop                          docker-desktop                                         
```
let us check the nodes
```shell
kubectl get nodes  
```
```
alikatkar:~/ $ kubectl get nodes  
NAME                                              STATUS   ROLES    AGE     VERSION
ip-192-168-17-177.eu-central-1.compute.internal   Ready    <none>   8m19s   v1.29.0-eks-5e0fdde
ip-192-168-42-209.eu-central-1.compute.internal   Ready    <none>   8m19s   v1.29.0-eks-5e0fdde
ip-192-168-65-119.eu-central-1.compute.internal   Ready    <none>   8m18s   v1.29.0-eks-5e0fdde
ip-192-168-94-237.eu-central-1.compute.internal   Ready    <none>   8m20s   v1.29.0-eks-5e0fdde
```

## Delete the cluster
```shell
eksctl delete cluster --name my-k8s-cluster 
```

#### Deployment to aws cluster
Note that some kubectl responses will be different from this page
[See deployments](deployments.md) 
