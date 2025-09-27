#!/bin/sh
exec cargo run \
    --quiet \
    --release \
    --target-dir=/tmp/codecrafters-docker-target \
    --manifest-path "$(dirname "$0")/Cargo.toml" "$@"
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e
tmpFile=$(mktemp)
gcc -lcurl app/*.c -o $tmpFile
exec "$tmpFile" "$@"
