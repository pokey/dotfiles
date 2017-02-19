#!/usr/bin/env bash

username=$1
first=$2
last=$3

adduser $username --gecos "$first $last,,," --disabled-password
echo "$username:$username" | chpasswd
adduser $username sudo
