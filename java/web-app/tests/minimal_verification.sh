#!/usr/bin/env bash

EXPECTED_WAR_FILE="$1"

if [ ! -f "$EXPECTED_WAR_FILE" ]; then
  echo "Expected WAR file $expected_war_file to exist"
  exit 1
fi

EXPECTED_WAR_CONTENTS="WEB-INF/web.xml
css/style.css
index.html
js/dynamic.js
WEB-INF/lib/liblibminimal.jar"
ACTUAL_WAR_CONTENTS="$(jar -tf $EXPECTED_WAR_FILE)"

if [ "$EXPECTED_WAR_CONTENTS" != "$ACTUAL_WAR_CONTENTS" ]; then
  echo "Expected WAR file contents '$EXPECTED_WAR_CONTENTS', got '$ACTUAL_WAR_CONTENTS'"
  exit 1
fi