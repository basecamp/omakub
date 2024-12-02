#!/usr/bin/env bash
set -euxo pipefail
cd /tmp
curl --proto '=https' --tlsv1.2 -sSLO https://github.com/github/git-sizer/releases/download/v1.5.0/git-sizer-1.5.0-linux-amd64.zip
unzip -o git-sizer-1.5.0-linux-amd64.zip -d tmp-git-sizer
install -m755 tmp-git-sizer/git-sizer $HOME/.local/bin/
rm -rf git-sizer-1.5.0-linux-amd64.zip tmp-git-sizer
cd -
