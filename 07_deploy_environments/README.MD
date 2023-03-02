This directory contains files required to configure resources for Equino applications deploy environments.
It also contains applications' configuration.

Configuration change requires application restart:
`kubectl rollout restart deployments/${app-deployment} -n ${app-namespace}`
However, the failing pod is restarting in loop. There's a huge chance that the updated config will load on the next loop restart.
