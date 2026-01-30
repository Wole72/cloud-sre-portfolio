#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://localhost:8080}"

echo "Smoke test: GET /"
resp="$(curl -fsS "${BASE_URL}/")"
echo "$resp" | grep -qi "cloud-sre-portfolio"
echo "✅ / OK"

echo "Smoke test: metrics exists"
curl -fsS "${BASE_URL}/metrics" | grep -q "http_requests_total"
echo "✅ /metrics OK"

./scripts/health_check.sh "${BASE_URL}"
echo "✅ smoke tests passed"

