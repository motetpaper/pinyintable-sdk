#!/usr/bin/env bash
##
## clean.sh
## job    : cleans tempfiles and outfiles
## git    : https://github.com/motetpaper/pinyintable-sdk
## lic    : MIT
##
##
##
##
PROG=$(basename $0)

msg() {
  echo "[$PROG] $1"
}

rm -rfv *.json *.log out/
msg 'clean complete'
