#!/usr/bin/env bash
# Trigger a GitBook git-import for the Celigo FX Design System docs.
# Pulls the latest commit on `main` from this repo into the GitBook space
# and overwrites the space's main content (--force).
#
# Requires:
#   GITBOOK_TOKEN  — a user token with admin on the target space
#
# Usage:
#   ./scripts/import.sh

set -euo pipefail

: "${GITBOOK_TOKEN:?Set GITBOOK_TOKEN to a GitBook user API token}"

SPACE_ID="6dVG2kxXhCSgs2Z18izG"   # Celigo Design System → Docs
REPO_URL="https://github.com/tylerlamparter/fx-design-system-docs"
REF="refs/heads/main"
PROJECT_DIR="docs"

echo "→ Triggering git-import for space ${SPACE_ID}"
echo "  repo: ${REPO_URL}"
echo "  ref:  ${REF}"
echo "  dir:  ${PROJECT_DIR}/"

http_code=$(curl -sS -o /tmp/gb-import-body.json -w "%{http_code}" \
  -X POST \
  -H "Authorization: Bearer ${GITBOOK_TOKEN}" \
  -H "Content-Type: application/json" \
  "https://api.gitbook.com/v1/spaces/${SPACE_ID}/git/import" \
  -d "$(cat <<JSON
{
  "url": "${REPO_URL}",
  "ref": "${REF}",
  "repoProjectDirectory": "${PROJECT_DIR}",
  "force": true
}
JSON
)")

if [[ "${http_code}" != "204" ]]; then
  echo "✗ Import failed (HTTP ${http_code}):" >&2
  cat /tmp/gb-import-body.json >&2
  exit 1
fi

echo "✓ Import accepted. GitBook will pull the latest commit asynchronously."
echo "  Check https://celigo.gitbook.io/celigo-design-system/ in ~30s."
