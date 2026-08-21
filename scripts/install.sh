#!/bin/sh
# dsh-web-basic installer: drop the profile template into $DSH_HOME and install it.
set -eu

DSH_HOME="${DSH_HOME:-$HOME/.dsh}"
SRC="$(cd "$(dirname "$0")/.." && pwd)/profiles/web-basic"
DEST="$DSH_HOME/profiles/web-basic"

if [ -d "$DEST" ]; then
  echo "dsh-web-basic: $DEST already exists — remove it first if you want a clean reinstall" >&2
  exit 1
fi

mkdir -p "$DSH_HOME/profiles"
cp -r "$SRC" "$DEST"
dsh plugin --profile web-basic install
echo "dsh-web-basic: installed into $DEST — boot with: dsh --profile web-basic"
