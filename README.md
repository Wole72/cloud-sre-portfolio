## SRE Observability Demo (FastAPI)

This project demonstrates a production-style SRE observability stack using:

- FastAPI service with Prometheus metrics
- Kubernetes (kind)
- Prometheus Operator (kube-prometheus-stack)
- Grafana dashboards auto-provisioned via ConfigMaps

### Key Signals
- Request throughput (RPS)
- Error rate (5xx)
- Latency p95 / p99
- Top API endpoints by traffic

### Reliability Practices
- Histogram-based latency tracking
- Rate-based error monitoring
- SLO-ready alert rules
- Infrastructure-as-code dashboards
