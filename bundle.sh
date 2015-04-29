#!/bin/sh

brew update
brew upgrade

while read cmd; do
  if [[ $cmd != \#* ]] && [[ $cmd != "" ]]
  then
    brew $cmd
  fi
done < Brewfile
