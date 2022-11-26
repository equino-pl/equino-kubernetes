Instalation instruction base on this article:
https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

The required Bearer Token, required for dashboard authorization, can be generated with:
`kubectl -n kubernetes-dashboard create token admin-user`

To access the dashboard open kubernetes proxy:
`kubectl proxy`

Dashboard is available under:
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

