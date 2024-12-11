
create a new service account 
```
kubectl create serviceaccount remitpulse-new-sa

```

create a cluster role
```yaml

apiVersion: rbac.authorization.k8s.io/v1

kind: ClusterRole

metadata:

name: read-only-cluster-role

rules:

- apiGroups: [""]

resources: ["pods", "services", "configmaps", "secrets", "namespaces"]

verbs: ["get", "list", "watch"]
```

also create cluster role binding 
```yaml

apiVersion: rbac.authorization.k8s.io/v1

kind: ClusterRoleBinding

metadata:

name: remitpulse-admin-binding

subjects:

- kind: ServiceAccount

name: remitpulse-new-sa

namespace: default

roleRef:

kind: ClusterRole

name: read-only-cluster-role

apiGroup: rbac.authorization.k8s.io
```


generate token 
```
kubectl create token remitpulse-new-sa
```