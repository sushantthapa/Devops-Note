#!/bin/bash

# Set the namespace
NAMESPACE="test"
PREFIX="nginx-deployment-"

# Path to microk8s.kubectl
KUBECTL_PATH="/var/lib/snapd/snap/bin/microk8s.kubectl"

# Set the PATH variable to include the directory containing microk8s.kubectl
export PATH=$PATH:/var/lib/snapd/snap/bin/

# Get the name of the first pod with the specified prefix
POD_NAME=$($KUBECTL_PATH get pods -n $NAMESPACE -o jsonpath='{.items[*].metadata.name}' | grep '^nginx' | head -n 1)

# Check if a matching pod exists
if [ -n "$POD_NAME" ]; then
    echo "Deleting pod $POD_NAME in namespace $NAMESPACE..."

    # Delete the pod
    $KUBECTL_PATH delete pod -n $NAMESPACE $POD_NAME

    echo "Pod deleted successfully."

else
    echo "No pods with the specified prefix found in namespace $NAMESPACE. Skipping deletion."
fi

