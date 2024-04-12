# wsl-win32-openssh-agent

A set of systemd units to forward SSH agent socket from Windows to WSL.

## Requirements

- WSL
  - systemd
  - OpenSSH
- Windows
  - [npiperelay](https://github.com/jstarks/npiperelay)
    - Install: `scoop install extras/npiperelay`
  - Win32-OpenSSH

NOTE: The OpenSSH agent protocol has changed in version 8.9. **If OpenSSH v8.9 or later is installed in WSL and the Win32-OpenSSH is older than v8.9, the agent will not work.** You can check the versions by running `ssh -V` in WSL and PowerShell.

If you are using an older version of Win32-OpenSSH, you can install the latest version with the following commands:

```powershell
Remove-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
Remove-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
winget install "openssh beta"
```

You might need to restart the computer after running these commands to update the PATH.

- https://zenn.dev/mametter/articles/49a2b505ec0275
- https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=powershell#uninstall-openssh-for-windows
- https://github.com/PowerShell/Win32-OpenSSH/wiki/Install-Win32-OpenSSH

## Install

```sh
git clone https://github.com/ciffelia/wsl-win32-openssh-agent.git
cd wsl-win32-openssh-agent

# Edit the path to npiperelay.exe in bin/install.sh
sed -i 's|npiperelay.exe|/mnt/c/Users/path/to/npiperelay.exe|' systemd-unit/wsl-win32-openssh-agent@.service

./bin/install.sh
```

## Uninstall

```sh
./bin/uninstall.sh
```
