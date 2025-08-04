#!/usr/bin/env bash

set -euxo pipefail

envsubst < cloud-tests.tpl.md > cloud-tests.md

exit_status=0
codebase="$PWD/unison-code"

run_transcript() {
  case "$UCM_RELEASE" in
    "release%2F0.5.25" | "release%2F0.5.41")
      ucm -C "$codebase" transcript.fork --save-codebase-to "$codebase" cloud-tests.md
      ;;
    *)
      ucm -C "$codebase" transcript.in-place cloud-tests.md
      ;;
  esac
}

run_transcript || exit_status=$?
cat cloud-tests.output.md

exit "$exit_status"
