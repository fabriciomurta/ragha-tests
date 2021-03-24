#!/bin/bash

dest="$(echo "${@}" | egrep "\"output\":" | cut -f4 -d\")"

function dumparr() {
 for i in "${@}"; do
  echo -n " [\"${i}\"]"
 done
}

result="- Commandline arguments:
$(dumparr "${@}")
- end of arguments list"

if [ "${1}" == "--version" ]; then
 echo "1.2.0"
fi

echo "${result}"

if [ -z "${dest}" ]; then
 echo "Ops, no dest. :S"
 exit 1
elif [ "${1}" == "init" ]; then
 echo "Creating fake retype.json file"
 echo "fake retype.json file with fake data.
${result}" > "./retype.json"
elif [ "${1}" == "build" ]; then
 echo "Fake-building something."
 if [ ! -d "${dest}" ]; then
  mkdir -p "${dest}" || exit 1
 fi
 echo "fake index.html
${result}" > "${dest}/index.html"
else
 echo "invalid command: ${1}"
 exit 1
fi