# Install instructions:
https://www.rabbitmq.com/kubernetes/operator/quickstart-operator.html

# Operator documentation

https://www.rabbitmq.com/kubernetes/operator/operator-overview

# Default username/password:
The default username and password must be obtained from secrets after cluster creation.
Creating new Admin user and removing default should be the first thing to do.
`kubectl get secret equino-cluster-default-user -o jsonpath='{.data.username}' -n equino-rabbitmq | base64 --decode`
`kubectl get secret equino-cluster-default-user -o jsonpath='{.data.password}' -n equino-rabbitmq | base64 --decode`

# Managing RabbitMQ clusters:
`kubectl get rabbitmqclusters.rabbitmq.com -n {namespace-name}`
`kubectl delete rabbitmqclusters.rabbitmq.com {cluster-name}`
`kubectl edit rabbitmqclusters.rabbitmq.com {cluster-name}` (including replicas)

# Accessing RabbitMQ management console:
To access RabbitMQ management console, one needs to open port forwarding to Kubernetes RabbitMQ service:
`kubectl port-forward services/equino-cluster -n equino-rabbitmq 15672:15672`

RabbitMQ is available under:
http://localhost:15672

# Disable reconciliation

To pause reconciliation, set the label by running:
```kubectl -n equino-rabbitmq label rabbitmqclusters equino-cluster rabbitmq.com/pauseReconciliation=true```

To resume reconciliation, remove the label by running:
```kubectl -n equino-rabbitmq label rabbitmqclusters equino-cluster rabbitmq.com/pauseReconciliation-```

# Scaling to 0 replicas

Scaling to 0 replicas using operator is allowed since version V2.16.0.
In earlier versions, it's required to disable reconciliation of a cluster first and then scale down stateful set to 0 replicas.
Re-enabling reconciliation results in scaling back to the original number.
