# Install instructions
https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-quickstart.html

# Default username/password
The default username to the cluster is `elastic`
The default password must be obtained from secrets after cluster creation.
Creating new user and removing default should be the first thing to do.

`kubectl -n equino-elastic get secret equino-cluster-es-elastic-user -o go-template='{{.data.elastic | base64decode}}'`

# Managing Elasticsearch clusters
`kubectl -n equino-elastic get elasticsearch`

# Accessing Elasticsearch HTTP endpoint
To access Elasticsearch HTTP endpoint, one needs to open port forwarding to Kubernetes Elasticsearch service:
`kubectl -n equino-elastic port-forward services/equino-cluster-es-http 9200`

Then request localhost:
`curl -u "elastic:{password}" -k "https://localhost:9200"`
