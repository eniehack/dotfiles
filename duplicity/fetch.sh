#!/bin/sh
set -eu

. "$(dirname "$0")/duporg-config"

duplicity --use-agent --include-regex='(.+)\.org$'  --exclude='**' \
    --encrypt-key "$ENCRYPT_KEY" \
    --sign-key "$SIGN_KEY" \
    "$REMOTE_URL" \
    "$FETCH_LOCAL_URL"
