Steps to set up Equino Kubernetes cluster.

Scripts in directory `01_node_environment_setup` should be executed on each node included in the cluster

k3s config certificates expire after 1 year.
When certificates expire, the following error occurs from kubectl:
```
% kubectl get namespaces
E1130 20:59:28.936020   75893 memcache.go:265] couldn't get current server API group list: the server has asked for the client to provide credentials
error: You must be logged in to the server (the server has asked for the client to provide credentials)
```
Certificates are automatically refreshed on the server and changes are reflected in the kubectl config on the server (`/etc/rancher/k3s/k3s.yml`).
Certificates values should be copied to the local kube config to work correctly (`.~/kube/config`).
The same changes must apply to all scripts which use kube config (Jenkins).

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

Disk usage cleanup methods:
- [Jenkins caches](09_jenkins/README.MD)
- [Docker registry](06_docker_registry/README.MD)
- [Removing unused images](01_node_environment_setup/README.MD)