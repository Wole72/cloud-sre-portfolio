# Runbook: Pod CrashLoopBackOff

## Symptoms
- Pods restart repeatedly
- Service unreachable or flapping

## Checks
```bash
kubectl -n sre-portfolio get pods
kubectl -n sre-portfolio describe pod <pod>
kubectl -n sre-portfolio logs <pod> --previous

