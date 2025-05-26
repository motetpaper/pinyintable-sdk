#!/usr/bin/env bash
##
## test2.sh
## job    : batch pinyin audio file synthesis test
## git    : https://github.com/motetpaper/pinyintable-sdk
## lic    : MIT
##
##
##
##
head -n10 pset.txt | tail -n6 | cut -d' ' -f2 > user.req.txt
rm -rfv out; bash buildu.sh; ls -sh out