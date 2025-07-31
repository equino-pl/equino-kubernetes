Inspired by https://k3s.rocks/private-registry/

Local path storage used due to problem with Longhorn (see 05_longhorn_storage/README.MD)

# Disk space cleanup

Docker registry does not require backup. The persistent volume grows rapidly. If the size is too large, it's enough to clean it up.