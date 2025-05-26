#!/usr/bin/env bash
##
## check.sh
## job    : validates mp3 file format, logs results
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

rm -rfv valid.log
rm -rfv invalid.log

fmt="MPEG"
for f in out/*.mp3; do
  if [[ $fmt == $(file $f | cut -d' ' -f2) ]]; then
    echo "$f" >> valid.log
  else
    echo "$f" >> invalid.log
  fi
done

msg 'check complete.'
