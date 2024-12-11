#!/bin/bash

# Set the namespace
NAMESPACE="test"
PREFIX="nginx-deployment-"

# Get the name of the first pod with the specified prefix
#POD_NAME=$(microk8s.kubectl get pods -n $NAMESPACE -o jsonpath='{.items[*].metadata.name}' | grep "^$PREFIX" | head -n 1)
POD_NAME=$(microk8s kubectl get pods -n test -o jsonpath='{.items[*].metadata.name}' | grep '^nginx' | head -n 1)

# Check if a matching pod exists
if [ -n "$POD_NAME" ]; then
    echo "Deleting pod $POD_NAME in namespace $NAMESPACE..."

    # Delete the pod
    microk8s.kubectl delete pod -n $NAMESPACE $POD_NAME

    echo "Pod deleted successfully."

else
    echo "No pods with the specified prefix found in namespace $NAMESPACE. Skipping deletion."
fi

