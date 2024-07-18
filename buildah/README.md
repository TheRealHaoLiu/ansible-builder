## build buildah base ansible-builder image

```bash
podman build -f buildah/Containerfile -t $IMAGE $ANSIBLE_BUILDER_PROJECT_ROOT
```

## build and push image via buildah base ansible-builder image

### Create image registry auth secret

```bash
kubectl create secret docker-registry quay-auth --from-file=.dockerconfigjson=$PATH_TO_AUTH_JSON_FILE -o yaml --dry-run=client | podman play kube -
```

### modify ansible-buildah configmap in play-kube.yml

### start building

```bash
podman play kube play-kube.yml
```

### TODO: explain the play-kube.yml
