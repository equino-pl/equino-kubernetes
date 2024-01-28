Inspired by: https://adamtheautomator.com/prometheus-kubernetes/

# Default username/password:
The default Grafana username and password must be obtained from secrets after installing the Helm chart.
Creating new Admin user and removing default should be the first thing to do.
`kubectl get secret -n equino-prometheus prometheus-grafana -o jsonpath='{.data.admin-user}' | base64 --decode`
`kubectl get secret -n equino-prometheus prometheus-grafana -o jsonpath='{.data.admin-password}' | base64 --decode`

# Accessing Grafana:
To access Grafana, one needs to open port forwarding to Kubernetes prometheus-grafana service:
`kubectl port-forward -n equino-prometheus services/prometheus-grafana 8000:80`

Grafana is available under:
http://localhost:8000