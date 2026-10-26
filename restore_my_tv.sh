#!/usr/bin/env bash
# One-click restore script to revert TV back to stock Google TV
set -euo pipefail
cd "$(dirname "$0")"

TV_HOST="${TV_HOST:-169.254.183.189}"
export TV_HOST

echo "=== Restoring TCL T6C to stock Google TV ==="
echo "Target TV: $TV_HOST"

# 1. Re-enable all debloated packages
tools/restore.sh debloat_tcl_t6c.txt com.google.android.apps.tv.launcherx

# 2. Re-enable setup wizard if it was disabled
tools/tv.py 'pm enable --user 0 com.google.android.tungsten.setupwraith' || true

# 3. Restore stock launcher as default Home
tools/tv.py 'cmd package set-home-activity --user 0 com.google.android.apps.tv.launcherx/.home.HomeActivity' || true

echo "=== Restore completed! Press Home on your remote to view stock Google TV. ==="
