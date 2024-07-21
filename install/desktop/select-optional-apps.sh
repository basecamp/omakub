#source the utils if not sourced already
if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi

if [[ -v OMAKUB_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKUB_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			trap "handle_omakub_source_error $app" ERR
			source "$OMAKUB_PATH/install/desktop/optional/app-${app,,}.sh" \
			&& handle_omakub_source_success "$app"
    		trap - ERR
		done
	fi
fi
