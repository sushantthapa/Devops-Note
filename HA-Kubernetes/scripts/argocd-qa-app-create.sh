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
    ["finpos-qa-banking-messenger"]="finpos-banking-messenger"
    ["finpos-qa-master"]="finpos-master"
    ["finpos-qa-object-storage"]="finpos-object-storage"
    ["finpos-qa-qrengine-nfc-endpoints"]="finpos-qrengine-nfc-endpoints"
    ["finpos-qa-terminals"]="finpos-terminals"
    ["finpos-qa-configurations"]="finpos-configurations"
    ["finpos-qa-merchant-portal-service"]="finpos-merchant-portal-service"
    ["finpos-qa-payment-processor-admin-endpoints"]="finpos-payment-processor-admin-endpoints"
    ["finpos-qa-rabbitmq"]="finpos-rabbitMQ"
    ["finpos-qa-tms"]="finpos-tms"
    ["finpos-qa-departments"]="finpos-departments"
    ["finpos-qa-merchant-web-portal"]="finpos-merchant-web-portal"
    ["finpos-qa-payment-processor-endpoints"]="finpos-payment-processor-endpoints"
    ["finpos-qa-reports"]="finpos-reports"
    ["finpos-qa-tms-platform"]="finpos-tms-platform"
    ["finpos-qa-dwarpal"]="finpos-dwarpal"
    ["finpos-qa-messaging"]="finpos-messaging"
    ["finpos-qa-qrengine-admin-endpoints"]="finpos-qrengine-admin-endpoints"
    ["finpos-qa-schemes"]="finpos-schemes"
    ["finpos-qa-tms-portal"]="finpos-tms-portal"
    ["finpos-qa-identity-management"]="finpos-identity-management"
    ["finpos-qa-mqtt"]="finpos-mqtt"
    ["finpos-qa-qrengine-issuer-endpoints"]="finpos-qrengine-issuer-endpoints"
    ["finpos-qa-service-discovery"]="finpos-service-discovery"
    ["finpos-qa-users"]="finpos-users"
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

