#!/usr/bin/env bash

set -euxo pipefail

envsubst < cloud-tests.tpl.md > cloud-tests.md

exit_status=0

ucm transcript cloud-tests.md || exit_status=$?
cat cloud-tests.output.md

exit "$exit_status"
