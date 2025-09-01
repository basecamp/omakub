#!/bin/bash

sudo apt-get remove --purge -y "libreoffice*"
sudo apt-get -y clean
sudo apt-get -y autoremove