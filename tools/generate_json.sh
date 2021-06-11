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
jsonPath=$(basename $zipPath .zip)

function generate_json() {
echo -e "\n  {
    \"dateTime\": \"${dateTime}\",
    \"filename\": \"${zip}\",
    \"id\": \"${md5}\",
    \"size\": \"${size}\",
    \"url\": \"${url}\",
    \"romtype\": \"${apps}\",
    \"android\": \"${android}\",
    \"version\": \"${version}\"
  }"
}

if [ $type = "OFFICIAL" ];then
  generate_json > $jsonPath.json
  echo -e "\nTESTEInformation for official maintainers:\nAfter testing the build, publish to SourceForge\nSubmit your build to the AOSPK/official_devices repository with the json content below."
  cat $jsonPath.json
  echo
fi
