#!/bin/bash
set -xeuo pipefail

KUBEVAL_VER="0.16.1"

# Install kubeval
curl \
    --silent \
    --show-error \
    --fail \
    --location \
    "https://github.com/instrumenta/kubeval/releases/download/v${KUBEVAL_VER}/kubeval-linux-amd64.tar.gz" |
    	tar xzf -

# validate charts
for chart_dir in charts/**; do
    helm template "${chart_dir}" |
        ./kubeval \
            --strict \
            --ignore-missing-schemas \
            --kubernetes-version "${KUBERNETES_VER#v}" \
            --schema-location https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/
done

