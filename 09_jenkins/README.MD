Inspired by https://www.jenkins.io/doc/book/installing/kubernetes/#create-a-service-account

Directories `/.cache` and `/.gradle/caches` grow rapidly. It's safe to clear their content from both: controller and agents.

Kubernetes Cloud was set up after this article: https://timmhirsens.de/posts/2019/07/testcontainers_on_jenkins_with_kubernetes/
and this code: https://gist.github.com/sturman/dd1ee54c34bd4a0eee06c25cda23d709

# Disk space cleanup

The resources located in `agents` directory should not be created upfront.
These are podTemplates which should be added to the Kubernetes cloud in the UI.