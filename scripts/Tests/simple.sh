#!/bin/bash
source /home/ed/scripts/Tests/try_func.sh

spin() {
  local i=0
  local sp='/-\|'
  local n=${#sp}
  printf ' '
  sleep 0.1
  while true; do
    printf '\b%s' "${sp:i++%n:1}"
    sleep 0.1
  done
}

pingnow() {
ping google.com
}

first='abc'
second='abcdef'
p_append $first $second
echo $second
