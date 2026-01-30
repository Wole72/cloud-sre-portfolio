
---

## 9) README (portfolio-grade)
### `README.md`
```md
# cloud-sre-portfolio (FastAPI)

A small Cloud + SRE portfolio repo demonstrating:
- FastAPI service with health/readiness endpoints + Prometheus metrics
- Docker containerization
- Kubernetes deployment (kind-friendly) with probes + resource limits + PDB
- CI pipeline that spins up kind, deploys, and runs smoke tests
- Terraform skeleton (fmt/validate ready)
- Basic runbooks

## Quickstart (local)
```bash
cd app
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
uvicorn main:app --host 0.0.0.0 --port 8080
curl http://localhost:8080/healthz
curl http://localhost:8080/metrics

