#!/usr/bin/env bash

set -e

PROGNAME=$(basename $0)
HOST_FILE="/etc/hosts"
LIST_FILE="$HOME/.hosts.list"

START_TAG="### START ###"
END_TAG="### END ###"

usage() {
  cat << EOF
Usage: $PROGNAME [OPTION]
Simple adblock
Options:
status       Check if it's active or not
update       Update the list of DNS to be blocked
start        Activate blocking DNS.
stop         Stop blocking DNS.
--help       Display this usage message and exit
EOF
  exit 1
}

get_hosts() {
  curl -L -s "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-porn/hosts" |\
    sed '1,35d' | sed '/^#/ d' | sed "1i\\$START_TAG" > $LIST_FILE
  echo "$END_TAG" >> $LIST_FILE
}

status() {
  if grep -qF "$START_TAG" "$HOST_FILE"; then
    echo "Active"
  else
    echo "Not active"
  fi
}

start() {
  echo "Starting..."
  echo "Hosts file: $HOST_FILE"
  echo "List file: $LIST_FILE"
  if [[ -f $LIST_FILE ]]; then
    echo "Starting blocker..."
    sudo cat "$LIST_FILE" >> "$HOST_FILE"
    echo "Adblocker engaged"
  else
    echo "List file does not exist"
    echo "Creating list..."
    get_hosts
    sudo cat "$LIST_FILE" >> "$HOST_FILE"
    echo "Adblocker engaged"
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    status)
      status
      ;;
    start)
      start
      ;;
    stop)
      echo "Stopping..."
      sed -i "/$START_TAG/,/$END_TAG/d" "$HOST_FILE"
      echo "Adblocker disengaged"
      ;;
    update)
      get_hosts
      ;;
    --help|-h)
      usage
      ;;
    *)
      echo "Unknown option: $1"
      usage
      ;;
  esac
  shift
done

