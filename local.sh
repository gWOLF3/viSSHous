#!/bin/bash


echo SetEnv LC_MONETARY=$(cat ~/.vimrc | base64) > ~/.ssh/config
