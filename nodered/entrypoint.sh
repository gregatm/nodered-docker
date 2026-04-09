#!/bin/bash

trap stop SIGINT SIGTERM

function stop() {
  kill $CHILD_PID
  wait $CHILD_PID
}

wd=${NODE_RED_WORKDIR:-/data}

if ! [ -f ${wd}/package.json ] || [ $(sha1sum ${wd}/package.json /data/package.json | awk '/ /{print $1}' | uniq | wc -l) -ne 1 ]; then
  echo updating ${wd}
  rm -r ${wd}/node_modules ${wd}/package.json
  cp -r /data/package.json /data/node_modules ${wd}/
fi

/usr/local/bin/node $NODE_OPTIONS node_modules/node-red/red.js --userDir $wd $FLOWS "${@}" &

CHILD_PID="$!"

wait "${CHILD_PID}"
