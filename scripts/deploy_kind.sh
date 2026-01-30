#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="${CLUSTER_NAME:-sre-portfolio}"
IMAGE_NAME="${IMAGE_NAME:-sre-demo:local}"

echo "==> Building image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" ./app

echo "==> Loading image into kind cluster: $CLUSTER_NAME"
kind load docker-image "$IMAGE_NAME" --name "$CLUSTER_NAME"

echo "==> Applying Kubernetes manifests"
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/pdb.yaml

echo "==> Waiting for rollout"
kubectl -n sre-portfolio rollout status deploy/sre-demo --timeout=180s

echo "==> Done"
kubectl -n sre-portfolio get pods -o wide
kubectl -n sre-portfolio get svc
