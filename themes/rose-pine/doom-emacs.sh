REPO_DIR="/tmp/rose-pine/"
TARGET_DIR="$HOME/.config/doom/themes/"

git clone -q "https://github.com/donniebreve/rose-pine-doom-emacs.git" $REPO_DIR >/dev/null
mkdir -p $TARGET_DIR
cp -uf $REPO_DIR/*-theme.el $TARGET_DIR
rm -rf $REPO_DIR

sed -i "s/^(setq doom-theme "\'".\+)$/(setq doom-theme "\'"doom-rose-pine-dawn)/g" $HOME/.config/doom/config.el
