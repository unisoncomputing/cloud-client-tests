#!/bin/bash

set -euxo pipefail

release_file_name() {
  case $"UCM_RELEASE" in
    "release%2F0.5.25" | "release%2F0.5.26" | "release%2F0.5.27")
      echo "ucm-linux.tar.gz"
      ;;
    *)
      echo "ucm-linux-x64.tar.gz"
      ;;
  esac
}

curl --fail-with-body -L "https://github.com/unisonweb/unison/releases/download/${UCM_RELEASE}/$(release_file_name)" | tar -xz

envsubst < cloud-tests.tpl.md > cloud-tests.md

exit_status=0

./ucm transcript cloud-tests.md || exit_status=$?
cat cloud-tests.output.md

exit "$exit_status"
