# viSSHous
### "infect remote ssh sessions with your vim profile"
![Visshous Logo](./icon.jpg)
#### The goal of Visshous is to enable you to automatically transport your .vimrc profile settings when doing work on remote servers, without having to manually 'copy/paste' or 'scp/sftp' files.

--- 

#### Requirements:
 
- plugin manager (if you use one) must be installed manually on remote machine 

#### Quickstart:

##### Manual Mode:

From local machine: 

```sh
sh vissh
```
Then, simply use ssh as normal:

```sh
ssh <remote-machine>
```

##### Daemon Mode:

_Daemon mode will create a user daemon to watch your "~/.vimrc" file for changes, and make sure you take those updates with you across servers._

With Homebrew (Mac):

```sh
brew tap gwolf3/homebrew-craft
brew install visshous
```

You should now be able to see the launchd process running:

```sh
brew services list
```


#### How does it work? 

Visshous exploits the default sshd configuration to pass your vimrc without having to configure extra settings. We do this by using the fact that 'sshd' allows by default 'locale config' variables (see `man locale` if you're curious) to be passed on through a remote host. To exploit this, we simply base64 encode our local .vimrc file, and pass that in through the ssh protocol itself as an env variable. Then, we can simply decode our remote vimrc from that env variable. Because this solution passes the configuration in an 'ssh-native' way, its a bit cleaner . 

#### What's Next? 
- [ ] Apt packager distribution for systemd user daemon (Linux)
- [ ] Consider auto installing vim package manager on remote


#### Tested On:
- [X] Debian
- [X] Ubuntu
- [X] Mac
