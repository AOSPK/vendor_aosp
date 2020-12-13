#!/bin/bash

zip=${1}
version=${2}
device=${3}
type=${4}

datetime=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.build.date.utc' $(dirname $zip)/system/build.prop)")
zip_name=$(basename "$zip")
md5=$(cat "$zip.md5sum" | cut -d' ' -f1)
size=$(stat --printf="%s" "$zip")
url="https://master.dl.sourceforge.net/project/aospk/$device/$zip_name"

function generate_json() {
  echo '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░'
  echo
  echo 'Information for official maintainers:'
  echo 'After testing the build, publish to SourceForge'
  echo 'Submit your build to the AOSPK/official_devices repository with the json content below.'
  echo '$zip.json'
  echo
  echo '    {'
  echo '      "datetime": "'$datetime'",'
  echo '      "filename": "'$zip_name'",'
  echo '      "id": "'$md5'",'
  echo '      "romtype": "OFFICIAL",'
  echo '      "size": "'$size'",'
  echo '      "url": "'$url'",'
  echo '      "version": "'$version'"'
  echo '    }'
  echo
}

if [ $type == "UNOFFICIAL" ];then
  echo
else
  generate_json > $zip.json
  cat $zip.json
fi
