Inspired by https://k3s.rocks/install-setup/

`open-iscsi` and `wireguard` has not been applied comparing to original solution.

K3s uses containerd for container runtime. It comes with crictl - which provides some containerd functionality.
Following command cleans unused images that are stored in the cache (inside /var, at least for the vanilla installation
of K3s):
`crictl rmi --prune`
Also possible to change k3s.service parameters, so that you create a threshold of consumed space that will trigger
garbage collection. You just need to add the following parameters after k3s server, e.g.:
`--kubelet-arg=image-gc-high-threshold=85 --kubelet-arg=image-gc-low-threshold=80`