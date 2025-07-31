Instalation instruction base on this article:
https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

The required Bearer Token, required for dashboard authorization, can be generated with:
`kubectl -n kubernetes-dashboard create token admin-user`

To access the dashboard open kubernetes port forward:
`kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443`

Dashboard is available under:
https://localhost:8443


