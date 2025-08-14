Inspired by https://k3s.rocks/https-cert-manager-letsencrypt/

Email is optional according to API documentation (https://cert-manager.io/docs/reference/api-docs/#acme.cert-manager.io/v1) and was disabled currently.

`letsencrypt-staging` cert issuer should be used for testing, while `letsencrypt-prod` issuer should be used as a final solution, after testing successfully completed.

Comparing to the guide, the namespace of `redirect-https` Middleware changed from `default` to `test` (`04_traefik_https_redirect_middleware.yaml`)
The consequence of such change is a change in annotations of `whoami-tls-ingress` defined in `05-test-application.yaml`
From:
`traefik.ingress.kubernetes.io/router.middlewares: default-redirect-https@kubernetescrd`
To:
`traefik.ingress.kubernetes.io/router.middlewares: test-redirect-https@kubernetescrd`

After setting up test application, it can be removed with `kubectl delete namespace test`

Resources:
https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1
