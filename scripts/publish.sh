#!/usr/bin/env bash
# Publish the Celigo Design System GitBook site (idempotent — safe to re-run).
#
# After a fresh space + content import, the site sits in `published: false`.
# Once published, GitBook generates a share-link URL that the site is reachable at.
#
# Requires:
#   GITBOOK_TOKEN  — a user token with admin on the target org/site
#
# Usage:
#   ./scripts/publish.sh

set -euo pipefail

: "${GITBOOK_TOKEN:?Set GITBOOK_TOKEN to a GitBook user API token}"

ORG_ID="hCx98aEWAei7dMUCu0xj"
SITE_ID="site_TeB44"

echo "→ Publishing site ${SITE_ID}"
response=$(curl -sS \
  -X POST \
  -H "Authorization: Bearer ${GITBOOK_TOKEN}" \
  "https://api.gitbook.com/v1/orgs/${ORG_ID}/sites/${SITE_ID}/publish")

published=$(echo "${response}" | python -c "import sys,json; print(json.load(sys.stdin).get('published'))")

if [[ "${published}" != "True" ]]; then
  echo "✗ Publish did not succeed:" >&2
  echo "${response}" >&2
  exit 1
fi

echo "✓ Site is published."

# Surface the share link
share=$(curl -sS \
  -H "Authorization: Bearer ${GITBOOK_TOKEN}" \
  "https://api.gitbook.com/v1/orgs/${ORG_ID}/sites/${SITE_ID}/share-links" \
  | python -c "import sys,json; d=json.load(sys.stdin); items=d.get('items',[]); print(items[0]['urls']['published'] if items else 'no share link')")

echo "  URL: ${share}"
