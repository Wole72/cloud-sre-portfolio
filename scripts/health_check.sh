#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://localhost:8080}"

echo "Checking health: ${BASE_URL}/healthz"
curl -fsS "${BASE_URL}/healthz" >/dev/null
echo "✅ healthz OK"

echo "Checking readiness: ${BASE_URL}/readyz"
curl -fsS "${BASE_URL}/readyz" >/dev/null
echo "✅ readyz OK"

