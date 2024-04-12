#!/usr/bin/env bash

set -euxo pipefail

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"/..

mkdir -p "$HOME/.config/systemd/user"
cp -i systemd-unit/* "$HOME/.config/systemd/user"

systemctl --user daemon-reload
systemctl --user enable --now wsl-win32-openssh-agent.socket

set +x
echo
echo 'Installation complete. Please add the following line to your ~/.bashrc or ~/.zshrc:'
echo 'export SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent-win32-openssh.sock"'
