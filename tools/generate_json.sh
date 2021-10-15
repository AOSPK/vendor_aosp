#!/usr/bin/env bash

zipPath=${1}
version=${2}
device=${3}
type=${4}
android=${5}

dateTime=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.build.date.utc' $(dirname $zipPath)/system/build.prop)")
apps=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.kraken.ziptype' $(dirname $zipPath)/system/build.prop)")
apps=$(echo "$apps" | tr '[:upper:]' '[:lower:]')
zip=$(basename "$zipPath")
md5=$(cat "$zipPath.md5sum" | cut -d' ' -f1)
size=$(ls -lat $zipPath | cut -d ' ' -f 5)
url="https://master.dl.sourceforge.net/project/aospk/${android}/${device}/${apps}/${zip}"

generate_json() {
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

if [[ $type != "UNOFFICIAL" ]]; then
  generate_json > $zipPath.json
fi
