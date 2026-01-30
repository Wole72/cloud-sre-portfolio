# cloud-sre-portfolio (FastAPI)

Portfolio repo demonstrating:
- FastAPI service with /healthz, /readyz, /metrics (Prometheus)
- Docker containerization
- Kubernetes deployment (kind-friendly) with probes + resources + PDB
- kube-prometheus-stack (Prometheus + Grafana) and ServiceMonitor
- CI pipeline with kind smoke tests
- Terraform skeleton (fmt/validate)
- Runbooks

## Quickstart (kind)
```bash
kind create cluster --name sre-portfolio
docker build -t sre-demo:local ./app
kind load docker-image sre-demo:local --name sre-portfolio
kubectl apply -f k8s/
kubectl -n sre-portfolio rollout status deploy/sre-demo
kubectl -n sre-portfolio port-forward svc/sre-demo 8080:80
./scripts/smoke_test.sh http://localhost:8080
