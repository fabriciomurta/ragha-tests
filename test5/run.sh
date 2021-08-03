#!/bin/bash

function fail() {
 if [ ! -z "${1}" ]; then
  >&2 echo "error: ${1}"
 fi
 echo "usage:
${0}
${0} devel <path-to-Retype.App-project>
${0} clean"
 exit 1
}

retype_cmd=(retype)
if [ "${1}" == "devel" ]; then
 if [ -z "${2}" ]; then
  fail "path to Retype.App project not specified."
 elif [ ! -e "${2}" ]; then
  fail "unable to locate '${2}'."
 fi

 retype_cmd=(dotnet run --project "${2}" --)
elif [ "${1}" == "clean" ]; then
 retype_cmd=(true)
elif [ ! -z "${1}" ]; then
 fail "unknown argument: ${1}"
fi

if [ -e "hub/resources" ]; then
 echo -n "Wiping previous built test sites: "
 rm -rf "hub/resources"
 echo "done."
fi

echo -n "Creating hello world 'website' inside resources/site3: "
mkdir hub/resources
mkdir hub/resources/site3
cat << EOF > hub/resources/site3/index.html
<html>
 <head>
  <title>My little page</title>
 </head>
 <body>
  <h1>My very cute little page</h1>
  <p>My page contents goes here. Cute page.</p>
  <a href=../..>Back to Hub</a>.
 </body>
</html>
EOF

cat << EOF > hub/resources/index.html
<html>
 <head>
  <title>Intermediate page</title>
 </head>
 <body>
  <h1>My intermediate page</h1>
  <p>My page contents goes here. Cute page.</p>
  <p><a href=..>Up to Hub</a>.</p>
  <p><a href=site1>Down to site1</a>.</p>
  <p><a href=site2>Down to site2</a>.</p>
 </body>
</html>
EOF

for i in 1 2; do
 "${retype_cmd[@]}" build site${i} || fail "unable to build 'site${i}/' project"
done

if [ -e "hub/.retype" ]; then
 echo -n "Wiping previous built hub site: "
 rm -rf "hub/.retype"
 echo "done."
fi

"${retype_cmd[@]}" watch hub
