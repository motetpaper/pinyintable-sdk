# This repo helps you build a custom pinyintable (hanyu pinyin audio library) by generating natural-sounding Hanyu Pinyin audio files using Google Cloud Text-to-Speech (TTS) service.

## Purpose

The purpose of the pinyintable is provide a readily-available library of pinyin audio files.

You can serve these files over HTTPS, or you can cache them locally. Also, you can combine them to various combinations with other software packages.

This repo provides a resource for using the voice, language and other options available in the Google Cloud TTS for the specific purpose of generating Hanyu Pinyin sound files.

You can change the options in the `config.yaml` file.

You can use a **pinyintable** for:
  + Pinyin text-to-speech services
  + Audio flashcards
  + Pronunciation practice
  + Spaced-repitition system listening practice
  + Mandarin Chinese videos or shorts on YouTube
  + PowerPoint slide presentations.

>[!IMPORTANT]
> Documentation is in progress. For now, only workflows are available.

## Before we begin

If you are an absolute beginner, you should read the Google Cloud TTS Quick Start tutorial.

## Requirements

  + Google Cloud Shell (preferred)
    + https://shell.cloud.google.com/
    + many dev tools are already pre-installed


## SETUP

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

The `out/` folder is generated. Check if your file is successfully created.

```bash
$ bash check.sh
```

The file `valid.log` should appear. The generated file should in that log.

Double-check:
```bash
$ ls -sh out
```

The file size should be "8.0K". If the file is less than 8K, check the `tmp.json` for possible errors.

# Batch processing

You can generate multiple pinyin sounds at the same time using `buildu.sh` and `user.req.txt`

## `user.req.txt`

Add one pinyin syllable per line.

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

Then, run `buildu.sh` to convert each syllable.

```bash
$ bash buildu.sh
```

### More ways to select lots of pinyin

View `pset.datadict` for details.
