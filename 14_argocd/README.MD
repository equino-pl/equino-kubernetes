Instalation instruction base on this article:
https://argo-cd.readthedocs.io/en/stable/getting_started/

To access application open kubernetes port forward:
`kubectl -n argocd port-forward svc/argocd-server 9014:443`

Application is available under:
http://localhost:9014


