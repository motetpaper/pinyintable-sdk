#!/usr/bin/env bash
##
## buildu.sh
## job    : runs check, exports valid mp3 files from gcp
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

foo() {

  if [[ -z $(command -v zip) ]]; then
    msg 'zip missing, run setup'
    msg '$ bash setup.sh'
    return
  fi

  if [[ -z $(command -v cloudshell) ]]; then
    msg 'not in google cloudshell, nothing exported'
  else
    bash check.sh

    if test -d out/ ;then
      rm -rfv out.zip
      zip -r out.zip $(cat valid.log)
      cloudshell download-file out.zip
    else
      msg "nothing to export"
    fi

  fi
}

foo

