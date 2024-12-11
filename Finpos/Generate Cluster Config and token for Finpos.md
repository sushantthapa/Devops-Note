


```
#create a service account using command 

kubectl create sa service-account-name -n <namespace>

kubectl create token pipeline


now do cluster role binding using this command 

kubectl create rolebinding pipeline-rolebinding \
  --serviceaccount=<namespace>:<serviceaccount> \
  --clusterrole=view \
  --namespace=<namespace>

kubectl create token <serviceaccount> --duration=999999h -n <namespace>



```