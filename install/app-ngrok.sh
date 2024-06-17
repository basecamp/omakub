cd ~/Downloads
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar xvzf ngrok-v3-stable-linux-amd64.tgz
sudo cp -f ngrok /usr/local/bin
rm -f ngrok-v3-stable-linux-amd64.tgz
rm -f ngrok
# ngrok config add-authtoken <token>
cd -
