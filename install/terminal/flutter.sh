#!/bin/

sudo snap install flutter --classic
sudo snap alias flutter.dart dart
flutter --version

echo "export PATH=\$PATH:/opt/flutter/bin" >> ~/.bashrc
source ~/.bashrc
flutter doctor

# Install VS Code extensions
code --install-extension dart-code.dart-code --force
code --install-extension dart-code.flutter --force
