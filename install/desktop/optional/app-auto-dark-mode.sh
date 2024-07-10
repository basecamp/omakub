cat > /tmp/darkmode-monitor.service <<EOT
[Unit]
Description=Dark Mode Monitor
After=graphical-session.target

[Service]
Type=simple
ExecStart=$OMAKUB_PATH/bin/dark-mode-switch.sh
Restart=always
User=$USER
Environment=OMAKUB_PATH=$OMAKUB_PATH
Environment=XDG_RUNTIME_DIR=/run/user/$(id -u)
Environment=DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

[Install]
WantedBy=default.target
EOT

sudo mv /tmp/darkmode-monitor.service /etc/systemd/system/darkmode-monitor.service

sudo systemctl daemon-reload
sudo systemctl enable darkmode-monitor.service
sudo systemctl start darkmode-monitor.service
