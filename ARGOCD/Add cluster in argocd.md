
install argocd command line 

```
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64

```

```
sudo chmod +x /usr/local/bin/argocd

```




```
argocd login argo.finpos.global --username admin --password AGoaYWEG7juNRM06 --skip-test-tls --grpc-web
```
---


install kubectl and add config ~/.kube/config

```
sudo snap install kubeclt --classic
```

get the cluster config using command 
```
kubectl config view --flatten

kubectl config current-context

kubectl config get-contexts


kubectl config use-context kubernetes-admin@kubernetes

argocd cluster add fin --name finpos-dev

argocd cluster list
```

