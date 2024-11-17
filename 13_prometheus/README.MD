Inspired
by: [this](https://adamtheautomator.com/prometheus-kubernetes/)
and [this](https://medium.com/@joudwawad/comprehensive-beginners-guide-to-kube-prometheus-in-kubernetes-monitoring-alerts-integration-4ade4fa8fa8c)
article.

# How it works

In `equino-prometheus` namespace, for each application, there is a `ServiceMonitor` installed, which scrapes
metrics from every pod matching specific `app` label.

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

# Accessing Prometheus:

To access Prometheus, one needs to open port forwarding to Kubernetes prometheus-operated service:
`kubectl port-forward -n equino-prometheus services/prometheus-kube-prometheus-prometheus 8001:9090`

Prometheus is available under:
http://localhost:8001