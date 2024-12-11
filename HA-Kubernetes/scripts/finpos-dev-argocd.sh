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
    ["finpos-dev-banking-messenger"]="finpos-banking-messenger"
    ["finpos-dev-master"]="finpos-master"
    ["finpos-dev-object-storage"]="finpos-object-storage"
    ["finpos-dev-qrengine-nfc-endpoints"]="finpos-qrengine-nfc-endpoints"
    ["finpos-dev-terminals"]="finpos-terminals"
    ["finpos-dev-configurations"]="finpos-configurations"
    ["finpos-dev-merchant-portal-service"]="finpos-merchant-portal-service"
    ["finpos-dev-payment-processor-admin-endpoints"]="finpos-payment-processor-admin-endpoints"
    ["finpos-dev-rabbitmq"]="finpos-rabbitMQ"
    ["finpos-dev-tms"]="finpos-tms"
    ["finpos-dev-departments"]="finpos-departments"
    ["finpos-dev-merchant-web-portal"]="finpos-merchant-web-portal"
    ["finpos-dev-payment-processor-endpoints"]="finpos-payment-processor-endpoints"
    ["finpos-dev-reports"]="finpos-reports"
    ["finpos-dev-tms-platform"]="finpos-tms-platform"
    ["finpos-dev-dwarpal"]="finpos-dwarpal"
    ["finpos-dev-messaging"]="finpos-messaging"
    ["finpos-dev-qrengine-admin-endpoints"]="finpos-qrengine-admin-endpoints"
    ["finpos-dev-schemes"]="finpos-schemes"
    ["finpos-dev-tms-portal"]="finpos-tms-portal"
    ["finpos-dev-identity-management"]="finpos-identity-management"
    ["finpos-dev-mqtt"]="finpos-mqtt"
    ["finpos-dev-qrengine-issuer-endpoints"]="finpos-qrengine-issuer-endpoints"
    ["finpos-dev-service-discovery"]="finpos-service-discovery"
    ["finpos-dev-users"]="finpos-users"
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

