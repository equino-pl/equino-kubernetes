# Install instructions:
https://www.rabbitmq.com/kubernetes/operator/quickstart-operator.html

# Default username/password:
The default username and password must be obtained from secrets after cluster creation.
Creating new Admin user and removing default should be the first thing to do.
`kubectl get secret equino-cluster-default-user -o jsonpath='{.data.username}' -n equino-rabbitmq | base64 --decode`
`kubectl get secret equino-cluster-default-user -o jsonpath='{.data.password}' -n equino-rabbitmq | base64 --decode`

# Managing RabbitMQ clusters:
`kubectl get rabbitmqclusters.rabbitmq.com -n {namespace-name}`
`kubectl delete rabbitmqclusters.rabbitmq.com {cluster-name}`

# Accessing RabbitMQ management console:
To access RabbitMQ management console, one needs to open port forwarding to Kubernetes RabbitMQ service:
`kubectl port-forward services/equino-cluster -n equino-rabbitmq 15672:15672`
