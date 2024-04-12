#!/usr/bin/env bash

set -euxo pipefail

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"/..

systemctl --user disable --now wsl-win32-openssh-agent.socket

rm -f "$HOME/.config/systemd/user/wsl-win32-openssh-agent"{.socket,@.service}

systemctl --user daemon-reload

set +x
echo
echo 'Uninstallation complete. Please remove the following line from your ~/.bashrc or ~/.zshrc:'
echo 'export SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent-win32-openssh.socket"'
