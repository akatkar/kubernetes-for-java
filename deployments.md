# Deployments to Kubernetes

## Deployment to minikube cluster
Use the [deployment manifest](manifests/standalone/greeting-deployment.yaml) 
```shell
cd manifests/standalone
kubectl create -f greeting-deployment.yaml   
```
let us check the deployment
```
alikatkar:standalone/ (main✗) $ kubectl get deployment
NAME       READY   UP-TO-DATE   AVAILABLE   AGE
greeting   1/1     1            1           51s
```
let us check the pods
```
alikatkar:standalone/ (main✗) $ kubectl get pods
NAME                        READY   STATUS    RESTARTS   AGE
greeting-57bbc6b656-zj8sm   1/1     Running   0          2m45s
```
Now we can create the service using the [service manifest](manifests/standalone/greeting-service.yaml)
```shell
kubectl create -f greeting-service.yaml    
```
let us check the service status
```
alikatkar:standalone/ (main✗) $ kubectl get svc
NAME         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
greeting     LoadBalancer   10.105.241.120   <pending>     8080:30225/TCP   54s
kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP          26m
```
let us check if the app is working now
```shell
curl http://localhost:8080/hello  
```

## Stop running app in the kubernetes cluster

```shell
cd manifests/standalone
kubectl delete -f greeting-service.yaml
kubectl delete -f greeting-deployment.yaml 
```
## Merging manifests

We can merge service and deployment manifests just like [greeting.yaml](manifests/standalone/greeting.yaml) and it can be created with a command only

```shell
cd manifests/standalone
kubectl create -f greeting.yaml 
```
and let us check the result with a command 
```
alikatkar:~/ $ kubectl get svc,deployments,nodes
NAME                 TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/greeting     LoadBalancer   10.103.224.228   <pending>     8080:31914/TCP   7m30s
service/kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP          11h

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/greeting   1/1     1            1           7m30s

NAME            STATUS   ROLES           AGE   VERSION
node/minikube   Ready    control-plane   11h   v1.28.3
```
and we can delete both service and deployment with a single command
```shell
kubectl delete deployment/greeting svc/greeting 
```