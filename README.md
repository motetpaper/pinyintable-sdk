# This repo helps you build a custom pinyintable (hanyu pinyin audio library) by generating natural-sounding Hanyu Pinyin audio files using Google Cloud Text-to-Speech (TTS) service.

## Purpose

The purpose of the pinyintable is provide a readily-available library of pinyin audio files.

You can serve these files over HTTPS, or you can cache them locally. Also, you can combine them in various ways and/or with other software packages.

You can use a **pinyintable** for:
  + Pinyin text-to-speech services
  + Audio flashcards
  + Pronunciation practice
  + Spaced-repitition system listening practice
  + Mandarin Chinese videos or shorts on YouTube
  + PowerPoint slide presentations

This repo provides a resource for using the voice, language and other options available in the Google Cloud TTS for the specific purpose of generating Hanyu Pinyin sound files.

You can change the options in the `config.yaml` file.

>[!IMPORTANT]
> Documentation is in progress. For now, only workflows are available.

## Before we begin

If you are an absolute beginner, you should first read the Google Cloud TTS Quick Start tutorial.

  + https://cloud.google.com/text-to-speech/docs/create-audio-text-command-line

## Recommended
  + Google Cloud Shell
    + https://shell.cloud.google.com
    + a lot of the dev tools you need are pre-installed

## Required

  + bash
  + gcloud
  + yq
  + jq
  + tree
  + nano
  + git
  + zip

## SETUP

Clone the repo.
```bash
$ git clone https://github.com/motetpaper/pinyintable-sdk
````

>[!CRITICAL]
> If you do not authenticate, you will not have access to restricted Google Cloud resources.

Authenticate.
```bash
$ gcloud init
```

In the repo root, run setup:
```bash
$ cd pinyintable-sdk
$ bash setup.sh
```

# Single processing

## `pinyin.sh`

Generate one syllable at a time with Google Cloud TTS.
```bash
$ bash pinyin.sh hao3
```

The `out/` folder is generated. 

Check if your file in the folder has been successfully created and is a valid MPEG file.

```bash
$ bash check.sh
```

The files `valid.log` and/or `invalid.log` should appear in the root repo. 

You can review the valid ones:
```bash
$ cat valid.log
```

Double-check the files with another method::
```bash
$ ls -sh out
```

The file size should be "8.0K" or larger. 

If the file is less than 8K, check the `tmp.json` intermediate file for possible errors.

# Batch processing

You can generate multiple pinyin sounds at the same time using `buildu.sh` and `user.req.txt`

## `user.req.txt`

Add one pinyin syllable per line in the `user.req.txt` file.

For example:
```
ni3
hao3
ma5
sheng1
ri4
kuai4
le4
````

Then, run `buildu.sh` to convert each line.

```bash
$ bash buildu.sh
```

## More ways to select lots of pinyin

View `pset.datadict` for details.


# More tools


## `check.sh`

Validates outfiles, saves results to log files.
```bash
$ bash check.sh
```

## `clean.sh`

Removes tempfiles and outfiles.
```bash
$ bash clean.sh
```

## `export.sh`

**Google Cloud Shell in web browsers only.** Checks for valid mp3 files, then downloads a zip archive of valid audio files to the desktop.
```bash
$ bash export.sh
```


