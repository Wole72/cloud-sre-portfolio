# Service Overview: sre-demo (FastAPI)

## Endpoints
- `/` - demo response
- `/healthz` - liveness
- `/readyz` - readiness (startup delay)
- `/metrics` - Prometheus metrics

## Kubernetes
- Namespace: `sre-portfolio`
- Deployment: `sre-demo` (2 replicas)
- Service: `sre-demo` (ClusterIP)

## Primary Signals
- Error rate: `http_requests_total{status=~"5.."}`
- Latency: `http_request_duration_seconds` (p95/p99 via histogram)
- Availability: readiness success

