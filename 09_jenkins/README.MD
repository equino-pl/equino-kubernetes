Inspired by https://www.jenkins.io/doc/book/installing/kubernetes/#create-a-service-account

Directories `/.cache` and `/.gradle/caches` grow rapidly. It's safe to clear their content.

The resources located in `agents` directory should not be created upfront.
These are podTemplates which should be added to the Kubernetes cloud in the UI.
