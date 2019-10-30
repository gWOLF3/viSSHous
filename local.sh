#!/bin/bash

<<OpenSSH-7.3
if ! grep -qR "Include ~/.ssh/viSSHous" ~/.ssh/config
  then echo 'Include ~/.ssh/viSSHous' >> ~/.ssh/config
fi
OpenSSH-7.3
  
# workaround until OpenSSH 7.3 is widely adopted
if ! grep -qR 'alias ssh="ssh -F ~/.ssh/viSSHous"' ~/.bashrc
  then echo 'alias ssh="ssh -F ~/.ssh/viSSHous"' >> ~/.bashrc && source ~/.bashrc
fi 

echo "# last updated: $(date)" > ~/.ssh/viSSHous
echo 'Include ~/.ssh/config' >> ~/.ssh/viSSHous
echo "SetEnv LC_MONETARY=$(cat ~/.vimrc | base64)" >> ~/.ssh/viSSHous
echo 'RemoteCommand echo $LC_MONETARY > ~/.vim/visshnu; base64 --decode ~/.vim/visshnu > ~/.vimrc; bash' >> ~/.ssh/viSSHous
echo "RequestTTY yes" >> ~/.ssh/viSSHous
