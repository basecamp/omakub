#!/bin/bash

if [[ -v OMAKUB_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKUB_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$OMAKUB_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
