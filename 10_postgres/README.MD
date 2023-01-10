
# Accessing Postgres
To access Postgres database, one needs to open port forwarding to Kubernetes Postgres service:
`kubectl port-forward services/actracker-dev -n equino-postgres 5432:5432`

# Database initialization
To reinitialize the database (run the initialization scripts put in the ConfigMap), it's required to remove the StatefulSet and PersistentVolumeClaim for this database.