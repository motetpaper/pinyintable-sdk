# This repo helps you build a custom pinyintable (hanyu pinyin audio library) by generating natural-sounding Hanyu Pinyin audio files using Google Cloud Text-to-Speech (TTS) service. If you simply need a generic pinyintable with pinyin sounds, you can use this [hanyu pinyin mp3 audio library](https://github.com/motetpaper/pinyintable-mp3).

## Purpose

The purpose of the **pinyintable** is provide a readily-available library of Hanyu Pinyin audio files.

Here is a pinyintable examplar with all 2050 pinyin tones:
  + https://github.com/motetpaper/pinyintable-mp3

You can serve these files over HTTPS, or you can cache them locally.

Also, you can combine the individual pinyin table syllables to create words and phrases and/or to support other software packages.

> **NOTE:**
> ***This repo is designed for monosyllabic speech synthesis only.*** Tone sandhi means that tones may change based on combinations (e.g. when spoken *ni3hao3* becomes *ni2hao3*). Thus, you probably want to use actual Chinese characters as TTS input, and allow Google to provide you with the correct tone changes.

You can use a **pinyintable** for:
  + Pinyin text-to-speech services
  + Audio flashcards
  + Pronunciation practice
  + Spaced-repitition system listening practice
  + Mandarin Chinese videos or shorts on YouTube
  + PowerPoint slide presentations

## Project Scope

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

# SETUP

Clone the repo.
```bash
$ git clone https://github.com/motetpaper/pinyintable-sdk
````

>[!IMPORTANT]
> If you do not authenticate, you will not have access to restricted Google Cloud resources.

Authenticate.
```bash
$ gcloud init
```

In the repo root ...
```bash
$ cd pinyintable-sdk
```

Run setup.
```bash
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

You can review the invalid ones:
```bash
$ cat invalid.log
```


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


