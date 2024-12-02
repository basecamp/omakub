if [[ -v OMAKASEBLUE_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKASEBLUE_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$OMAKASEBLUE_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
