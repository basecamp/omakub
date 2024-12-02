cd /tmp
curl -s https://api.github.com/repos/getzola/zola/releases/latest | rg -N "browser_download_url" | rg -N --color never "zola.*linux-gnu.tar.gz" | sd '"' "'" | choose 1 | xargs -I % xh -F -o zola.tar.gz GET %
mkdir -p zola
tar xf zola.tar.gz -C zola
install -m755 zola/zola $HOME/.local/bin
rm -rf zola zola.tar.gz
cd -
