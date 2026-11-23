#!/bin/sh
# Mini "gradlew": descarga Gradle la primera vez, así no hace falta gradle-wrapper.jar.
set -e
GRADLE_VERSION=8.7
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
CACHE="${GRADLE_USER_HOME:-$HOME/.gradle}/videx-dist"
GRADLE_DIR="$CACHE/gradle-$GRADLE_VERSION"
if [ ! -x "$GRADLE_DIR/bin/gradle" ]; then
  mkdir -p "$CACHE"
  TMP="$CACHE/gradle-$GRADLE_VERSION-bin.zip"
  URL="https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
  if command -v curl >/dev/null 2>&1; then curl -fL -o "$TMP" "$URL"; else wget -O "$TMP" "$URL"; fi
  unzip -q -o "$TMP" -d "$CACHE"
  rm -f "$TMP"
fi
exec "$GRADLE_DIR/bin/gradle" -p "$BASE_DIR" "$@"
