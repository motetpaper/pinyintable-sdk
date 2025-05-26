#!/usr/bin/env bash
##
## buildu.sh
## job    : batch creates pinyin tts files with user.req.txt
## git    : https://github.com/motetpaper/pinyintable-sdk
## lic    : MIT
##
##
##
##
PROG=$(basename $0)
INFILE='user.req.txt'

msg() {
  echo "[$PROG] $1"
}

foo() {

  if test -f ${INFILE}; then

    if [[ -z $(cat ${INFILE}) ]]; then
      msg "${INFILE} is empty, exiting"
      return
    fi

    msg "using LIST from ${INFILE}"

    while read line; do
      msg "$line"
      bash pinyin.sh $line;
    done < ${INFILE}

    msg 'work complete'
  else
    msg "${INFILE} not found"
    msg "adding ${INFILE}, ready for editing"
    touch ${INFILE}
  fi
}

foo
