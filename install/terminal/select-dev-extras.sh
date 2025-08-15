#!/bin/bash

if [ ! -n "$(type sdk 2>/dev/null)" ]; then
  curl -sS "https://get.sdkman.io" | bash >/dev/null &
  gum spin --spinner monkey --title "Preparing SDKMAN..." -- sleep 3
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  clear
fi

# Install default databases
AVAILABLE_EXTRAS=("Quarkus" "Gradle" "Maven" "VisualVM" "JMeter" "Tomcat")
extras=$(gum choose "${AVAILABLE_EXTRAS[@]}" --no-limit --height 10 --header "Select development extras")

if [[ -n "$extras" ]]; then
  for extra in $extras; do
    case $extra in
    Quarkus)
      sdk install quarkus
      ;;
    Gradle)
      sdk install gradle
      ;;
    Maven)
      echo "Installing Maven"
      sdk install maven
      ;;
    VisualVM)
      sdk install visualvm
      ;;
    JMeter)
      sdk install jmeter
      ;;
    Tomcat)
      sdk install tomcat
      ;;
    esac
  done
fi
