set -e

ascii_art=$(cat <<'EOF'
                 _                    _    _           __ _      
  ___ _ __  __ _| |____ _ ___ ___ ___| |__| |_  _ ___ / _(_)_ _  
 / _ \ '  \/ _` | / / _` (_-</ -_)___| '_ \ | || / -_)  _| | ' \ 
 \___/_|_|_\__,_|_\_\__,_/__/\___|   |_.__/_|\_,_\___|_| |_|_||_|
EOF
)

echo -e "$ascii_art"
echo "=> omakase-blue is for fresh blue-stable installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

echo "Cloning omakase-blue..."
rm -rf ~/.local/share/omakase-blue
git clone https://github.com/lukehsiao/omakase-blue.git ~/.local/share/omakase-blue>/dev/null

echo "Installation starting..."
source ~/.local/share/omakase-blue/install.sh
