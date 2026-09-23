#!/usr/bin/env bash
set -euo pipefail

CHROME="${CHROME:-chromium}"
OUT="assets/img/projects/screenshots"
CAPTURE="${CAPTURE:-1}"
mkdir -p "$OUT"

capture() {
  local slug="$1"
  local url="$2"
  echo "Capturing $slug -> $url"
  if ! "$CHROME" --headless=new --no-sandbox --disable-gpu --disable-dev-shm-usage \
    --disable-blink-features=AutomationControlled --hide-scrollbars \
    --window-size=1600,900 --virtual-time-budget=9000 \
    --screenshot="$OUT/$slug.png" "$url"; then
    echo "Warning: could not capture $slug; add $OUT/$slug.png manually if needed" >&2
  fi
}

if [[ "$CAPTURE" == "1" ]]; then
  capture dam-sport "https://www.dam-sport.net/es/"
  capture serviempresa "https://tienda.serviempresa.com/"
  capture gemelolandia "https://www.gemelolandia.com/"
  capture optica-bassol "https://www.opticabassol.com/"
  capture sara-aguilar "https://saraaguilar.makeup/"
  capture aigua-i-llum "https://www.aiguaillum.com/"
  echo "Screenshots saved under $OUT"
else
  echo "Skipping capture; using existing files in $OUT"
fi

echo "HTML already references $OUT/<slug>.png directly."
echo "If a PNG is missing, the page falls back automatically to the local SVG placeholder."
