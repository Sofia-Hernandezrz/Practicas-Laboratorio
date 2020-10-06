#!/usr/bin/env bash
set -euo pipefail
API_User=$1
curl "https://api.github.com/users/$API_User/repos"

