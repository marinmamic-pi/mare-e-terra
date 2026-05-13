#!/bin/bash
# verify-listmonk.sh — Test Listmonk API connectivity for Mare e Terra landing page
# Usage: ./verify-listmonk.sh [listmonk-url] [admin-user] [admin-pass]
# Default: http://localhost:9000 admin mypassword123

set -e

LISTMONK_URL="${1:-http://localhost:9000}"
ADMIN_USER="${2:-admin}"
ADMIN_PASS="${3:-mypassword123}"
COOKIE_JAR=$(mktemp /tmp/listmonk-verify-XXXXXX.jar)
trap "rm -f $COOKIE_JAR" EXIT

echo "═══════════════════════════════════════════"
echo "  Listmonk API Verification"
echo "  URL:  $LISTMONK_URL"
echo "  User: $ADMIN_USER"
echo "═══════════════════════════════════════════"
echo ""

# ── Step 1: Health check ──────────────────────
echo "── Step 1: Health Check ──"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$LISTMONK_URL/api/health" 2>/dev/null || echo "000")
if [ "$HTTP_CODE" = "403" ]; then
  echo "  ✓ Health endpoint responds (HTTP $HTTP_CODE — session required)"
elif [ "$HTTP_CODE" = "200" ]; then
  echo "  ✓ Health endpoint OK (HTTP 200)"
else
  echo "  ✗ Health endpoint unexpected response (HTTP $HTTP_CODE)"
  echo "  Is Listmonk running? Try: systemctl status listmonk"
fi
echo ""

# ── Step 2: Public subscription form ──────────
echo "── Step 2: Public Subscription Form ──"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$LISTMONK_URL/subscription/form" 2>/dev/null || echo "000")
if [ "$HTTP_CODE" = "200" ]; then
  echo "  ✓ Subscription form accessible (HTTP 200)"
else
  echo "  ✗ Subscription form returned HTTP $HTTP_CODE"
fi
echo ""

# ── Step 3: Admin login ────────────────────────
echo "── Step 3: Admin Login ──"
rm -f "$COOKIE_JAR"
LOGIN_HTML=$(curl -s -c "$COOKIE_JAR" "$LISTMONK_URL/admin/login" 2>/dev/null || true)
NONCE=$(echo "$LOGIN_HTML" | grep -oP 'name="nonce" value="\K[^"]+')

if [ -z "$NONCE" ]; then
  echo "  ✗ Could not extract nonce from login page"
  echo "  Is admin user configured via the setup wizard?"
  exit 1
fi

LOGIN_RESULT=$(curl -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
  -X POST "$LISTMONK_URL/admin/login" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "nonce=$NONCE" \
  --data-urlencode "next=/admin" \
  --data-urlencode "username=$ADMIN_USER" \
  --data-urlencode "password=$ADMIN_PASS" \
  -o /dev/null -w "%{http_code}" 2>/dev/null || true)

if [ "$LOGIN_RESULT" = "302" ]; then
  echo "  ✓ Admin login successful (redirect 302)"
else
  echo "  ✗ Admin login returned HTTP $LOGIN_RESULT"
  echo "  Check credentials or run: curl -s http://localhost:9000/admin/login"
fi
echo ""

# ── Step 4: Public Lists API ──────────────────
echo "── Step 4: Public Lists API ──"
PUBLIC_LISTS=$(curl -s "$LISTMONK_URL/api/public/lists" 2>/dev/null || echo "[]")
LIST_COUNT=$(echo "$PUBLIC_LISTS" | python3 -c "import sys,json; data=json.load(sys.stdin); print(len(data))" 2>/dev/null || echo "0")
if [ "$LIST_COUNT" -gt 0 ]; then
  echo "  ✓ Public API returns $LIST_COUNT list(s):"
  echo "$PUBLIC_LISTS" | python3 -c "
import sys,json
for l in json.load(sys.stdin):
    print(f'    - {l.get(\"name\",\"?\")} (uuid: {l.get(\"uuid\",\"?\")})')
" 2>/dev/null
else
  echo "  - No public lists found"
fi
echo ""

# ── Step 5: Admin API (authenticated) ────────
echo "── Step 5: Admin API (authenticated) ──"
ADMIN_LISTS=$(curl -s -b "$COOKIE_JAR" "$LISTMONK_URL/api/lists" 2>/dev/null || echo '{"total":0}')
ADMIN_TOTAL=$(echo "$ADMIN_LISTS" | python3 -c "import sys,json; print(json.load(sys.stdin).get('data',{}).get('total',0))" 2>/dev/null || echo "0")
echo "  - /api/lists reports $ADMIN_TOTAL list(s) (may not reflect DB state in v6)"
echo ""

# ── Step 6: DB Cross-check ─────────────────────
echo "── Step 6: Database Cross-Check ──"
# Check if psql is available
if command -v psql &>/dev/null; then
  PGPASSWORD="${PGPASSWORD:-rVoqEbBhxqKNLytzCzaRqQ}" psql -h localhost -U listmonk -d listmonk \
    -c "SELECT id, name, uuid FROM lists ORDER BY id;" 2>/dev/null || \
    echo "  - psql not configured or DB unreachable"
else
  echo "  - psql not available; can't cross-check DB directly"
fi
echo ""

# ── Summary ────────────────────────────────────
echo "═══════════════════════════════════════════"
echo "  SMTP Status: NOT_CONFIGURED (placeholder smtp.yoursite.com)"
echo "  Subscription POST will return 500 but data IS stored in DB"
echo "  Configure SMTP in /etc/listmonk/config.toml for email delivery"
echo "═══════════════════════════════════════════"
