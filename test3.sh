#!/usr/bin/env bash
##
## test2.sh
## job    : testing the check function
## git    : https://github.com/motetpaper/pinyintable-sdk
## lic    : MIT
##
##
##
##
PROG=$(basename $0)
CHECKDIR="testfiles"

msg() {
  echo "[$PROG] $1"
}

check_mp3() {
  fmt="MPEG"
  file="$1"
  msg "checking $f ..."
  if [[ -z $(file $file | grep $fmt) ]]; then
    echo "$file" >> invalid.log
  else
    echo "$file" >> valid.log
  fi
}

rm -rfv valid.log
rm -rfv invalid.log

## testing `testfiles/` instead instead of `out/`
for f in $(find ${CHECKDIR} -type f -name "*.mp3"); do
  check_mp3 $f
done

msg 'check complete.'
