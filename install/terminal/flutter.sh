#!/bin/

sudo mkdir -p /opt/flutter
sudo git clone https://github.com/flutter/flutter.git /opt/flutter
sudo chown -R $USER:$USER /opt/flutter
git config --global --add safe.directory /opt/flutter

DIR=$(pwd)

cd /opt/flutter
git checkout stable
./bin/flutter --version

cd $DIR

echo "export PATH=\$PATH:/opt/flutter/bin" >> ~/.bashrc
source ~/.bashrc

flutter doctor
