#!/bin/bash

sudo snap remove flutter
sed -i '/\/opt\/flutter\/bin/d' ~/.bashrc
source ~/.bashrc

# Uninstall VS Code extensions
code --uninstall-extension dart-code.dart-code
code --uninstall-extension dart-code.flutter
