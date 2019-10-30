#!/bin/bash

if ! grep -qR "Include ~/.ssh/viSSHous" ~/.ssh/config
  then echo 'Include ~/.ssh/viSSHous' >> ~/.ssh/config
fi
  

echo "# last updated: $(date)" > ~/.ssh/viSSHous
echo "SetEnv LC_MONETARY=$(cat ~/.vimrc | base64)" >> ~/.ssh/viSSHous
echo 'RemoteCommand echo $LC_MONETARY > ~/.vim/visshnu; base64 --decode ~/.vim/visshnu > ~/.vimrc; bash' >> ~/.ssh/viSSHous
echo "RequestTTY yes" >> ~/.ssh/viSSHous
