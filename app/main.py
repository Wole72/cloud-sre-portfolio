import os
import time
from fastapi import FastAPI, Response
from prometheus_client import Counter, Histogram, Gauge, generate_latest, CONTENT_TYPE_LATEST

APP_START = time.time()
APP_VERSION = os.getenv("APP_VERSION", "dev")
READY_DELAY_SECONDS = int(os.getenv("READY_DELAY_SECONDS", "2"))

app = FastAPI(title="cloud-sre-portfolio", version=APP_VERSION)

# Metrics
http_requests_total = Counter(
    "http_requests_total",
    "Total number of HTTP requests",
    ["path", "method", "status"],
)

http_request_duration_seconds = Histogram(
    "http_request_duration_seconds",
    "HTTP request duration in seconds",
    ["path", "method"],
)

app_info = Gauge(
    "app_info",
    "Static info about the application",
    ["version"],
)
app_info.labels(version=APP_VERSION).set(1)


@app.middleware("http")
async def metrics_middleware(request, call_next):
    path = request.url.path
    method = request.method
    start = time.time()

    response = await call_next(request)

    status = str(response.status_code)
    http_requests_total.labels(path=path, method=method, status=status).inc()
    http_request_duration_seconds.labels(path=path, method=method).observe(time.time() - start)

    return response


@app.get("/")
def root():
    return {"message": "hello from cloud-sre-portfolio"}


@app.get("/healthz")
def healthz():
    return {"status": "ok"}


@app.get("/readyz")
def readyz():
    if time.time() - APP_START < READY_DELAY_SECONDS:
        return Response(content='{"status":"not-ready"}', status_code=503, media_type="application/json")
    return {"status": "ready"}


@app.get("/metrics")
def metrics():
    data = generate_latest()
    return Response(content=data, media_type=CONTENT_TYPE_LATEST)

