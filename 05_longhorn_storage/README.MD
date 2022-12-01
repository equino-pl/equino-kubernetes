Inspired by:
https://k3s.rocks/localstorage-longhorn/
https://docs.k3s.io/storage

Longhorn is currently not installed due to entire single-node container restarts (out of resources? Tested on 2GB RAM KVM)
Local-path storage is used instead. The path to persistent volumes is: `/var/lib/rancher/k3s/storage` on k3s nodes.
