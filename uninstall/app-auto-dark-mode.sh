SERVICE_NAME=darkmode-monitor.service

sudo systemctl stop $SERVICE_NAME
sudo systemctl disable $SERVICE_NAME
sudo rm /etc/systemd/system/$SERVICE_NAME
sudo systemctl daemon-reload
