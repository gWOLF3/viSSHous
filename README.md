# 😈 viSSHous 

![ViSSH Gif](./demo.gif)

# What 

__"Infect Remotes with your Vim profile, every time you SSH."__ 

Visshous enables you to automatically transport your .vimrc profile settings when doing work on remote servers by embedding the setup work into your ssh config itself, without having to manually 'copy/paste' or 'scp/sftp' files.


# Requirements
 
- OpenSSH version >= 7.6

# Quickstart

## Manual Mode

From local machine: 

```sh
sh vissh
```
Then, simply use ssh as normal:

```sh
ssh <remote-machine>
```

## Daemon Mode

> NOTE: _Daemon mode will create a user daemon to watch your "~/.vimrc" file for changes, and make sure you take those updates with you across servers._

### Install with Homebrew (Mac)

```sh
brew tap gwolf3/homebrew-craft
brew install visshous
```

You should now be able to see the launchd process running:

```sh
brew services list
```

### Install with Snap (Linux)

_COMING SOON: AWAITING APPROVAL FROM SNAP STORE_


# How it Works

__At its core, Visshous takes advantage of standard but mostly unused standard sshd configuration variables to pass and install your vimrc/plugins without having to configure extra settings__ ('sshd' by default allows 'locale config' variables - see `man locale` if you're curious- to be passed on through a remote host). Therefore, we simply base64 encode our local .vimrc file, and pass that in through the ssh protocol itself as an env variable. 

Once we're on the host, we decode our remote vimrc from that env variable and unpack/install any extra steps automatically with a RemoteCommand (also natively passed through ssh config). Because this solution passes the configuration in an 'ssh-native' way, it removes the need to take any extra steps. 

#### What's Next? 
- [X] Apt packager distribution for systemd user daemon (Linux)
- [X] Consider auto installing vim package manager on remote


#### Tested On:
- [X] Debian
- [X] Ubuntu
- [X] Mac
