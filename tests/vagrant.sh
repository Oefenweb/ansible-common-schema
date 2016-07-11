#!/usr/bin/env bash
#
# set -x;
set -e;
set -o pipefail;
#
thisFile="$(readlink -f ${0})";
thisFilePath="$(dirname ${thisFile})";

# Only provision once
if [ -f /provisioned ]; then
  exit 0;
fi

export DEBIAN_FRONTEND=noninteractive;

shopt -s expand_aliases;
alias apt-update='apt-get update -qq';
alias apt-install='apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"';

apt-update;
apt-install debconf-utils;

echo 'mysql-server mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server mysql-server/root_password_again password vagrant' | debconf-set-selections;
echo 'mysql-server-5.1 mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server-5.1 mysql-server/root_password_again password vagrant' | debconf-set-selections;
echo 'mysql-server-5.5 mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server-5.5 mysql-server/root_password_again password vagrant' | debconf-set-selections;
echo 'mysql-server-5.6 mysql-server/root_password password vagrant' | debconf-set-selections;
echo 'mysql-server-5.6 mysql-server/root_password_again password vagrant' | debconf-set-selections;

echo 'percona-server-server-5.6 percona-server-server/root_password password vagrant' | debconf-set-selections;
echo 'percona-server-server-5.6 percona-server-server/root_password_again password vagrant' | debconf-set-selections;

# No 5.7 support in common_schema yet, no 5.6 support in 16.04
if $(lsb_release -r | grep -q '16.04'); then
  apt-install percona-server-server-5.6;
else
  apt-install mysql-server;
fi

cat << EOF > ~/.my.cnf
[client]
host = 127.0.0.1
user = root
password = vagrant
EOF

touch /provisioned;
