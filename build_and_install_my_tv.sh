#!/usr/bin/env bash
# One-click rebuild and reinstall script for TCL T6C
set -euo pipefail
cd "$(dirname "$0")"

TV_HOST="${TV_HOST:-169.254.183.189}"
export TV_HOST
export INPUT_KEY_SERVICE=1
export HOME_KEY_SERVICE=1
export RESTORE_KEY_SERVICES=1
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export JAVA_TOOL_OPTIONS="-Djava.net.preferIPv6Addresses=true"

echo "=== Building and installing Apple TV launcher for TCL T6C ==="
launcher/build-and-install.sh
echo "=== Done! ==="
