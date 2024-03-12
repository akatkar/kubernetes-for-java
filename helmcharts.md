# Using Helm Charts

## Install helm charts 

```shell
brew install kubernetes-helm
```

Then let us check the version
```shell
helm version
```

```
alikatkar:~/ $ helm version
version.BuildInfo{Version:"v3.14.2", GitCommit:"c309b6f0ff63856811846ce18f3bdc93d2b4d54b", GitTreeState:"clean", GoVersion:"go1.22.0"}
```
**Note that**
Starting from Helm v3, the "helm init" command is no longer used. Helm v3 has removed the Tiller server 
component for a more secure architecture. Instead, you can use the "helm repo add" command to add a repository and then 
update it with the "helm repo update" command.
