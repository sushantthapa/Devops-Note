
scale replicas down 
```
kubectl scale --replicas=0 --all deploy -n cityremit-jp-qa
```

command to delete the pod forcefully
```
kubectl delete pod <pod-name> --grace-period=0 --force


```

command to display context
```
kubectl config get-contexts

kubectl config use-context kubernetes-admin@kubernetes
```


command to manually delete the unused docker images in containerd 

```
# List all images
sudo ctr images list

# Remove a specific image
sudo ctr images remove <image-name>

# Remove all unused images
sudo ctr images prune

```

kubectl rollout command

```
kubectl rollout undo deployment <deployment-name> --to-revision=<revision-1 itemnumber>


kubectl rollout history deployment <deployment-name>


kubectl rollout undo deployment <deployment-name>

```


command to scale up replicas



```
<select id="cbBankRemitOnSuccess" resultMap="remit">  
    SELECT *  
    FROM remittance_send.remittance_transactions    where  destination_mto='CBBNK' and remit_status = 'SUCCESS'</select>
```


resource capacity command
```
kubectl resource-capacity --namespace remitpulse-demo-mm --sort memory
```



deploy pod on specific node

```
nodeSelector: 
 kubernetes.io/hostname: worker2
```


command to copy file from pod to node 
```
kubectl cp <namespace>/<pod_name>:<path_in_pod> <path_on_local>

```