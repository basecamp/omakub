#!/bin/bash

sudo snap install flutter --classic
sudo snap alias flutter.dart dart
flutter --version
flutter doctor

# Install VS Code extension
code --install-extension dart-code.flutter --force
