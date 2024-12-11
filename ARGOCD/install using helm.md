

```
https://artifacthub.io/packages/helm/argo/argo-cd
```




```yaml
global:
  domain: argocd.example.com

configs:
  params:
    server.insecure: true

server:
  ingress:
    enabled: true
    ingressClassName: nginx
    annotations:
      nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
      nginx.ingress.kubernetes.io/backend-protocol: "HTTP"
    extraTls:
      - hosts:
        - argocd.example.com
        # Based on the ingress controller used secret might be optional
        secretName: wildcard-tls
```
