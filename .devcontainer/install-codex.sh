#!/bin/sh
set -eu

# Set CODEX_VERSION to a specific npm version, or leave it unset for the latest.
codex_version=${CODEX_VERSION:-latest}
npm install --global "@openai/codex@${codex_version}"
codex --version
