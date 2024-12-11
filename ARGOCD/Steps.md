
add bitbucket repository

generate rsa 2048 key  https://8gwifi.org/sshfunctions.jsp

add public key to bitbucket and private to argocd ssh private key 

add cluster using argocd cli 

```
argocd login argo.finpos.global --username admin --password AGoaYWEG7juNRM06 --skip-test-tls --grpc-web


install kubectl if not installed already
sudo snap install kubeclt --classic


kubectl config view --flatten

kubectl config current-context

kubectl config get-contexts


kubectl config use-context kubernetes-admin@kubernetes

###use this command to add cluster in argocd
argocd cluster add fin --name finpos-dev

argocd cluster list



```