#!/bin/sh
# Create a local, compressed backup of the ASCEND Gym data directory.
#
# Run as root so root-owned files such as data/secret are included:
#   sudo /opt/opengym/scripts/backup-local.sh
#
# The archive includes data/codex when it exists. Treat that archive as a
# credential-bearing backup and keep it local, access-controlled, and ideally
# encrypted before copying it anywhere.

set -eu
umask 077

PROJECT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
DATA_DIR=$PROJECT_DIR/data
BACKUP_DIR=$PROJECT_DIR/backups

if [ "$(id -u)" -ne 0 ]; then
  echo "Run this script with sudo so root-owned data files are included." >&2
  exit 1
fi

if [ ! -d "$DATA_DIR" ]; then
  echo "Data directory not found: $DATA_DIR" >&2
  exit 1
fi

install -d -m 700 "$BACKUP_DIR"
stamp=$(date -u +%Y%m%dT%H%M%SZ)
archive=$BACKUP_DIR/ascend-gym-data-$stamp-$$.tar.gz
tmp=$archive.tmp
trap 'rm -f "$tmp"' EXIT HUP INT TERM

# tar records file modes and ownership metadata. The archive is written beside
# the final path and renamed only after tar completes and can read its table.
tar -czf "$tmp" -C "$PROJECT_DIR" data
tar -tzf "$tmp" >/dev/null
chmod 600 "$tmp"
mv -f "$tmp" "$archive"
trap - EXIT HUP INT TERM
printf 'Created local backup: %s\n' "$archive"
