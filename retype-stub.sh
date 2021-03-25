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
 exit 0
fi

echo "${result}"

if [ "${1}" == "init" ]; then
 echo "Creating fake retype.json file"
 echo "fake retype.json file with fake data.
${result}" > "./retype.json"
elif [ -z "${dest}" ]; then
 echo "Ops, no dest. :S"
 exit 1
elif [ "${1}" == "build" ]; then
 echo "Fake-building something."
 if [ ! -d "${dest}/resources/js" ]; then
  mkdir -p "${dest}/resources/js" || exit 1
 fi
 echo 'var __DOCS_CONFIG__ = {"id":"awxMd174ru62ccYNxSn5U4o5+IBp2u19w3f","base":"/","version":"1.0.0","sidebarFilterPlaceholder":"Filter","toolbarFilterPlaceholder":"Filter","showSidebarFilter":true,"filterNotFoundMsg":"No member names found containing the query \"{query}\"","maxHistoryItems":15,"scrollOffset":20,"homeIcon":"<path d=\"M12.97 2.59a1.5 1.5 0 00-1.94 110 0l-7.5 6.363A1.5 1.5 0 003 10.097V19.5A1.5 1.5 0 004.5 21h4.75a.75.75 0 00.75-.75V14h4v6.25c0 .414.336.75.75.75h4.75a1.5 1.5 0 001.5-1.5v-9.403a1.5 1.5 0 00-.53-1.144l-7.5-6.363z\"></path>","access":[{"value":"public","label":"Public"},{"value":"private","label":"Private"},{"value":"protected","label":"Protected"},{"value":"internal","label":"Internal"}],"toolbarLinks":[{"id":"fields","label":"Fields"},{"id":"properties","label":"Properties","shortLabel":"Props"},{"id":"methods","label":"Methods"},{"id":"events","label":"Events"}],"sidebar":[{"n":"/","l":"Retype App&#39;s GitHub Actions (RAGHA) - Tests project.","s":"<path fill-rule=\"evenodd\" d=\"M11.03 2.59a1.5 1.5 0 011.94 0l7.5 6.363a1.5 1.5 0 01.53 1.144V19.5a1.5 1.5 0 01-1.5 1.5h-5.75a.75.75 0 01-.75-.75V14h-2v6.25a.75.75 0 01-.75.75H4.5A1.5 1.5 0 013 19.5v-9.403c0-.44.194-.859.53-1.144l7.5-6.363zM12 3.734l-7.5 6.363V19.5h5v-6.25a.75.75 0 01.75-.75h3.5a.75.75 0 01.75.75v6.25h5v-9.403L12 3.734z\"/>"}],"search":{"minChars":3,"maxResults":20,"placeholder":"Search","hotkeys":["/"],"noResultsFoundMsg":"Sorry, no results found."}};' > "${dest}/resources/js/config.js"
 for file in resources/js/retype.js index.html; do
  echo "fake ${file}
${result}" > "${dest}/${file}"
 done
else
 echo "invalid command: ${1}"
 exit 1
fi