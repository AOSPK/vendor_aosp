#!/bin/bash

zip_path=${1}
version=${2}
device=${3}
type=${4}
android=${5}

datetime=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.build.date.utc' $(dirname $zip_path)/system/build.prop)")
apps=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.custom.apps.version' $(dirname $zip_path)/system/build.prop)")
zip=$(basename "$zip_path")
md5=$(cat "$zip_path.md5sum" | cut -d' ' -f1)
size=$(ls -lat $zip_path | cut -d ' ' -f 5)
url="https://master.dl.sourceforge.net/project/aospk/$android/$device/$apps/$zip"

function generate_json() {
  echo '    {'
  echo '      "datetime": "'$datetime'",'
  echo '      "filename": "'$zip'",'
  echo '      "id": "'$md5'",'
  echo '      "size": "'$size'",'
  echo '      "url": "'$url'",'
  echo '      "romtype": "'$apps'",'
  echo '      "android": "'$android'",'
  echo '      "version": "'$version'"'
  echo '    }'
}

if [ $type == "OFFICIAL" ]; then
  generate_json > $zip_path.json
fi
