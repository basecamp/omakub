#source the utils if not sourced already
if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi

if [[ -v OMAKUB_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKUB_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			if source "$OMAKUB_PATH/install/desktop/optional/app-${app,,}.sh"; then
				handle_omakub_source_success "$app"
			else 
				handle_omakub_source_error "$app"
			fi
		done
	fi
fi
