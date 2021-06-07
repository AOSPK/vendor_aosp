#!/bin/bash

zipPath=${1}
version=${2}
device=${3}
type=${4}
android=${5}

dateTime=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.build.date.utc' $(dirname $zipPath)/system/build.prop)")
apps=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.custom.apps.version' $(dirname $zipPath)/system/build.prop)")
zip=$(basename "$zipPath")
md5=$(cat "$zipPath.md5sum" | cut -d' ' -f1)
size=$(ls -lat $zipPath | cut -d ' ' -f 5)
url="https://master.dl.sourceforge.net/project/aospk/$android/$device/$apps/$zip"

function generateJson() {
  echo '    {'
  echo '      "datetime": "'$dateTime'",'
  echo '      "filename": "'$zip'",'
  echo '      "id": "'$md5'",'
  echo '      "size": "'$size'",'
  echo '      "url": "'$url'",'
  echo '      "romtype": "'$apps'",'
  echo '      "android": "'$android'",'
  echo '      "version": "'$version'"'
  echo '    }'
}

function printInfos() {
  echo
  echo 'Information for official maintainers:'
  echo 'After testing the build, publish to SourceForge'
  echo 'Submit your build to the AOSPK/official_devices repository with the json content below.'
  echo
}

if [ $type = OFFICIAL ];then
  generateJson > $zipPath.json
  echo
  # printInfos
  echo
  cat $zipPath.json
fi
