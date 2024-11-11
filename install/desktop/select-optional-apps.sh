if [[ -v omakfed_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$omakfed_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$omakfed_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
