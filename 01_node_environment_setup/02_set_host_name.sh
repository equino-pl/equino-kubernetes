#!/bin/bash

if [ $# -ne 1 ]
  then
    echo "No argument supplied. Requires host name as argument"
    exit -1
fi

echo $1 > /etc/hostname
hostname -F /etc/hostname
