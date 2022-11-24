Setting up local environment to work with remove k8s cluster.
Learnt thanks to tutorial https://itnext.io/the-ultimate-guide-to-building-your-personal-k3s-cluster-bf2643f31dd3

Scripts were not tested, commands were run one by one.

Running remote scripts require settings environment variable:
`export CONTROLLER_NODE_IP=192.168.0.0` (IP address of the controller node)
`export WORKER_NODE_IP=192.168.0.0` (IP address of the worker node, if applicable)
`export NODE_USER=user` (user on node)
