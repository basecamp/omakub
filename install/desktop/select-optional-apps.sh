if [[ -v OMAKASEBLUEFIN_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKASEBLUEFIN_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$OMAKASEBLUEFIN_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
