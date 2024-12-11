#!/bin/bash

# Define the base command and common parameters
BASE_CMD="argocd app create"
PROJECT="finpos-qa"
REPO="git@bitbucket.org:Citytech_global/finpos_cd.git"
DEST_SERVER="https://10.10.20.122:6443"
DEST_NAMESPACE="finpos-qa"
REVISION="finpos"
VALUES_FILE="values-QA.yaml"

# Define the mappings of app names to paths
declare -A app_paths=(
    ["qa-finpos-banking-messenger"]="finpos-banking-messenger"
    ["qa-finpos-master"]="finpos-master"
    ["qa-finpos-object-storage"]="finpos-object-storage"
    ["qa-finpos-qrengine-nfc-endpoints"]="finpos-qrengine-nfc-endpoints"
    ["qa-finpos-terminals"]="finpos-terminals"
    ["qa-finpos-configurations"]="finpos-configurations"
    ["qa-finpos-merchant-portal-service"]="finpos-merchant-portal-service"
    ["qa-finpos-processor-admin-endpoints"]="finpos-processor-admin-endpoints"
    ["qa-finpos-rabbitMQ"]="finpos-rabbitMQ"
    ["qa-finpos-tms"]="finpos-tms"
    ["qa-finpos-departments"]="finpos-departments"
    ["qa-finpos-merchant-web-portal"]="finpos-merchant-web-portal"
    ["qa-finpos-processor-endpoints"]="finpos-processor-endpoints"
    ["qa-finpos-reports"]="finpos-reports"
    ["qa-finpos-tms-platform"]="finpos-tms-platform"
    ["qa-finpos-dwarpal"]="finpos-dwarpal"
    ["qa-finpos-messaging"]="finpos-messaging"
    ["qa-finpos-qaengine-admin-endpoints"]="finpos-qaengine-admin-endpoints"
    ["qa-finpos-schemes"]="finpos-schemes"
    ["qa-finpos-tms-portal"]="finpos-tms-portal"
    ["qa-finpos-identity-management"]="finpos-identity-management"
    ["qa-finpos-mqtt"]="finpos-mqtt"
    ["qa-finpos-qrengine-issuer-endpoints"]="finpos-qrengine-issuer-endpoints"
    ["qa-finpos-service-discovery"]="finpos-service-discovery"
    ["qa-finpos-user"]="finpos-user"
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

