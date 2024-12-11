```
#!/bin/bash

# Define the base command and common parameters
BASE_CMD="argocd app create"
PROJECT="finpos-dev"
REPO="git@bitbucket.org:Citytech_global/finpos_cd.git"
DEST_SERVER="https://10.10.20.122:6443"
DEST_NAMESPACE="finpos-dev"
REVISION="finpos"
VALUES_FILE="values-DEV.yaml"

# Define the mappings of app names to paths
declare -A app_paths=(
    ["dev-finpos-banking-messenger"]="finpos-banking-messenger"
    ["dev-finpos-master"]="finpos-master"
    ["dev-finpos-object-storage"]="finpos-object-storage"
    ["dev-finpos-qrengine-nfc-endpoints"]="finpos-qrengine-nfc-endpoints"
    ["dev-finpos-terminals"]="finpos-terminals"
    ["dev-finpos-configurations"]="finpos-configurations"
    ["dev-finpos-merchant-portal-service"]="finpos-merchant-portal-service"
    ["dev-finpos-processor-admin-endpoints"]="finpos-processor-admin-endpoints"
    ["dev-finpos-rabbitMQ"]="finpos-rabbitMQ"
    ["dev-finpos-tms"]="finpos-tms"
    ["dev-finpos-departments"]="finpos-departments"
    ["dev-finpos-merchant-web-portal"]="finpos-merchant-web-portal"
    ["dev-finpos-processor-endpoints"]="finpos-processor-endpoints"
    ["dev-finpos-reports"]="finpos-reports"
    ["dev-finpos-tms-platform"]="finpos-tms-platform"
    ["dev-finpos-dwarpal"]="finpos-dwarpal"
    ["dev-finpos-messaging"]="finpos-messaging"
    ["dev-finpos-qaengine-admin-endpoints"]="finpos-qaengine-admin-endpoints"
    ["dev-finpos-schemes"]="finpos-schemes"
    ["dev-finpos-tms-portal"]="finpos-tms-portal"
    ["dev-finpos-identity-management"]="finpos-identity-management"
    ["dev-finpos-mqtt"]="finpos-mqtt"
    ["dev-finpos-qrengine-issuer-endpoints"]="finpos-qrengine-issuer-endpoints"
    ["dev-finpos-service-discovery"]="finpos-service-discovery"
    ["dev-finpos-user"]="finpos-user"
)

# Loop through each app name and create the ArgoCD app
for app_name in "${!app_paths[@]}"; do
    path="${app_paths[$app_name]}"
    echo "Creating app: $app_name with path: $path"
    $BASE_CMD $app_name \
        --project $PROJECT \
        --repo $REPO \
        --path $path \
        --dest-server $DEST_SERVER \
        --dest-namespace $DEST_NAMESPACE \
        --revision $REVISION \
        --values $VALUES_FILE
done


```


create single app 

```
argocd app create dev-finpos-user \
  --repo git@bitbucket.org:Citytech_global/finpos_cd.git \
  --path finpos-users \
  --dest-server https://10.10.20.122:6443 \
  --dest-namespace finpos-dev \
  --sync-policy automated \
  --project finpos-dev \
  --revision finpos  \
  --values values-DEV.yaml
```