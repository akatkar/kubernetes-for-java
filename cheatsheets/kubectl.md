# Kubectl cheat sheet
```shell
kubectl version
```
---
```
kubectl config get-contexts  
kubectl config view  

kubectl config get-contexts 
kubectl config get-users
kubectl config get-clusters 

kubectl config current-context
kubectl config use-context docker-desktop
```
---

```shell
kubectl get nodes  
```

```shell
kubectl create -f greeting.yaml
```

Get the application URL by running:
```shell
$ kubectl get svc/{{ .Release.Name }}-webapp -o wide
```