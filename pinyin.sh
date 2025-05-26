#!/usr/bin/env bash
##
## pinyin.sh
## job    : makes synthetic speech pinyin audio file with google tts
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

## foo method
foo() {

  if [[ -z $(command -v yq) ]]; then
    msg 'yq missing, run setup'
    msg '$ bash setup.sh'
    return
  fi

  if [[ -z $(command -v jq) ]]; then
    msg 'jq missing, run setup'
    msg '$ bash setup.sh'
    return
  fi

  if [[ -z $(command -v tree) ]]; then
    msg 'tree missing, run setup'
    msg '$ bash setup.sh'
    return
  fi

  if [[ "$1" ]]; then

    pytext="$1"

  else
    msg "requires pinyin argument"
    msg "try: $ bash pinyin.sh hao3"
    return
  fi

  outdir="out/"
  mkdir -p $outdir

  #converts umlaut-u to ascii-v
  pymp3="${pytext//ü/v}.mp3"
  pypath=$outdir$pymp3

  if test -f $pypath; then
    echo "$pypath already exists"
    return
  fi

  req() {

  VCODE=$(yq -r '.voice.languageCode' config.yaml)
  VNAME=$(yq -r '.voice.name' config.yaml)
  VGENDER=$(yq -r '.voice.gender' config.yaml)

  ## debug
  # msg $VCODE
  # msg $VNAME
  # msg $VGENDER

  msg "..." && cat << MOO > req.json && msg "req.json... done."
{
  "input": {
      "ssml": "<speak><phoneme alphabet='pinyin' ph='${text}'>${text}</phoneme></speak>"
  },
  "voice": {
    "languageCode": "${VCODE}",
    "name": "${VNAME}",
    "ssmlGender": "${VGENDER}"
  },
  "audioConfig": {
    "audioEncoding": "MP3"
  }
}
MOO

    cat req.json

    curl -X POST -H "Authorization: Bearer $(gcloud auth print-access-token)" \
    -H "x-goog-user-project: ${GOOGLE_CLOUD_PROJECT}" \
    -H "Content-Type: application/json; charset=utf-8" \
    -d @req.json "https://texttospeech.googleapis.com/v1/text:synthesize" > tmp.json

    sleep 2

    cat tmp.json | jq -r .audioContent | base64 --decode > $fnpath
    sleep 2

    tree ${outdir}
  }

  text=$pytext
  fnpath=$pypath

  msg "text is ${text}"
  msg "fnpath is ${fnpath}"

  req
}

foo "$@"
