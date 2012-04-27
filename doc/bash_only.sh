#!/bin/bash
#
# An example script on how to use netcat (nc) for those very
# old CentOS servers you don't want to install rvm/ruby/gems on...
#

DATE=$(date +'%Y-%m-%d %H:%M:%S')
l_info()  { echo ${DATE} "INFO:  $*"; }
l_debug() { echo ${DATE} "DEBUG: $*"; }
l_warn()  { echo ${DATE} "WARN:  $*"; }

HOST="localhost"
POST_URL="/RPC"
PORT="8999"
USER_AGENT="nc"

gen_json_req() {
  METHOD=${1}
  shift
  PARAMS=$(echo $* | sed -e 's/ /,/g')
  REPLY=$(cat <<EOF
[
{"jsonrpc": "2.0", "method": "${METHOD}", "params": [${PARAMS}], "id": 1},
{"jsonrpc": "2.0", "method":"system.listMethods", "id":2},
{"jsonrpc": "2.0", "method":"system.isAlive", "id":3},
{"jsonrpc": "2.0", "method":"system.isAlive", "id":4},
{"jsonrpc": "2.0", "method": "sub", "params": [40,20], "id": 5}
]
EOF
  )
}

gen_json_req sum 1 2 3

BODY=${REPLY}

SIZE=$(echo ${BODY} | wc -c)

MSG=$(cat <<EOF
POST ${POST_URL} HTTP/1.1
User-Agent: ${USER_AGENT}
Host: ${HOST}
Content-Type: text/json
Content-length: $(echo ${SIZE})

${BODY}
EOF
)

l_debug "${MSG}" && echo
l_debug Sending Message to ${HOST}:${PORT}

RES=$(echo "${MSG}" | nc ${HOST} ${PORT} | grep 'jsonrpc')


echo "$RES" | $(dirname $0)/../support/JSON_bash/JSON.sh

if [[ $? -eq 0 ]]; then
   echo; l_info Message successfully sent to ${HOST}:${PORT}
fi

