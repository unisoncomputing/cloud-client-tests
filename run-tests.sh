#!/usr/bin/env bash

set -euxo pipefail

envsubst < cloud-tests.tpl.md > cloud-tests.md

exit_status=0
codebase="$PWD/unison-code"

ucm -C "$codebase" transcript.fork --save-codebase-to "$codebase" cloud-tests.md || exit_status=$?
cat cloud-tests.output.md

exit "$exit_status"
