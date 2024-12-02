cd /tmp
curl -s https://api.github.com/repos/Wandmalfarbe/pandoc-latex-template/releases/latest | rg -N "browser_download_url" | rg -N --color never "Eisvogel.tar.gz" | sd '"' "'" | choose 1 | xargs -I % xh -F -o eisvogel.tar.gz GET %
mkdir -p eisvogel
mkdir -p ~/.pandoc/templates
tar xf eisvogel.tar.gz -C eisvogel
install -m644 eisvogel/eisvogel.latex ~/.pandoc/templates/eisvogel.latex
rm -rf eisvogel eisvogel.tar.gz
cd -
