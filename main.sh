#!/usr/bin/env bash

op=$1
_local=$2
remote=$3
key=$4

case $op in
  "restore")
    gsutil -q cp $remote/$key.tar.gz /tmp
    tar -xzf /tmp/$key.tar.gz -C $_local
    rm /tmp/$key.tar.gz
    ;;

  "store")
    tar -czf /tmp/$key.tar.gz $_local
    gsutil -q cp /tmp/$key.tar.gz $remote
    rm /tmp/$key.tar.gz
    ;;

  *)
    echo "Invalid operation"
    ;;
esac
