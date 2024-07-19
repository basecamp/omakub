#!/bin/bash

sudo rm -rf /opt/flutter

sed -i '/\/opt\/flutter\/bin/d' ~/.bashrc

source ~/.bashrc
