#!/bin/bash
  

echo $LC_MONETARY > ~/.vim/visshnu
base64 --decode ~/.vim/visshnu > ~/.vimrc
