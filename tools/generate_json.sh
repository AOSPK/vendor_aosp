#!/bin/bash

zipPath=${1}
version=${2}
device=${3}
type=${4}
android=${5}

dateTime=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.build.date.utc' $(dirname ${zipPath})/system/build.prop)")
apps=$(bash -c "cut -d'=' -f2 <<< $(grep 'ro.custom.apps.version' $(dirname ${zipPath})/system/build.prop)")
zip=$(basename "${zipPath}")
md5=$(cat "${zipPath}.md5sum" | cut -d' ' -f1)
size=$(ls -lat ${zipPath} | cut -d ' ' -f 5)
url="https://master.dl.sourceforge.net/project/aospk/${android}/${device}/${apps}/${zip}"

function generate_json() {
  echo "    {"
  echo "      \"datetime\": \""${dateTime}"\","
  echo "      \"filename\": \""${zip}"\","
  echo "      \"id\": \""${md5}"\","
  echo "      \"size\": \""${size}"\","
  echo "      \"url\": \""${url}"\","
  echo "      \"romtype\": \""${apps}"\","
  echo "      \"android\": \""${android}"\","
  echo "      \"version\": \""${version}"\""
  echo "    }"
}

if [ $type = "OFFICIAL" ];then
  generate_json > $zipPath.json
  echo
  echo "Information for official maintainers:"
  echo "After testing the build, publish to SourceForge"
  echo "The correct path is to specify the android version, the device code name and the type of the build, example:"
  echo
  echo "scp FILE.zip YouUser@frs.sourceforge.net:/home/frs/p/aospk/${android}/${device}/${apps}"
  echo
  echo "Submit your build to the github.com/AOSPK/official_devices repository with the json content below:"
  echo
  cat $zipPath.json
  echo
fi
