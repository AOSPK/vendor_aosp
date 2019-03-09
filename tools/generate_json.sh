#!/bin/bash

zip=${1}
android_version=${2}
device=${3}
build_type=${4}
custom_version=${5}

datetime=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.build.date.utc' $(dirname $zip)/system/build.prop)")
zip_name=$(basename "$zip")
md5=$(cat "$zip.md5sum" | cut -d' ' -f1)
size=$(ls -lat $zip | cut -d ' ' -f 5)
url="https://master.dl.sourceforge.net/project/krakenproject/$device/$zip_name"

function generate_json() {
  echo '    {'
  echo '      "datetime": "'$datetime'",'
  echo '      "filename": "'$zip_name'",'
  echo '      "id": "'$md5'",'
  echo '      "romtype": "OFFICIAL",'
  echo '      "size": "'$size'",'
  echo '      "url": "'$url'",'
  echo '      "kk_version": "'$custom_version'",'
  echo '      "version": "'$android_version'"'
  echo '    }'
}

if [ $build_type == "UNOFFICIAL" ];then
  echo
else
  generate_json > $zip.json
  echo
  echo "JSON:"
  cat $zip.json
fi
