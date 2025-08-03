# Steps to set up Equino Kubernetes cluster.

Scripts in directory `01_node_environment_setup` should be executed on each node included in the cluster

# Performing backups

Backing up local path PVCs:

1. Scale deployment to 0: `kubectl -n {namespaceName} scale deployment {deploymentName} --replicas=0`
2. Go to PVC intended to backup `cd /var/lib/rancher/k3s/storage/{pvcIntendedToBackUp}`
3. Archive content of desired PVC `tar -czvf {path_to.tar.gz} *` (must be root)
4. Scale deployment back to desired number of pods

Restoring local path PVCs:

1. Scale deployment to 0: `kubectl -n {namespaceName} scale deployment {deploymentName} --replicas=0`
2. Go to PVC intended to backup `cd /var/lib/rancher/k3s/storage/{pvcIntendedToBackUp}`
3. Clear PVC `rm -rf ./*` (must be root)
4. Extract content of backup: `tar -xzvf {path_to.tar.gz}`
5. Scale deployment back to desired number of pods

# Restoring disk space

Disk usage cleanup methods:

- [Jenkins caches](09_jenkins/README.MD#disk-space-cleanup)
- [Docker registry](06_docker_registry/README.MD#disk-space-cleanup)
- [Removing unused images](01_node_environment_setup/README.MD#disk-space-cleanup)

# Common problems

## k3s config certificates expire

k3s config certificates expire after 1 year.
When certificates expire, the following error occurs from kubectl:

```
% kubectl get namespaces
E1130 20:59:28.936020   75893 memcache.go:265] couldn't get current server API group list: the server has asked for the client to provide credentials
error: You must be logged in to the server (the server has asked for the client to provide credentials)
```

Certificates are automatically refreshed on the server and changes are reflected in the kubectl config on the server
(`/etc/rancher/k3s/k3s.yml`).
Certificates values should be copied to the local kube config to work correctly (`~/.kube/config`).
The same changes must apply to all scripts which use kube config (Jenkins).

## DNS not working

The problem of not working DNS occurred in the past.
When DNS is not working, DNS resolution doesn't work on pods:

```
% kubectl -n equino exec -it deployments/jenkins -- curl 'https://updates.jenkins.io'
curl: (6) Could not resolve host: updates.jenkins.io
```
Also, Jenkins cannot access external endpoints, like 'https://api.github.com', or `https://updates.jenkins.io` (plugins
update fails).
It also prevents applications from working correctly. 
<!-- TODO describe when diagnosis implemented -->

To solve the problem check if CoreDNS deployment is running and start it if not (scale to 0, then back to 1):
```
% kubectl -n kube-system get deployments
NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
coredns                  0/1     1            0           667d
local-path-provisioner   1/1     1            1           667d
metrics-server           1/1     1            1           667d
traefik                  1/1     1            1           667d
```
## Warning: annotation "kubernetes.io/ingress.class" is deprecated, please use 'spec.ingressClassName' instead

Unfortunately, using annotation `spec.ingressClassName` causes cert manager's issuer `letsencrypt-prod` failing. 
After few attempts issuing certificate for ingress is blocked for 3 days.