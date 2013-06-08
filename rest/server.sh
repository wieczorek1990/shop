#!/bin/bash
pid=`ps -ef | grep script/rails | grep -v grep | tr -s ' ' '|' | cut -f 2 -d '|'`
if [ -n "$pid" ]; then
  kill -9 $pid > /dev/null 2>&1
fi
rails server > /dev/null 2>&1 &
