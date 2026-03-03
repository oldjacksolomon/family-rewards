#!/usr/bin/env bash
# Serve the Family Rewards Dashboard on http://localhost:8080
# Tries Python 3, then Node npx serve as a fallback.

PORT="${PORT:-8080}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if command -v python3 &>/dev/null; then
    echo "Starting with Python 3 on port $PORT..."
    cd "$DIR" && python3 serve.py
elif command -v python &>/dev/null; then
    echo "Starting with Python on port $PORT..."
    cd "$DIR" && python serve.py
elif command -v npx &>/dev/null; then
    echo "Starting with npx serve on port $PORT..."
    cd "$DIR" && npx serve -l "$PORT"
else
    echo "ERROR: No suitable runtime found. Install Python 3 or Node.js."
    exit 1
fi
