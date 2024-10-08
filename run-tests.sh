#!/bin/bash

set -euxo pipefail

curl --fail-with-body -L "https://github.com/unisonweb/unison/releases/download/${UCM_RELEASE}/ucm-linux-x64.tar.gz" | tar -xz

envsubst < cloud-tests.tpl.md > cloud-tests.md

exit_status=0

./ucm transcript cloud-tests.md || exit_status=$?
cat cloud-tests.output.md

exit "$exit_status"
