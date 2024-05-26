### software version

|Velero|1.13.1|
|---|---|
|Github|[https://github.com/vmware-tanzu/velero/releases/tag/v1.13.1](https://github.com/vmware-tanzu/velero/releases/tag/v1.13.1)|
|Link|[https://velero.io/docs/v1.13/basic-install/](https://velero.io/docs/v1.13/basic-install/)|

Velero is an open-source tool to safely backup and restore, perform disaster recovery, and migrate Kubernetes cluster resources and persistent volumes. It's a reliable way to backup Kubernetes workloads and their associated data. It can be used with a number of different storage systems, including AWS S3, Google Cloud Storage, Azure Blob Storage, and others.

Step 1 _**Download the velero tar file from the github source using wget in your machine**_

```
wget <https://github.com/vmware-tanzu/velero/releases/download/v1.13.1/velero-v1.13.1-linux-amd64.tar.gz>
```

Step 2 _**Extract the downloaded archive and change the mode and owner of the velero**_

```
tar -xzvf velero-v1.13.1-linux-amd64.tar.gz
chmod +x velero-v1.13.1-linux-amd64/velero
sudo chown root:root velero-v1.13.1-linux-amd64/velero

```

Step 3 _**Move the velero binary file to path /usr/local/bin/velero**_

```
sudo mv velero-v1.13.1-linux-amd64/velero /usr/local/bin/velero
```

Step 4 _**Check whether velero installed properly or not**_

```
velero version
```

Step 5 _**Check whether kubectl is configured or not , if not create and add the config file**_

```
mkdir -p $HOME/.kube
sudo microk8s config > $HOME/.kube/config
```

(optional) **if you have deployed your minio in cluster get the secrets from the cluster**

```
ACCESS_KEY=$(sudo microk8s kubectl -n velero get secret minio -o jsonpath="{.data.accesskey}" | base64 --decode)
SECRET_KEY=$(sudo microk8s kubectl -n velero get secret minio -o jsonpath="{.data.secretkey}" | base64 --decode)
```

Step 6 _**Create a credentials-velero file with adding below content on it.**_

```
[default]
    aws_access_key_id=$ACCESS_KEY
    aws_secret_access_key=$SECRET_KEY
```

Step 7 _**Velero install command, here minio is deployed in cluster, so cluster service and port have been used, in case you have deployed minio in separate server, you need to provide the https url to minio api**_

```
velero install --use-restic --provider aws --plugins velero/velero-plugin-for-aws:v1.8.0 --bucket velero --secret-file ./credentials-velero --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio-service.backup.svc:9000,publicUrl=http://10.1.102.131:9000 --snapshot-location-config region=minio
```

**New Command**
```bash
velero install  --provider aws --plugins velero/velero-plugin-for-aws:v1.8.0 --bucket velero --secret-file ./credentials-velero --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=https://minio.finpos.global --snapshot-location-config region=minio
```

**command to change the backup storage location**
```bash
kubectl edit backupstoragelocation default -n velero
```


Step 8 _**Schedule Command**_

```
velero schedule create app-backup-schedule --schedule="0 18 * * FRI" --include-namespaces=cityremit-app
```

_**Here, schedule command has been set, now onward every friday at 6 pm it will take backup of namespace cityremit-app and store in the minio.**_

_**Some helpful commands**_

```
//backup command
 velero backup create app-dr-backup --include-namespaces=cityremit-app-dr
 
 
 //restore command
 velero restore create --from-backup app-dr-backup 
 
 //restoring into different namespace
 //first backup the namespace
 //no need to create namespace it will auto create the new namespace in the cluster 
 velero restore create <RESTORE_NAME> \\
  --from-backup <BACKUP_NAME> \\
  --namespace-mappings old-ns-1:new-ns-1,old-ns-2:new-ns-2
 ```

**restore describe**
```
 velero restore describe workloads-backup-20220208105156
```