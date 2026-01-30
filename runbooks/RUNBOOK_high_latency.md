
### `runbooks/RUNBOOK_high_latency.md`
```md
# Runbook: High Latency

## Symptoms
- p95 latency increases
- Requests slow

## Checks
```bash
kubectl -n sre-portfolio get pods
kubectl -n sre-portfolio top pods || true
kubectl -n sre-portfolio describe deploy/sre-demo
