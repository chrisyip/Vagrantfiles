#!/usr/bin/env bash

echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
apt-get update
apt-get install -y python-software-properties python g++ make

apt-get install -y vim dialog

# Let npm install packages without unexpected exception
chown -R $USER /usr/local

# Install node
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs

# Install cnpm to speed up package installation for people in China
npm install -g cnpm --registry=http://r.cnpmjs.org
cnpm -g forever nodemon

cd /var/www
cnpm install

# Start node server, change it at your own

# Use grunt / gulp install
# cnpm -g grunt-cli gulp

# By default, use forever and nodemon to keep server running
forever start -d -c nodemon --debug app.js
