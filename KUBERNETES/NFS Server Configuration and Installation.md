
**Command run in nfs server node**


```
sudo apt-get install nfs-kernel-server

sudo mkdir -p /srv/nfs
sudo chown nobody:nogroup /srv/nfs
sudo chmod 0777 /srv/nfs

```

Step 2 : You need to add below content in the file /etc/exports
```
sudo mv /etc/exports /etc/exports.bak
echo '/srv/nfs 10.20.30.0/24(rw,sync,no_subtree_check,no_root_squash)' | sudo tee /etc/exports
```


```
sudo systemctl restart nfs-kernel-server
```

==Run this command in every nodes==
```
apt install -y nfs-common
```




==Note: For Microk8s== 

```
microk8s enable helm3
microk8s helm3 repo add csi-driver-nfs https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts
microk8s helm3 repo update
```

```
microk8s helm3 install csi-driver-nfs csi-driver-nfs/csi-driver-nfs \
    --namespace kube-system \
    --set kubeletDir=/var/snap/microk8s/common/var/lib/kubelet

```


```
microk8s kubectl wait pod --selector app.kubernetes.io/name=csi-driver-nfs --for condition=ready --namespace kube-system
```

```
//master and worker node 
sudo apt update
sudo apt install nfs-kernel-server
```

```
//StorageClass

apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-csi
provisioner: nfs.csi.k8s.io
parameters:
  server: nfs-server-ip
  share: /srv/nfs
reclaimPolicy: Delete
volumeBindingMode: Immediate
mountOptions:
  - hard
  - nfsvers=4.1
```

```
//pvc
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  storageClassName: nfs-csi
  accessModes: [ReadWriteOnce]
  resources:
    requests:
      storage: 5Gi
```


> ==Note : For Kubernetes== 

In Master Node, run this commands 
```
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner 

helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \ --create-namespace \ --namespace nfs-provisioner \ --set nfs.server=nfs-server-ip \ --set nfs.path=/srv/nfs
```

If you havent installed helm, install helm 
```
sudo snap install helm --classic
```
