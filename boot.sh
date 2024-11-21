set -e

ascii_art=$(cat <<'EOF'
                 _                    _    _           __ _      
  ___ _ __  __ _| |____ _ ___ ___ ___| |__| |_  _ ___ / _(_)_ _  
 / _ \ '  \/ _` | / / _` (_-</ -_)___| '_ \ | || / -_)  _| | ' \ 
 \___/_|_|_\__,_|_\_\__,_/__/\___|   |_.__/_|\_,_\___|_| |_|_||_|
EOF
)

echo -e "$ascii_art"
echo "=> omakase-bluefin is for fresh bluefin-stable installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

echo "Cloning omakase-bluefin..."
rm -rf ~/.local/share/omakase-bluefin
git clone https://github.com/lukehsiao/omakase-bluefin.git ~/.local/share/omakase-bluefin>/dev/null

echo "Installation starting..."
source ~/.local/share/omakase-bluefin/install.sh
