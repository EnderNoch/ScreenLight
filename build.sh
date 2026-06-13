#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

APP="ScreenLight.app"
CONTENTS="$APP/Contents"
BIN_DIR="$CONTENTS/MacOS"
RES_DIR="$CONTENTS/Resources"

echo "Cleaning…"
rm -rf "$APP"
mkdir -p "$BIN_DIR" "$RES_DIR"

echo "Compiling…"
swiftc -O -swift-version 5 \
	Sources/*.swift \
	-o "$BIN_DIR/ScreenLight" \
	-framework SwiftUI -framework AppKit

echo "Bundling…"
cp Info.plist "$CONTENTS/Info.plist"

echo "Signing (ad-hoc)…"
codesign --force --sign - "$APP"

echo "Done → $APP"
echo "Run with:  open $APP"
