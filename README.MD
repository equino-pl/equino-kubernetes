Steps to set up Equino Kubernetes cluster.

Scripts in directory `01_node_environment_setup` should be executed on each node included in the cluster


Backing up local path PVCs:
1. Scale deployment to 0: `kubectl scale deployment {deploymentName} -n {namespaceName}`
2. Go to PVC intended to backup `cd /var/lib/rancher/k3s/{pvcIntendedToBackUp}`
3. Archive content of desired PVC `tar -czvf {path_to.tar.gz} *` (must be root)
4. Scale deployment back to desired number of pods

Restoring local path PVCs:
1. Scale deployment to 0: `kubectl scale deployment {deploymentName} -n {namespaceName}`
2. Go to PVC intended to backup `cd /var/lib/rancher/k3s/{pvcIntendedToBackUp}`
3. Clear PVC `rm -rf ./*` (must be root)
4. Extract content of backup: `tar -xzvf {path_to.tar.gz}`
5. Scale deployment back to desired number of pods