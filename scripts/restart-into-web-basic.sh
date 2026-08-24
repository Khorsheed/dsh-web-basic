#!/bin/sh
# restart-into-web-basic — hand the running instance over to the web-basic
# profile on the SAME port, safe to run from an agent living INSIDE the
# current instance. Killing the host takes the agent with it, so the boot is
# spawned detached and delayed: it survives the teardown and brings web-basic
# up on the port the user already has open.
#
# Usage:
#   sh scripts/restart-into-web-basic.sh [port]
# Env:
#   DSH_BIN   dsh binary to boot with (default: dsh from PATH)
#   DSH_HOME  profile home          (default: $HOME/.dsh)
set -eu

PORT="${1:-3080}"
DELAY=3
DSH_BIN="${DSH_BIN:-dsh}"
HOME_DIR="${DSH_HOME:-$HOME/.dsh}"

if ! command -v "$DSH_BIN" >/dev/null 2>&1; then
  echo "restart-into-web-basic: dsh binary not found: $DSH_BIN (set DSH_BIN to its full path)" >&2
  exit 1
fi

# 1. Detached delayed boot — this process is NOT a child of the instance about
# to be stopped, so it lives through the teardown.
nohup sh -c "sleep $DELAY; DSH_HOME='$HOME_DIR' '$DSH_BIN' --profile web-basic --port $PORT --no-open" \
  > /tmp/dsh-web-basic-boot.log 2>&1 &
echo "web-basic will boot on :$PORT in ${DELAY}s (detached pid $!, log /tmp/dsh-web-basic-boot.log)"

# 2. Stop whoever is listening on the port now. The agent calling this dies
# with its host — that is the point; step 1 brings the pack back.
PID="$(lsof -ti :$PORT -sTCP:LISTEN 2>/dev/null | head -1 || true)"
if [ -n "$PID" ]; then
  echo "stopping the current instance on :$PORT (pid $PID) — this session will disconnect"
  kill "$PID" || true
else
  echo "no listener on :$PORT — web-basic will simply boot"
fi
