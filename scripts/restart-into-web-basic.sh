#!/bin/sh
# restart-into-web-basic — hand the running instance over to the web-basic
# profile on the SAME port, through the pack's own ankh-guard watchdog.
#
# Why the guard and not nohup: an agent running INSIDE the current instance
# dies with it, and a sandboxed session reaps merely-nohup'd children at
# teardown. The guard's watchdog is a properly detached supervisor that
# stops the old instance, boots web-basic with a canary, rolls back if the
# boot fails — and keeps supervising the instance afterwards.
#
# Usage:
#   sh scripts/restart-into-web-basic.sh [port]        (default 3080)
# Env:
#   DSH_BIN   dsh binary to boot with (default: dsh from PATH)
#   DSH_HOME  profile home          (default: $HOME/.dsh)
set -eu

PORT="${1:-3080}"
DELAY_MS=3000
DSH_BIN="${DSH_BIN:-dsh}"
HOME_DIR="${DSH_HOME:-$HOME/.dsh}"
CLONE="$(cd "$(dirname "$0")/.." && pwd)"
GUARD="$HOME_DIR/profiles/web-basic/node_modules/@khorsheed/dsh-ankh-guard/lib/cli.js"
STATE="$HOME_DIR/state"

if [ ! -f "$GUARD" ]; then
  echo "restart-into-web-basic: ankh-guard CLI not found at $GUARD — run scripts/install.sh first" >&2
  exit 1
fi

# 0. Environment gate: a sandboxed agent session reaps the detached watchdog
# mid-flight. Refuse early with a readable reason instead of half-restarting.
if ! node "$GUARD" check-env --state-dir "$STATE" --repo "$CLONE" > /dev/null 2>&1; then
  echo "restart-into-web-basic: environment check failed — this session looks sandboxed, so the detached watchdog would be reaped when it ends. Re-run from a full-access session (or a plain terminal)." >&2
  exit 1
fi

# 1. Green credential: the evidence is the finished install plus the offline
# composition check, bound to this clone's HEAD.
node "$GUARD" checkpoint --message "web-basic install" --repo "$CLONE" --state-dir "$STATE"
node "$GUARD" record deployment --command "install.sh completed; web-basic composition verified offline" --repo "$CLONE" --state-dir "$STATE"

# 2. Adopt the current instance with web-basic's boot as the respawn command,
#    then schedule the exit: watchdog stops the old instance and boots the pack
#    with a canary. The agent calling this disconnects with its host — expected.
node "$GUARD" supervise --port "$PORT" --start "DSH_HOME='$HOME_DIR' '$DSH_BIN' --profile web-basic --port $PORT --no-open" --state-dir "$STATE" --home "$HOME_DIR"
node "$GUARD" schedule-exit --port "$PORT" --delay-ms "$DELAY_MS" --initiator web-basic-install --profile web-basic --state-dir "$STATE" --repo "$CLONE"

echo "web-basic will replace the instance on :$PORT in ${DELAY_MS}ms — refresh the page when it is back. The watchdog now supervises this instance."
