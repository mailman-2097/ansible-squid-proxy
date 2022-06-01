#! /bin/bash -e
cp /etc/apt/sources.list /etc/apt/sources.list.original
sed -i 's#http://us.#http://au.#g' /etc/apt/sources.list
apt-get update
apt-get install build-essential procps curl file git -y