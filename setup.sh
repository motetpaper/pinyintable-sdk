#!/usr/bin/env bash
##
## setup.sh
## job    : sets up pinyintable room with gcp tts
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

new_key() {
  echo "tts-foo-"$(date +'%s')
}

foo () {

  if [[ -z $(command -v cloudshell) ]]; then
    msg 'WARNING!'
    msg 'cloudshell command not available here...'
  fi

  msg "adding requried packages"
  sudo apt install git tree nano zip jq yq bc -y

  # authenticate
  gcloud init

  GOOGLE_CLOUD_PROJECT=$(gcloud config get-value core/project)
  msg "gcp: ${GOOGLE_CLOUD_PROJECT}"

  ## enable gcp tts for this project
  gcloud services enable texttospeech.googleapis.com

  KEYPATH="${HOME}/key.json"
  if test -f $KEYPATH; then
    ## set g auth
    msg 'key already exists'
    msg 'setting GOOGLE_APPLICATION_CREDENTIALS'
    export GOOGLE_APPLICATION_CREDENTIALS=${KEYPATH}
  else
    FOOKEY=$(new_key)
    msg ${FOOKEY}
    gcloud iam service-accounts create ${FOOKEY}   --display-name "tts api service account"
    gcloud iam service-accounts keys create ${KEYPATH}   --iam-account ${FOOKEY}@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com
  fi

}

foo
