# vgervasi Helm repository

This repository hosts [Helm](https://helm.sh) charts.

## Add Helm repository

```bash
helm repo add myrepo https://vgervasi.github.io/helm-charts/
helm repo update
```

## Install chart

```bash
helm upgrade --install app myrepo/cloudbees-core
```
