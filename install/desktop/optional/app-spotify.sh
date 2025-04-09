# Stream music using https://spotify.com
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/dnf/trusted.gpg.d/spotify.gpg
echo "deb [signed-by=/etc/dnf/trusted.gpg.d/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/dnf/sources.list.d/spotify.list
sudo dnf update -y
sudo dnf install -y spotify-client
