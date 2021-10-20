#!/usr/bin/env bash

op=$1
local_=$2
remote=$3
cache_key=$4
archive=$(md5sum $cache_key | awk '{ print $1 }').tar.gz

case $op in
  "restore")
    gsutil -q cp -r $remote/$archive /tmp
    tar -xzf /tmp/$archive -C $local_
    rm /tmp/$archive
    ;;

  "store")
    tar -czf /tmp/$archive $local_
    gsutil -q cp -r /tmp/$archive $remote
    rm /tmp/$archive
    ;;

  *)
    echo "Invalid operation"
    ;;
esac
